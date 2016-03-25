# -*- coding: utf-8 -*-
from MedusAppTest import MedusAppTest


class MedusAppWebsite(MedusAppTest):

    
    def test_content_home(self):
        driver = self.driver
        driver.get(self.base_url)
        # self.assertIn("MedusApp", driver.title)
        self.assertIn(u"¿Qué es Medusapp?", driver.page_source)

        
    def test_content_home_title(self):
        driver = self.driver
        driver.get(self.base_url)
        self.assertIn("Seccion", driver.title)
        


    
if __name__ == "__main__":
    import unittest
    unittest.main(verbosity=2)