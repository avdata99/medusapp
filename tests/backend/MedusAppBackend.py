# -*- coding: utf-8 -*-
""" pruebas sobre el website medusapp.org en local """

import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class MedusAppBackend(unittest.TestCase):

    def setUp(self):
        # self.driver = webdriver.Firefox()
        # Chrome needs export PATH="/home/user/chromedriverpath/:$PATH"
        self.driver = webdriver.Chrome() 


    def test_login_fail(self):
        driver = self.driver
        driver.get("http://medusapp/home")

        # BAD login
        elem = driver.find_element_by_name("user")
        elem.send_keys("admin2")
        elem = driver.find_element_by_name("password")
        elem.send_keys("admin2")
        elem.send_keys(Keys.RETURN)
        self.assertIn(u"Acceso inválido", driver.page_source)

    def test_login_ok(self):
        driver = self.driver
        driver.get("http://medusapp/home")

        # login OK
        elem = driver.find_element_by_name("user")
        elem.send_keys("admin")
        elem = driver.find_element_by_name("password")
        elem.send_keys("admin")
        elem.send_keys(Keys.RETURN)
        self.assertIn(u"MedusApp - Home :: Admin user (admin)", driver.page_source)

        
    
    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main(verbosity=2)