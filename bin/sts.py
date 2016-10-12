#!/usr/bin/python

import sys
import boto.sts
import boto.s3
import requests
import getpass
import ConfigParser
import base64
import xml.etree.ElementTree as ET
from bs4 import BeautifulSoup
from os.path import expanduser
from urlparse import urlparse, urlunparse
from requests_ntlm import HttpNtlmAuth

##########################################################################
# Variables

# region: The default AWS region that this script will connect
# to for all API calls
region = 'us-east-1'

# output format: The AWS CLI output format that will be configured in the
# saml profile (affects subsequent CLI calls)
outputformat = 'json'

# awsconfigfile: The file where this script will store the temp
# credentials under the saml profile
awsconfigfile = '/.aws/credentials'

# SSL certificate verification: Whether or not strict certificate
# verification is done, False should only be used for dev/test
sslverification = True

# idpentryurl: The initial URL that starts the authentication process.
idpentryurl = 'https://accounts.google.com/o/saml2/initsso?idpid=C0237ok4z&spid=287993144883&forceauthn=false'

##########################################################################

# Get the federated credentials from the user
#username = raw_input()
#password = getpass.getpass()
username='pgollucci@p6m7g8.com'
password='pgabc123!'

# Initiate session handler
session = requests.Session()

# Programatically get the SAML assertion
# Set up the NTLM authentication handler by using the provided credential
session.auth = HttpNtlmAuth(username, password, session)

user_agent = {'User-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36'}
cookies = {
  'GALX': '0MR3vsc-yoc',
  'ACCOUNT_CHOOSER': 'AFx_qI5__tRrap-XsHRdEdXwYmFyJ65ZGIWbDAgTUubsA-insGNprYo9_uLqZGo_XlZk1ldsd2JIRoUn7VPbUYPdeQWMXItFTFtEmoB5Kqf_4l1dci5OCXPfExz7IaVOjfobTyYtlweqg3Di3-CqDJ5-VkMHrhzjKw',
  'GMAIL_RTT': '286',
  'GAPS': '1:XuAPDl7O-NCLmgKPoT9wd0LZ0ACVWQ:PxYhXUoT9T-pLz6Y',
  'SID': '1ANaoCYjMwIXGEB4wznLI_MqrPu9n-aa7mmlaWKVQjeliE5SccD3Dp0DUnB8m3Ea9aXw5Q.',
  'LSID': 'mail|o.mail.google.com|s.youtube|ss:1ANaoPyfvBn-rVhwmxOict9pfkpsRV1v5tcKQhOgf7qFjhTyLUWsgB1rx6XztyWxU-3YqA.',
  'HSID': 'ANPkjPmCNYboiBKUs',
  'SSID': 'ARqT-Mff-g8SY0IzB',
  'APISID': '8CFCl0B2N_fjPRzy/ALeWRrvRNbSIuYoQ1',
  'SAPISID': '0Waj1keUYkb5y_XJ/A6qtJ9xu4Zt2q0Vsj',
  'NID': '87=Voj755zbCCzrXnM8rs4VL3yYyN-bNpJJhZInDk_xlqTOamBtoXzC3unuS8hkj68aSqoSrL_-bovgA4cJ-U6SKrSx0VrQ3oaw5KhzYZkp1WChgm6_pfShyrQv5Fb8_YkDa8dBeob9tBomRKZx_cVptjfHyAALUp5Fp0p14wzzWhBlN4-YF8wy9VpO2jKOiA-jmE0tq3xadzxidb4g3tcBpPWQmcYv7IKSsws'
}

# Opens the initial AD FS URL and follows all of the HTTP302 redirects
response = session.get(idpentryurl, verify=sslverification, headers = user_agent, cookies=cookies)

# Debug the response if needed
#print (response.text)

# Overwrite and delete the credential variables, just for safety
username = '##############################################'
password = '##############################################'
del username
del password

# Decode the response and extract the SAML assertion
soup = BeautifulSoup(response.text.decode('utf8'), "html.parser")
assertion = ''

# Look for the SAMLResponse attribute of the input tag (determined by
# analyzing the debug print lines above)
for inputtag in soup.find_all('input'):
    if(inputtag.get('name') == 'SAMLResponse'):
        #print(inputtag.get('value'))
        assertion = inputtag.get('value')

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
    if'saml-provider' in chunks[0]:
        newawsrole = chunks[1] + ',' + chunks[0]
        index = awsroles.index(awsrole)
        awsroles.insert(index, newawsrole)
        awsroles.remove(awsrole)

home = expanduser("~")
filename = home + awsconfigfile

config = ConfigParser.RawConfigParser()
config.read(filename)

i=0
for awsrole in awsroles:
    role_arn = awsroles[i].split(',')[0]
    principal_arn = awsroles[i].split(',')[1]
    i += 1

    account_id = role_arn.split(':')[4]
    role_name = role_arn.split('/')[1]

    profile_name = account_id + "-" + role_name
    print profile_name

    conn = boto.sts.connect_to_region(region)
    token = conn.assume_role_with_saml(role_arn, principal_arn, assertion)

    if not config.has_section(profile_name):
        config.add_section(profile_name)

        config.set(profile_name, 'output', outputformat)
        config.set(profile_name, 'region', region)
        config.set(profile_name, 'aws_access_key_id', token.credentials.access_key)
        config.set(profile_name, 'aws_secret_access_key', token.credentials.secret_key)
        config.set(profile_name, 'aws_session_token', token.credentials.session_token)

with open(filename, 'w+') as configfile:
    config.write(configfile)
