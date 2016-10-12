#!/usr/bin/perl -w

# core
use strict;
use warnings FATAL => 'all';

# load local libs
use FindBin qw($Bin);
use lib "$Bin/../dev/lib/perl5";

# run clis
use P6::CLI ();

# cli's libs
use P6::Games::Craps ();

# custom args w/ defaults
my $Start = 300;
my $Delay = 0;

#  globals
our $VERSION = "0.0.1";

exit P6::CLI->run();

sub work {

    return P6::Games::Craps->new(start => $Start, delay => $Delay)->play();
}

sub getopts {
    {
	"start=i" => \$Start,
	"delay=s" => \$Delay,
    }
}

sub valid_args { 0 }
