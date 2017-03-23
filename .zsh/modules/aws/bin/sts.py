#!/usr/bin/env python

"""Usage: sts.py --provider=<provider> --nicks=<nicks> --login=<login>

Get STS tokens via provider from AWS for login @ nick account

Options:
  --provider=<provider>           jc|gc|ad
  --nicks=<nicks>                 nicks
  --login=<login>                 your login

Only provider jc is implimented atm.
PingSSO or AD FS may follow if I'm bored.

"""
from docopt import docopt

import ConfigParser

import base64
import boto3
import getpass
import requests
import sys
import os

import xml.etree.ElementTree as ET

from bs4 import BeautifulSoup

def saml_assertion_get(nick, headers, data):
    """
    """

    sslverification = True
    idpentryurl = 'https://sso.jumpcloud.com/saml2/' + nick
    authurl     = 'https://sso.jumpcloud.com/auth'

    # Make Session
    session = requests.Session()

    # Start Auth
    r1 = session.get(idpentryurl, verify=sslverification, headers=headers)

    # Decode the response and extract the _xsrf token!
    soup = BeautifulSoup(r1.text.decode('utf8'), "html.parser")
    for tag in soup.find_all('input'):
        if tag.get('name') == '_xsrf':
            data["_xsrf"] = tag.get('value')

    # Login, Receive SAML
    r2 = session.post(
        authurl,
        verify=sslverification,
        headers=headers,
        data=data
    )

    # Decode the response and extract the SAML assertion
    soup = BeautifulSoup(r2.text.decode('utf8'), "html.parser")
    assertion = ''

    # Look for the SAMLResponse attribute of the input tag (determined by
    # analyzing the debug print lines above)
    for inputtag in soup.find_all('input'):
        if(inputtag.get('name') == 'SAMLResponse'):
            assertion = inputtag.get('value')

    return assertion

def awsroles_get(assertion):
    """
    """

    # Parse the returned assertion and extract the authorized roles
    awsroles = []
    root = ET.fromstring(base64.b64decode(assertion))

    for saml2attribute in root.iter('{urn:oasis:names:tc:SAML:2.0:assertion}Attribute'):
        if (saml2attribute.get('Name') == 'https://aws.amazon.com/SAML/Attributes/Role'):
            for saml2attributevalue in saml2attribute.iter('{urn:oasis:names:tc:SAML:2.0:assertion}AttributeValue'):
                awsroles.append(saml2attributevalue.text)

    # Note the format of the attribute value should be role_arn,principal_arn
    # but lots of blogs list it as principal_arn,role_arn so let's reverse
    # them if needed
    for awsrole in awsroles:
        chunks = awsrole.split(',')
        if 'saml-provider' in chunks[0]:
            newawsrole = chunks[1] + ',' + chunks[0]
            index = awsroles.index(awsrole)
            awsroles.insert(index, newawsrole)
            awsroles.remove(awsrole)

    return awsroles

def config_load(filename):
    """
    """

    config = ConfigParser.RawConfigParser()
    config.read(filename)

    return config

def aws_roles_process(awsroles, config, assertion, filename):
    """
    """

    region = 'us-east-1'
    outputformat = 'json'

    i=0
    for awsrole in awsroles:
        role_arn = awsroles[i].split(',')[0]
        principal_arn = awsroles[i].split(',')[1]
        i += 1

        account_id = role_arn.split(':')[4]
        role_name = role_arn.split(':')[5]

        profile_name = account_id + "-" + role_name

        client = boto3.client('sts')
        token = client.assume_role_with_saml(
            RoleArn=role_arn,
            PrincipalArn=principal_arn,
            SAMLAssertion=assertion
        )

        if not config.has_section(profile_name):
            config.add_section(profile_name)

            config.set(profile_name, 'output', outputformat)
            config.set(profile_name, 'region', region)
            config.set(profile_name, 'aws_access_key_id', token["Credentials"]["AccessKeyId"])
            config.set(profile_name, 'aws_secret_access_key', token["Credentials"]["SecretAccessKey"])
            config.set(profile_name, 'aws_session_token', token["Credentials"]["SessionToken"])

    with open(filename, 'w+') as configfile:
        config.write(configfile)

def main(args):
    """
    """

    filename = os.path.expanduser("~") + '/.aws/credentials'

    password = getpass.getpass()
    nicks = args['--nicks']
    headers = { 'User-agent': 'ua' }

    for nick in nicks.split(","):
        data = {
            "pathTo": "",
            "context": "sso",
            "redirectTo": "saml2/" + nick,
            "email": args['--login'],
            "password": password,
            "otp": ""
        }

        assertion = saml_assertion_get(nick, headers, data)
        awsroles = awsroles_get(assertion)
        config = config_load(filename)
        aws_roles_process(awsroles, config, assertion, filename)

if __name__ == '__main__':
    arguments = docopt(__doc__, options_first=True, version="0.0.1")
    sys.exit(main(arguments))
