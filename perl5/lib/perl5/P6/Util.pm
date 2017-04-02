package P6::Util;

## core
use strict;
use warnings FATAL => 'all'; no warnings qw(redefine);
use Carp;

## mp2

## libapreq2

## dist
use File::Path ();
use POSIX ();

## cpan
#use Net::CIDR::Lite ();
use CGI::Util ();

## custom
use P6::Const ();
use P6::Cmd ();
use P6::IO ();
use P6::DT ();

## version
our $VERSION = q$Revision: 50616 $;

## constants

## globals
our $Debug = 0;
our $Verbose = 0;
our $Execute = 1;

sub msg          { print STDOUT $_[0]                                       }
sub error        { print STDERR "ERROR: $_[0]"                              }
sub debug_dumper { use Data::Dumper; print STDERR "DEBUG: $_[0] - " . Dumper $_[1] if $Debug  }
sub debug        { print STDERR "DEBUG: $_[0]"          if $Debug           }
sub verbose      { print STDOUT "VERBOSE($_[0]): $_[1]" if $Verbose > $_[0] }

sub clear { execute("clear") }

sub delay { sleep shift }

sub Die { die shift }

sub sed {
    my $regexes = shift;
    my $file    = shift;

    my $replacements = join "' -e '", @$regexes;

    execute("$P6::Cmd::SED_I -e '$replacements' $file");
}

sub version_compare {
    my $v1 = shift;
    my $v2 = shift;

    $v1 ||= "";
    $v2 ||= "";

    $v1 =~ s/\-/./; $v1 =~ s/[a-zA-Z]//g;
    $v2 =~ s/\-/./; $v2 =~ s/[a-zA-Z]//g;

    my @t1 = split /\./, $v1;
    my @t2 = split /\./, $v2;

    while (@t1 && @t2) {
	my $cmp = shift @t1 <=> shift @t2;
	return $cmp if $cmp;
    }

    return @t1 <=> @t1;
}

my $cwd = "";
sub execute {

    my ($dir, $cmd, $args);
    if (@_ == 1) {
	($cmd) = @_;
    }
    elsif (@_ == 2) {
	if (ref $_[1] eq 'HASH') {
	    ($cmd, $args) = @_;
	}
	else {
	    ($dir, $cmd) = @_;
	}
    }
    elsif (@_ == 3) {
	($dir, $cmd, $args) = @_;
    }
    else {
	# ; invalid call
    }

    if ($dir && $dir ne '') {
	$cwd = $dir;
	print STDOUT "cd $dir\n" unless $args->{silent} && $args->{slient} == 1;
    }

    print STDOUT "$cmd\n" unless $args->{silent} && $args->{silent} == 1;

    if ($Execute) {
	if ($args->{output} && $args->{output} == 1) {
	    qx/cd $dir/ if $dir && $dir ne '';
	    my $output = qx/$cmd/;

	    return wantarray ? (1, $output) : 1
	}
	else {
	    unless ((system($cmd) == 0)) {
		error("$?\n");
		return 0;
	    }
	    else {
		return 1;
	    }
	}
    }
    else {
	return 1;
    }
}

sub mkdirp {
  my $path = shift;

  P6::Util::debug("$path\n");
  File::Path::make_path $path;
}

sub ltrim { s/^\s+//        };
sub rtrim { s/\s+$//        };
sub  trim { s/^\s+|\s+$//g  };

sub lprint {
    my ($total, $str) = @_;

    my $length = length $str;
    my $diff   = $total - $length > 0 ? $total - $length : 0;

    return (' ' x $diff) . $str
}

sub rprint {
    my ($total, $str) = @_;

    my $length = length $str;
    my $diff = $total - $length > 0 ? $total - $length : 0;

    return $str . (' ' x $diff);
}

sub h_2_str {
    my ($h) = @_;

    my $str = "";
    foreach my $k (sort keys %$h) {
	my $v = $h->{$k};

	if (ref $v eq 'HASH') {
	    $str .= h_2_str($v);
	}
	elsif (ref $v eq 'ARRAY') {
	    $str .= "-" . join '~', @$v;
	}
	else {
	    $str .= "-$v";
	}
    }

    return $str;
}

sub file_2_hash {
    my ($f, $vars, $case) = @_;

    my $lines = P6::IO::dread($f, nofail => 1);
    foreach my $line (@$lines) {
	next if $line =~ /^\#|^\W*$/;

	my ($key, $value) = split /[:=]/, $line, 2;
	if ($case) {
	    if ($case eq 'U') {
		$key = uc $key;
	    }
	    else {
		$key = lc $key;
	    }
	}
	s/^\s+//, s/\s+$// for ($key, $value);

	$vars->{$key} = $value;
    }

    $vars;
}

sub stack_trace {

    my $str = "";

    my $i = 0;
    while (my ($package, $filename, $line, $subroutine, $hasargs, $wantarray, $evaltext, $is_require, $hints, $bitmask) = caller($i++)) {
	$str .= "$filename\:\:$subroutine\:\:$line\n";
    }

    return $str;
}

sub dbcred_load {
    my ($f) = @_;

    my %db;
    file_2_hash($f, \%db);
    $db{attrs} = \%P6::DB::db_attrs;

    return \%db;
}

sub unique {
    my $a = shift;

    my %h = map { $_ => 1 } @$a;

    return [keys %h];
}

sub sum {
    my ($o) = @_;

    my $t = 0;

    $t += $_ foreach (values %$o);

    return $t;
}

sub daemonize {
    my ($pidfile, $logfile, $path) = @_;

    chdir '/'                               or die "Can't chdir to /: $!";
    open STDIN, '/dev/null'                 or die "Can't read /dev/null: $!";
    open STDOUT, '>>', $logfile             or die "Can't write to $logfile: $!";
    defined(my $pid = fork)                 or die "Can't fork: $!";
    P6::IO::dwrite($pidfile, \$pid), exit if $pid;
    POSIX::setsid()                         or die "Can't start a new session: $!";
    umask 0;                                # set sane umask
    open STDERR, '>&STDOUT'                 or die "Can't dup stdout: $!";

    print STDERR P6::DT::now(), ": daemonizing\n";

    $SIG{HUP} = sub {
	print STDERR "restart: $pid\n";
	exec "$path", qw(restart);
    };

    return;
}

sub filedescs {
    my $logfile = shift;

    close STDOUT;
    close STDERR;

    open STDOUT, '>>', $logfile;
    open STDERR, '>&STDOUT';

    return;
}

sub pkg_2_file {
    my $pkg = shift;

    my $file = $pkg;
    $file =~ s!::!/!g;
    $file .= ".pm";

    $file;
}

sub my_require {
    my ($p, %args) = @_;

    my $f = P6::Util::pkg_2_file($p);
    $f =~ /(.*)/; $f = $1;
    eval { require $f };
    P6::Util::Die($@) if $@;
    $f->import() if $args{import};

    return;
}

sub range { (P6::DT::custom(w => $_[0], s => 1), P6::DT::custom(w => $_[0], e => 1)) }

1;
