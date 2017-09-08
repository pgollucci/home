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
use P6::AWS::ELB ();

## Custom Args w/ defaults
our $ElbName = "";

## Custom Constants

## Globals

## Functions
sub valid_args {

    my $errors = 0;

    $errors++, P6::Util::error("--elb-name=<elb_name> is required\n") unless $ElbName;

    $errors;
}

sub getopts {

    {
	"elb-name=s" => \$ElbName,
    }
}

# main()
MAIN: { exit P6::CLI->run() }

# Entry Point
sub work {

  P6::AWS::ELB->new(elb_name => $ElbName)->display();

  return P6::Const::EXIT_SUCCESS;
}

__END__

=head1 NAME

lb_listener.pl - Display ELB Listeners for HUMANS

=head1 SYNOPSIS

lb_listener.pl --elb-name=<elb_name> [--debug] [--verbose [1-4]] [--no-execute] | --version | --help

=head1 OPTIONS

=over 4

=item B<--elb-name=<elb_name>>

Display this ELB's Listeners/Policies [REQUIRED]

=back

=head1 DESCRIPTION

Displays the requested elb listeners for humans

=heaad1 AUTHOR

Philip M. Gollucci E<lt><pgollucci@p6m7g8.com>E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2017 Philip M. Gollucci

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
