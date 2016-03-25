from MedusAppTest import MedusAppTest


class MedusAppApi(MedusAppTest):

    def test_api_texts(self):
        driver = self.driver
        driver.get("{}/api/info/load/que-es".format(self.base_url))
        # self.assertIn("MedusApp", driver.title)
        self.assertIn(u"Medusapp es una app para los gobiernos", driver.page_source)    
    
if __name__ == "__main__":
    import unittest
    unittest.main(verbosity=2)