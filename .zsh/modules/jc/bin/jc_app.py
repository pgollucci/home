#!/usr/bin/env python

"""
jc_app.py

Setup Jump Cloud AWS Application
Will prompt for password interactively

Usage:
 jc_app.py --key=<key> --crt=<crt> --org=<org> --account_id=<account_id> --role_path=<role_path> --provider=<provider> --login=<login>

Options:
  --key=<key>               path to idp key
  --crt=<crt>               path to idp crt
  --org=<org>               aws org name
  --account_id=<account_id> aws account id
  --role_path=<role_path>   FULL path of role [no leading /] (i.e. path/name)
  --provider=<provider>     provider name
  --login=<login>           jump cloud admin login
"""
from docopt import docopt

import getpass
import json
import os
import sys

from selenium import webdriver
from selenium.webdriver.common.keys import Keys

def login(args):
    """
    """

    passwd = getpass.getpass()

    browser = webdriver.Chrome()
    browser.get('https://console.jumpcloud.com/login')

    browser.find_element_by_xpath("/html/body/div/div/div[2]/div/div/div[2]/div[2]").click()

    email = browser.find_element_by_name("email");
    password = browser.find_element_by_name("password");
    email.send_keys(args["--login"])
    password.send_keys(passwd)

    browser.find_element_by_xpath("/html/body/div/div/div[2]/div/div/form/button").click()

    return browser

def goto_applications(browser):
    """
    """

    browser.get('https://console.jumpcloud.com/#/applications')

def add_application(browser, args):

    role_name = args["--role_path"].split("/")[-1]

    # add
    browser.implicitly_wait(3)
    browser.find_element_by_xpath("/html/body/main/div/div[2]/div/a").click()

    # aws
    browser.implicitly_wait(3)
    browser.find_element_by_xpath("/html/body/aside/div/div[2]/div/div[4]/div[8]/a").click()

    # key and cert
    browser.implicitly_wait(3)
    browser.find_element_by_xpath("/html/body/aside/div/div[2]/div/div[2]/div[1]/div[1]/div/input").send_keys(args["--key"])
    browser.find_element_by_xpath("/html/body/aside/div/div[2]/div/div[2]/div[1]/div[2]/div/input").send_keys(args["--crt"])

    role_session_name = browser.find_element_by_xpath("/html/body/aside/div/div[2]/div/div[2]/div[1]/div[3]/div/div/div[2]/div[2]/div[2]/input")
    role_session_name.clear()
    role_session_name.send_keys(role_name)

    role=browser.find_element_by_xpath("/html/body/aside/div/div[2]/div/div[2]/div[1]/div[3]/div/div/div[2]/div[2]/div[2]/input")
    role.clear()
    role.send_keys("arn:aws:iam::{}:role/{},arn:aws:iam::{}:saml-provider/{}".format(args["--account_id"], args["--role_path"], args["--account_id"], args["--provider"]))

    idp_url = browser.find_element_by_xpath("/html/body/aside/div/div[2]/div/div[2]/div[2]/div/div/input")
    idp_url.clear()
    idp_url.send_keys("aws-{}".format(args["--account_name"]))

    display_label = browser.find_element_by_xpath("/html/body/aside/div/div[2]/div/div[2]/div[3]/div/div/input")
    display_label.clear()
    display_label.send_keys("AWS {}".format(args["--account_name"]))

    # save
    browser.find_element_by_xpath("/html/body/aside/div/div[3]/button").click()

    # confirm
    browser.find_element_by_xpath("/html/body/div[5]/div/div/div[3]/a[2]").click()

def download_saml_metadata_xml(browser, args):
    """
    """

    goto_applications(browser)
    browser.implicitly_wait(5)

    browser.find_element_by_xpath("/html/body/main/div/div[4]/div[{}]/a[1]".format(args["--pos"])).click()
    browser.implicitly_wait(5)

    import time
    time.sleep(2)

def account_map_get(args):
    """
    """

    home = os.path.expanduser("~")
    map_file  = home + '/.aws/map-' + args["--org"]
    with open(map_file, 'r') as afile:
        account_map = json.load(afile)

    return account_map

def aws_account_id_to_name(args):
    """
    """

    account_map = account_map_get(args)

    return account_map[args["--account_id"]]

def account_ord(args):
    """
    """

    account_map = account_map_get(args)
    inv_map = dict(zip(account_map.values(), account_map.keys()))

    i = 2
    for key in sorted(inv_map):
        if key == args["--account_name"]:
            return i

        i += 1

def main(args):
    """
    """

    args["--account_name"] = aws_account_id_to_name(args)
    args["--pos"] = account_ord(args)

    browser = login(args)
    goto_applications(browser)

    add_application(browser, args)

    download_saml_metadata_xml(browser, args)

if __name__ == '__main__':
    arguments = docopt(__doc__, options_first=True, version="0.0.1")
    sys.exit(main(arguments))
