#!/usr/bin/python

import re
import ConfigParser
from os.path import expanduser

accounts = {
    '346733622331': 'p6',
    '704382739352': 'p6c1',
    '363120648369': 'p6me'
}

def rename_section(cp, section_from, section_to):
    items = cp.items(section_from)

    cp.remove_section(section_from)
    cp.remove_section(section_to)
    cp.add_section(section_to)

    for item in items:
        cp.set(section_to, item[0], item[1])

def lookup_account_map(section):
    pieces = section.split('-')
    if len(pieces) == 2:
        account_id = section.split('-')[0]
        role_name = section.split('-')[1]
    else:
        return section

    friendly = accounts[account_id]

    return friendly + role_name

awsconfigfile = '/.aws/credentials'

home = expanduser("~")
filename = home + awsconfigfile

config = ConfigParser.RawConfigParser()
config.read(filename)

for section in config.sections():
    if not section == "default":
        match = re.search('-', section)
        if match:
            friendly = lookup_account_map(section)
            rename_section(config, section, friendly)

with open(filename, 'w+') as configfile:
    config.write(configfile)
