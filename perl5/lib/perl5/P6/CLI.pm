package P6::CLI;

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## mp2

## libapreq2

## dist
use Getopt::Long ();
use Pod::Usage ();

## cpan

## custom
use P6::Const ();
use P6::Util ();

## version
our $VERSION = q$Revision: 33497 $;

## constants

## globals
our $Force = 0;
our $Help = 0;
our $Version = 0;

our $PROGNAME = $0;

sub run {
    my $class = shift;

    local $SIG{__WARN__} = \&Carp::cluck;
    local $SIG{__DIE__}  = \&Carp::confess;

    getopts() or return P6::Const::EXIT_FAILED_INVALID_ARGS_OR_ENV;

    if ($Help) {
        Pod::Usage::pod2usage(-verbose => 1);
        return P6::Const::EXIT_SUCCESS;
    }

    if ($Version) {
        print $PROGNAME . " - v" . $::VERSION . "\n\n";
        return P6::Const::EXIT_SUCCESS;
    }

    unless (valid_args()) {
        Pod::Usage::pod2usage(-verbose => 1);
        return P6::Const::EXIT_FAILED_INVALID_ARGS_OR_ENV;
    }

    return ::work();
}

sub getopts {

    {
      no strict 'refs';
      my $func = "main::skip_getopts";
      return 1 if defined *$func && &$func();
    }

    my $custom_opts = ::getopts();

    my $rv =
        Getopt::Long::GetOptions(
                                 "debug"      => \$P6::Util::Debug,
                                 "no-execute" => sub { $P6::Util::Execute = 0 },
                                 "verbose=i"  => \$P6::Util::Verbose,
                                 "help"       => \$Help,
                                 "version"    => \$Version,
                                 "force"      => \$Force,

                                 %$custom_opts,
                                );

    Pod::Usage::pod2usage(-verbose => 1) unless $rv;

    return $rv ? 1 : 0;
}

sub valid_args {

    {
      no strict 'refs';
      my $func = "main::skip_validate_args";
      return 1 if defined *$func && &$func();
    }

    my $errors = 0;

    ## --no-execute implies --verbose=1 unless verbose is set higher already
    $P6::Util::Verbose ||= 1 unless $P6::Util::Execute;

    $errors += ::valid_args();

    return $errors > 0 ? 0 : 1;
}

1;
