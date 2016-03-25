# -*- coding: utf-8 -*-
from selenium.webdriver.common.keys import Keys
from MedusAppTest import MedusAppTest


class MedusAppBackend(MedusAppTest):

    def test_login_fail(self):
        driver = self.driver
        driver.get("{}/home".format(self.base_url))

        # BAD login
        elem = driver.find_element_by_name("user")
        elem.send_keys("admin2")
        elem = driver.find_element_by_name("password")
        elem.send_keys("admin2")
        elem.send_keys(Keys.RETURN)
        self.assertIn(u"Acceso inválido", driver.page_source)

    def test_login_ok(self):
        driver = self.driver
        driver.get("{}/home".format(self.base_url))

        # login OK
        elem = driver.find_element_by_name("user")
        elem.send_keys("admin")
        elem = driver.find_element_by_name("password")
        elem.send_keys("admin")
        elem.send_keys(Keys.RETURN)
        self.assertIn(u"MedusApp - Home :: Admin user (admin)", driver.page_source)

    def test_create_gov(self):
        self.test_login_ok()

if __name__ == "__main__":
    import unittest
    unittest.main(verbosity=2)