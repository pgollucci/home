#!/bin/sh

cpan -T Log::Log4perl
cpan -T HTTP::Date
cpan -T YAML
cpan -T CPAN
cpan -T Template \
     LWP::UserAgent \
     JSON \
     MIME::Lite \
     Text::Replace

plenv rehash
