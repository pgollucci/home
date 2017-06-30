#!/usr/bin/env python

"""Usage: sts_map.py [-dhv] <mapper>

Proccess aws config and credential files remapping unfriendly saml profile
names to friendly names using json <mapper> for mapping.

Arguments:
  mapper               name relative to ~/.aws/map-<mapper>

Options:
  -d --debug=LEVEL     debug mode LEVEL 1...9 [default: 0]
  -h --help            display help
  -v --verbose         verbose mode

"""
from docopt import docopt

import configparser

import json
import re
import sys

from os.path import expanduser
from os.path import isfile

def rename_section(cp, section_from, section_to):
    """
    """

    items = cp.items(section_from)

    cp.remove_section(section_from)
    cp.remove_section(section_to)
    cp.add_section(section_to)

    for item in items:
        cp.set(section_to, item[0], item[1])

def lookup_account_map(section, table):
    """
    """

    section = section.replace("profile ", "")

    pieces = section.split('-')
    if len(pieces) == 2:
        account_id = pieces[0]
        role_name = pieces[1]
    else:
        return section

    friendly = table[account_id]

    return friendly + "+" + role_name

def remap(filename, table):
    """
    """

    if not isfile(filename):
        return

    config = configparser.RawConfigParser()
    config.read(filename)

    for section in config.sections():
        if not section == "DEFAULT" and not section == "saml_provider":
            friendly = lookup_account_map(section, table)
            rename_section(config, section, friendly)

    with open(filename, 'w+') as configfile:
        config.write(configfile)

def main(args):
    """
    """

    home = expanduser("~")
    map_file  = home + '/.aws/map-'
    cred_file = home + '/.aws/credentials'
    conf_file = home + '/.aws/config'

    map_file = map_file + args["<mapper>"]

    with open(map_file, 'r') as afile:
        account_map = json.load(afile)

    for cfile in [cred_file, conf_file]:
        remap(cfile, account_map)

if __name__ == "__main__":
    arguments = docopt(__doc__, options_first=True, version="0.0.1")
    if int(arguments["--debug"]) > 1:
        print(arguments)
    sys.exit(main(arguments))
