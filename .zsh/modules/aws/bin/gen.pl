#!/usr/bin/env perl

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## Std

## CPAN

## Globals

## SDK
use P6::CLI ();
use P6::Util ();

## Me
use P6::AWS::SGen ();

## Custom Args w/ defaults
our $OutputDir = "";
our $Service   = "";
our $Cmd       = "";

## Custom Constants

## Globals

## Functions
sub valid_args {

    my $errors = 0;

    $errors++, P6::Util::error("--outputdir=<dir> is required\n") unless $OutputDir;

    $errors;
}

sub getopts {

    {
	"outputdir=s" => \$OutputDir,
	"service=s"   => \$Service,
	"cmd=s"       => \$Cmd,
    }
}

# main()
MAIN: { exit P6::CLI->run() }

# Entry Point
sub work { P6::AWS::SGen::generate(outputdir => $OutputDir, service => $Service, cmd => $Cmd) }

__END__

=head1 NAME

gen.pl - AWS Shell Generator

=head1 SYNOPSIS

gen.pl --outputdir=<dir> [--service=<service>] [--cmd=<cmd>]
	[--debug] [--verbose [1-4]] [--no-execute]
gen.pl --version
gen.pl --help

 Options:
    --outputdir        output results to <dir>
    --service          only deal with <service>
    --cmd              only deal with <cmd>

=head1 OPTIONS

=over 4

=item B<--outputdir=<dir>>

Will write out shell code to <dir>/<service>/item_verb.sh

=item B<--service=<service>>

Only deal with <service>

=item B<--cmd=<cmd>>

Only deal with <cmd>

=back

=head1 DESCRIPTION

Parses `aws help` manpages (poorly) and generates shell code for the services, cmds, and items.

=heaad1 AUTHOR

Philip M. Gollucci E<lt><pgollucci@p6m7g8.com>E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2017 Philip M. Gollucci

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
