#!/usr/bin/env python

"""Usage: sts_regions_disable.py --login=<login>

Login to root aws account, and disable sts regions

Options:
  --login=<login>           root account login

Will prompt for password interactively
"""
from docopt import docopt

import boto3
import requests
import sys
import requests
import urllib
import json
import getpass

#import xml.etree.ElementTree as ET
#from bs4 import BeautifulSoup

from selenium import webdriver
from selenium.webdriver.common.keys import Keys

def sts_regions():
    """
    """

    return [
        "us-east-2",
        "us-west-1",
        "us-west-2",
        "ap-south-1",
        "ap-northeast-1",
        "ap-northeast-2",
        "ap-southeast-1",
        "ap-southeast-2",
        "eu-central-1",
        "eu-west-1",
        "sa-east-1"
    ]

def login(args):
    """
    """

    passwd = getpass.getpass()

    browser = webdriver.Chrome()
    browser.get('https://console.aws.amazon.com/?nc2=h_m_mc')

    username = browser.find_element_by_id("ap_email")
    password = browser.find_element_by_id("ap_password")

    username.send_keys(args["--login"])
    password.send_keys(passwd)

    browser.find_element_by_id("signInSubmit-input").click()

    return browser

def gotoiam(browser):
    """
    """

    browser.get("https://console.aws.amazon.com/iam/home?region=us-east-1#account_settings")

def sts_region_disable(browser):
    """
    """

    browser.find_element_by_xpath('//*[@id="action"]/[3]/a').click()
    browser.find_element_by_xpath('//*[@id="modal-content"]/div/div[2]/div/a').click()


def main(args):
    """
    """

    browser = login(args)
    gotoiam(browser)

    for region in sts_regions():
        sts_region_disable(browser)

if __name__ == '__main__':
    arguments = docopt(__doc__, options_first=True, version="0.0.1")
    sys.exit(main(arguments))
