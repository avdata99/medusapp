# -*- coding: utf-8 -*-
""" pruebas sobre el website medusapp.org en local """

import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class MedusApp(unittest.TestCase):

    def setUp(self):
        # self.driver = webdriver.Firefox()
        # Chrome needs export PATH="/home/user/chromedriverpath/:$PATH"
        self.driver = webdriver.Chrome() 


    def test_content_home(self):
        driver = self.driver
        driver.get("http://medusapp")
        # self.assertIn("MedusApp", driver.title)
        self.assertIn(u"¿Qué es Medusapp?", driver.page_source)

        
    def test_content_home_title(self):
        driver = self.driver
        driver.get("http://medusapp")
        self.assertIn("Seccion", driver.title)
        


    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main()