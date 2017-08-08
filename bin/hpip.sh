#!/bin/sh -x

pyenv virtualenv 3.6.2 home
pyenv local 3.6.2/envs/home

pip install virtualenv
pip install awscli
pip install docopt
pip install infi.docopt-completion
pip install configparser
pip install bs4
pip install requests

pyenv rehash
