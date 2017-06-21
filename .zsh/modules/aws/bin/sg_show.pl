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
use P6::AWS::EC2::VPC::SG ();

## Custom Args w/ defaults
our $SecurityGroupId = "";

## Custom Constants

## Globals

## Functions
sub valid_args {

    my $errors = 0;

    $errors++, P6::Util::error("--security-group-id=<sgid> is required\n") unless $SecurityGroupId;

    $errors;
}

sub getopts {

    {
	"security-group-id=s" => \$SecurityGroupId,
    }
}

# main()
MAIN: { exit P6::CLI->run() }

# Entry Point
sub work {

  P6::AWS::EC2::VPC::SG->new(security_group_id => $SecurityGroupId)->display();

  return P6::Const::EXIT_SUCCESS;
}

__END__

=head1 NAME

sg_show.pl - Display A Security Group for HUMANS

=head1 SYNOPSIS

sg_show.pl --security-group-id=<sgid> [--debug] [--verbose [1-4]] [--no-execute] | --version | --help

=head1 OPTIONS

=over 4

=item B<--security-group-id=<sgid>>

Display this group [REQUIRED]

=back

=head1 DESCRIPTION

Displays the requested security group for humans

=heaad1 AUTHOR

Philip M. Gollucci E<lt><pgollucci@p6m7g8.com>E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2017 Philip M. Gollucci

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
