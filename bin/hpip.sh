#!/bin/sh

pip install virtualenv
pyenv rehash

rm -rf $HOME/.repos/langs/pyenv/venvs/home
virtualenv $HOME/.repos/langs/pyenv/venvs/home
. $HOME/.repos/langs/pyenv/venvs/home/bin/activate

pip install boto3
pip install docopt
pip install infi.docopt-completion
pip install ConfigParser
pip install bs4
pip install requests
pyenv rehash
