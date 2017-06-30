#!/bin/sh

cpan -T Log::Log4perl
cpan -T CPAN
cpan -T Template \
     LWP::UserAgent \
     JSON \
     MIME::Lite
