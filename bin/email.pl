#!/usr/bin/env perl

# core
use strict;
use warnings FATAL => 'all';
use Carp;

use Getopt::Long ();
use File::Find ();
use FindBin qw($Bin);
use MIME::Lite ();
use Pod::Usage ();

# Std Args with Defaults
my $Force    = 0;
my $Help     = 0;
my $Version  = 0;
my $Debug    = 0;
my $Verbose  = 0;
my $Execute  = 1;
my $PROGNAME = $0;

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

sub msg          { print STDOUT $_[0]                                       }
sub error        { print STDERR "ERROR: $_[0]"                              }
sub debug_dumper { use Data::Dumper; print STDERR "DEBUG: $_[0] - " . Dumper $_[1] if $Debug  }
sub debug        { print STDERR "DEBUG: $_[0]"          if $Debug           }
sub verbose      { print STDOUT "VERBOSE($_[0]): $_[1]" if $Verbose > $_[0] }

sub getopts {

    {
      no strict 'refs';
      my $func = "main::skip_getopts";
      return 1 if defined *$func && &$func();
    }

    my $rv =
        Getopt::Long::GetOptions(
            "debug"      => \$Debug,
            "no-execute" => sub { $Execute = 0 },
            "verbose=i"  => \$Verbose,
            "help"       => \$Help,
            "version"    => \$Version,
            "force"      => \$Force,
        );

    Pod::Usage::pod2usage(-verbose => 1) unless $rv;

    return $rv ? 1 : 0;
}

sub valid_args {

    my $errors = 0;

    ## --no-execute implies --verbose=1 unless verbose is set higher already
    $Verbose ||= 1 unless $Execute;

    return $errors > 1 ? 0 : 1;
}

sub email {
    my %args = @_;

    my $email = MIME::Lite->new( Type => 'multipart/mixed' );

    $email->add(To      => $args{to});
    $email->add(CC      => $args{cc});
    $email->add(BCC     => $args{bcc}) if exists $args{bcc};
    $email->add(From    => $args{from});
    $email->add(Subject => $args{subject});

    $args{cc} ||= '';
    $args{bcc} ||= '';
    debug("E-Mail: to[$args{to}], cc[$args{cc}], bcc[$args{bcc}], from[$args{from}], subject[$args{subject}]\n");

    foreach my $attachment (@{$args{attachments}}) {
      $email->attach(%$attachment)
    }
    eval { $email->send('smtp', 'smtp.prod.rws', Debug => ($Verbose >= 4) ) };

    return $@;
}

sub work {

  return email(
		  to => $ARGV[0],
		from => $ARGV[1],
             subject => $ARGV[2],
	 );

}

exit main();
