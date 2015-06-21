#!/bin/sh -x

sudo poudriere jail -d -j 101i386
sudo poudriere jail -d -j 101amd64
sudo poudriere jail -d -j 110amd64
sudo poudriere jail -d -j 110i386

sudo poudriere jail -c -j 101i386  -v 10.1-RELEASE -a i386
sudo poudriere jail -c -j 101amd64 -v 10.1-STABLE  -a amd64
sudo poudriere jail -c -j 110amd64 -v 11.0-CURRENT -a amd64
sudo poudriere jail -c -j 110i386  -v 11.0-CURRENT -a i386
