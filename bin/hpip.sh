#!/bin/sh -x

pyenv virtualenv 3.6.1 home
pyenv local 3.6.1/envs/home

pip install virtualenv
pip install boto3
pip install docopt
pip install infi.docopt-completion
pip install ConfigParser
pip install bs4
pip install requests

pyenv rehash
