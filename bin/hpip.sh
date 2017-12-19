#!/bin/sh -x

main() {

    . bin/.hvers

    pyenv virtualenv $py_ver home
    pyenv local $py_ver/envs/home

    pip install virtualenv
    pip install awscli
    pip install boto3
    pip install docopt
    pip install infi.docopt-completion
    pip install configparser
    pip install bs4
    pip install requests

    pyenv rehash
}

main "$@"
exit $?
