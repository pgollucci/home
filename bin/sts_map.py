#!/usr/bin/env python

import re
import ConfigParser
import json
from os.path import expanduser
from os.path import isfile

def rename_section(cp, section_from, section_to):
    items = cp.items(section_from)

    cp.remove_section(section_from)
    cp.remove_section(section_to)
    cp.add_section(section_to)

    for item in items:
        cp.set(section_to, item[0], item[1])

def lookup_account_map(section, table):
    pieces = section.split('-')
    if len(pieces) == 2:
        account_id = pieces[0]
        role_name = pieces[1]
    else:
        return section

    friendly = table[account_id]

    return friendly + role_name

def remap(filename, table):
    if not isfile(filename):
        return

    config = ConfigParser.RawConfigParser()
    config.read(filename)

    for section in config.sections():
        if not section == "default":
            match = re.search('-', section)
            if match:
                friendly = lookup_account_map(section, table)
                rename_section(config, section, friendly)

    with open(filename, 'w+') as configfile:
        config.write(configfile)

def main():
    home = expanduser("~")
    map_file  = home + '/.aws/p6-map'
    cred_file = home + '/.aws/credentials'
    conf_file = home + '/.aws/config'

    with open(map_file, 'r') as afile:
        account_map = json.load(afile)

    for cfile in [cred_file, conf_file]:
        remap(cfile, account_map)

if __name__ == "__main__":
    main()
