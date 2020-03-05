#!/usr/bin/env python3
#Made By Sabsteef. and presses the button when the away or home mode is set.
import sys

# Debug options
#print(sys.argv[1]) # prints Username
#print(sys.argv[2]) # prints Uassword

from selenium import webdriver
options = webdriver.ChromeOptions()
options.add_argument('headless')
options.add_argument('no-sandbox')
options.add_argument('disable-gpu')
options.add_argument('ignore-ssl-errors=true')
options.add_argument('ssl-protocol=any')
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-gpu')
options.add_argument('--window-size=1280,1000')
options.add_argument('--allow-insecure-localhost')
options.add_argument('--allow-running-insecure-content')

options.binary_location = '/usr/bin/google-chrome-stable'
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities


# set the window size
options.add_argument('window-size=1440x797')

# initialize the driver
driver = webdriver.Chrome(options=options)
  
#open URL
driver.get("https://my.tado.com/webapp/#/account/sign-in")

# wait 5 sec to load the page
driver.implicitly_wait(5)

# Debug option make a screenshot of the page
driver.get_screenshot_as_file('main-page.png')

# Needed for correct setting and entering passwords
driver.set_window_size(1440, 797)

driver.find_element(By.NAME, "username").send_keys(sys.argv[1])
driver.find_element(By.NAME, "password").send_keys(sys.argv[2])

# Debug option make a screenshot of the page
driver.get_screenshot_as_file('main-page1.png')

driver.find_element(By.NAME, "username").click()


# wait 5 secs to load page
driver.implicitly_wait(5)

# press Button
driver.find_element(By.CSS_SELECTOR, ".btn .ng-scope > .ng-scope").click()
driver.find_element(By.CSS_SELECTOR, ".b-btn > span").click()

# Exit
driver.quit() 

