package P6::Manage::Run;

## core
use strict;
use warnings FATAL => 'all'; no warnings qw(redefine);
use Carp;

## mp2

## libapreq2

## dist
use Fcntl ();
use IO::Select ();
use Time::HiRes ();

## cpan

## custom
use P6::Util ();
use P6::Const ();

## version
our $VERSION = q$Revision: 34405 $;

## constants
use constant PORT_SSH => 22;
use constant EXIT_INT => 99;

## globals
our $LOCK;

my %cmds = (
           );

our %tasks = (
             );

sub w (@) { P6::Util::verbose(-1, join('', @_, "\n")) }

sub repwait {
    my ($msg, $ref) = @_;

    my $count = keys %$ref;
    my $plural = $count == 1 ? '' : 's';
    P6::Util::verbose(-1, "[ $msg $count command$plural to finish ]\n");

    return;
}

# sort hostnames such that app10 goes after app9, etc.
sub csrt ($$) {
    my ($x, $y) = @_;

    my ($xw, $xn, $xe) = $x =~ /^(\D+)(\d+)(.*)/;
    my ($yw, $yn, $ye) = $y =~ /^(\D+)(\d+)(.*)/;
    return defined($xw) && defined($yw) && defined($xn) && defined($yn) ?
        ($xe cmp $ye) || ($xw cmp $yw) || ($xn <=> $yn) :
        ($x cmp $y);
}

sub pexec_core {
    my %args = @_;

    my $t0 = Time::HiRes::time();

    my $ocmd = $args{cmd};
    my $idx;
    my %pids = map {
        my $cmd = $ocmd;
        $cmd =~ s/%h%/$_/g;

        doit(
             where      => $_,
             timeout    => $args{timeout},
             serial     => $args{serial},
             verbose    => $args{verbose},
             unbuffered => $args{unbuffered},
             commands   => [$cmd],
             idx        => ++$idx,
            )
    } @{$args{hosts}};

    $SIG{'INFO'} = sub { repwait('Waiting for', \%pids); }
    if exists $SIG{'INFO'};
    $SIG{'INT'}  = sub { repwait('Exiting with', \%pids); exit(1); }
    if exists $SIG{'INT'};

    my @failed;
    if ($args{serial}) {
        @failed = values %pids;
        %pids = ();
    }

    my $total = my $procs = keys %pids;
    if ($procs) {
        while ((my $pid = wait()) != -1) {
            $procs--, push @failed, $pids{$pid} if $?;
            delete $pids{$pid};
        }
    }
    if ($args{serial}) {
        $total = @{$args{host}};
        $procs = $total - @failed;
    }

    w sprintf(
              "$0: %d host%s completed (%d total) in %.1f sec.",
              $procs, $procs == 1 ? '' : 's', $total, Time::HiRes::time() - $t0
             );

    w "HOSTS FAILED: @failed" if @failed;

    return !@failed;
}

sub pexec {
    my %args = @_;

    my $exec = join ' ', map { exists $cmds{$_} ? $cmds{$_} : $_ } 
        @{$args{args}};

    my $quiet = $args{quite}    ? "-q" : "";
    my $term  = $args{terminal} ? "-t" : "";
    my $pty   = $args{terminal} ? "apu/pty -ie -t $args{timeout} --" : "";
    my $stdin = $args{stdin}    ? "<$args{stdin}" : "";

    my ($cmd, $cmd2);
    if ($exec =~ /^sudoscp:/) {
        my ($j, $from, $to) = split /:/, $exec;
        my $t = "/tmp/rwsdo.tmp";
        $cmd = "scp -Bp $quiet $from $args{user}\@%h%:$t";
        $cmd2 = qq{$pty ssh -A $term $quiet $args{ssh_opt} $args{user}\@%h% "sudo sh -c 'cat $t > $to'; rm -f $t"}
    }
    elsif ($exec =~ /^scp:/) {
        my ($j, $from, $to) = split /:/, $exec;
        $cmd = "scp -Bp $quiet $from $args{user}\@%h%:$to";
    }
    elsif ($exec =~ /^scpr:/) {
        my ($j, $to, $from) = split /:/, $exec;
        $cmd = "scp -Bp $quiet $args{user}\@%h%:$from /tmp/%h%";
    }
    else {
        $cmd = "$pty ssh -A $term $quiet $args{ssh_opt} $args{user}\@%h% '$exec'";
    }

    my $rv = pexec_core(%args, cmd => $cmd);
    pexec_core(%args, cmd => $cmd2) if $exec =~ /^sudoscp:/ and $rv;

    return $rv;
}

sub reader {
    my ($fh, $unbuffered) = @_;
    if ($unbuffered) {
        my $s = IO::Select->new($fh);
        $_ = "";
        while (sysread $fh, $_, 4096, length) {
            last unless $s->can_read(0);
        }
        return length;
    }
    else {
        return defined($_ = <$fh>);
    }
}

sub doit {
    my %args = @_;

    my $pid = $args{serial} ? 0 : fork();
    local $_;

    if ($pid) {
        # parent
        return $pid, $args{where};
    }
    elsif ($pid == 0) {
        # child
        my @status;
        foreach my $cmd (@{$args{commands}}) {
            w "[$$] $args{where}: $cmd" if $args{verbose};

            my @out;
            open my $fh, "$cmd 2>&1 |"
                or die "can't popen $cmd: $!";

            while (reader($fh, $args{unbuffered})) {
                for (split /(?<=\n)/) {
                    $_ .= "\n" if substr($_, -1) ne "\n";
                    if ($args{unbuffered}) {
                        my $string = P6::Util::lprint(P6::Util::maxhostlen(), "$args{where}:") . " $_";
                        my $n = 0;
                        do {
                            my $b = syswrite STDOUT, substr($string, $n);
                            die "syswrite failed: $!" unless $b;
                            $n += $b;
                        } while ($n < length $string);
                    }
                    else {
                        push @out, P6::Util::lprint(P6::Util::maxhostlen(), "$args{where}:"), " $_";
                    }
                }
            }
            if (!close $fh) {
                push @status, $? if $?;
            }
            if (@out) {
                flock($LOCK, &Fcntl::LOCK_EX) or P6::Util::error("couldn't flock: $!\n");
                print @out;
                flock($LOCK, &Fcntl::LOCK_UN) or P6::Util::error("couldn't un-flock: $!\n");
            }
        }

        return @status ? ($args{idx}, $args{where}) : () if $args{serial};
        exit @status ? P6::Const::EXIT_FAILED : P6::Const::EXIT_SUCCESS;
    }
    else {
        warn "fork() failed: $!\n";
        return;
    }
}

1;
