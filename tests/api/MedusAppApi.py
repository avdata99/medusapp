# -*- coding: utf-8 -*-
""" pruebas sobre el website medusapp.org en local """

import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class MedusAppApi(unittest.TestCase):

    def setUp(self):
        # self.driver = webdriver.Firefox()
        # Chrome needs export PATH="/home/user/chromedriverpath/:$PATH"
        self.driver = webdriver.Chrome() 


    def test_api_texts(self):
        driver = self.driver
        driver.get("http://medusapp/api/info/load/que-es")
        # self.assertIn("MedusApp", driver.title)
        self.assertIn(u"Medusapp es una app para los gobiernos", driver.page_source)

        
    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main(verbosity=2)