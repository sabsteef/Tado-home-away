#!/usr/bin/env python3

#Made By Sabsteef. and presses the button when the away or home mode is set.

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

driver.get('https://my.tado.com/app/nl/main/home')

# wait up to 10 seconds for the elements to become available
#driver.implicitly_wait(10)

#driver.get_screenshot_as_file('main-page.png')
  
driver.get("https://my.tado.com/webapp/#/account/sign-in")
driver.implicitly_wait(5)
driver.set_window_size(1440, 797)

driver.find_element(By.NAME, "username").send_keys("bla@bla.nl")
driver.find_element(By.NAME, "password").send_keys("Password")

driver.get_screenshot_as_file('main-page1.png')

driver.find_element(By.NAME, "username").click()
driver.find_element(By.NAME, "username").click()
driver.implicitly_wait(5)

driver.find_element(By.CSS_SELECTOR, ".btn .ng-scope > .ng-scope").click()
#driver.get_screenshot_as_file('main-page2.png')

driver.find_element(By.CSS_SELECTOR, ".b-btn > span").click()
