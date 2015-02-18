#!/usr/bin/env perl

# core
use strict;
use warnings FATAL => 'all';
use Carp;

use Getopt::Long ();
use FindBin qw($Bin);
use Pod::Usage ();

use JSON::Parse;

# Std Args with Defaults
my $Force    = 0;
my $Help     = 0;
my $Version  = 0;
my $Debug    = 0;
my $Verbose  = 0;
my $Execute  = 0;
my $PROGNAME = $0;

# Custom Args with Defaults
my $File = "";
my $N = 5;

use constant EXIT_FAILED                     => -1;
use constant EXIT_SUCCESS                    => 0;
use constant EXIT_FAILED_INVALID_ARGS_OR_ENV => 1;

## Globals
our $path = "$Bin/..";

sub main() {
    local $SIG{__WARN__} = \&Carp::cluck;
    local $SIG{__DIE__}  = \&Carp::confess;

    getopts() or return EXIT_FAILED_INVALID_ARGS_OR_ENV;

    if ($Help) {
        Pod::Usage::pod2usage(-verbose => 1);
        return EXIT_SUCCESS;
    }

    if ($Version) {
        print_list_items $PROGNAME . " - v" . $::VERSION . "\n\n";
        return EXIT_SUCCESS;
    }

    unless (valid_args()) {
        Pod::Usage::pod2usage(-verbose => 1);
        return EXIT_FAILED_INVALID_ARGS_OR_ENV;
    }

    return work();
}

sub error   { print STDERR "ERROR: $_[0]"                              }
sub debug   { print STDERR "DEBUG: $_[0]"          if $Debug           }
sub verbose { print STDOUT "VERBOSE($_[0]): $_[1]" if $Verbose > $_[0] }

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
        unless ((system($cmd) == 0)) {
            error("$?\n");
            return 0;
        }
        else {
            return 1;
        }
    }
    else {
        return 1;
    }
}

sub getopts {

    {
      no strict 'refs';
      my $func = "main::skip_getopts";
      return 1 if defined *$func && &$func();
    }

    my $rv =
        Getopt::Long::GetOptions(
            "debug"      => \$Debug,
            "execute"    => \$Execute,
            "verbose=i"  => \$Verbose,
            "help"       => \$Help,
            "version"    => \$Version,
            "force"      => \$Force,

            "file=s"     => \$File,
            "n=i"        => \$N,
        );

    Pod::Usage::pod2usage(-verbose => 1) unless $rv;

    return $rv ? 1 : 0;
}

sub valid_args {

    my $errors = 0;

    error("--File=s is required\n"), $errors++ if $File eq '';
    error("--N=i >=2 is required\n"), $errors++ if $N eq '' || $N < 2;

    return $errors >= 1 ? 0 : 1;
}

sub rprint {
    my ($total, $str) = @_;

    my $length = length $str;
    my $diff   = $total - $length;

    return (' ' x $diff) . $str;
}

sub work {

    open my $fh, '<', $File or error("can't open [$File] b/c $!\n");

    while (!eof) {
        my @rollup = ();
        foreach my $i (0..$N-1) {
            my @columns = split /,/, <$fh>;

            my $j = 0;
            foreach my $col (@columns) {
                $rollup[$j] += $col;
                $j++;
            }
            last if eof;
        }

        print join ",", @rollup;
        print "\n";
    }

    close $fh or error("can't close [$File] b/c $!\n");

    return EXIT_SUCCESS;
}

exit main();
