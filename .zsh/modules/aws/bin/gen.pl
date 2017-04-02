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

## Me
use P6::AWS::Lib ();

## Custom Args w/ defaults

## Custom Constants

##  Functions
sub skip_validate_args { 1 }

sub getopts { {} }

## main()
MAIN: {
  exit P6::CLI->run();
}

## Entry Point
sub work {

  return P6::AWS::Lib->generate();
}
