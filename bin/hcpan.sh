#!/bin/sh

for mod in CPAN Template LWP::UserAgent JSON MIME::Lite; do
  cpan -T $mod
done
