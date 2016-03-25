import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class MedusAppTest(unittest.TestCase):

    def __init__(self, *args, **kwargs):
        unittest.TestCase.__init__(self, *args, **kwargs)
        self.base_url = kwargs.get('base_url', 'http://medusapp')
    
    def setUp(self):
        # self.driver = webdriver.Firefox()
        # Chrome needs export PATH="/home/user/chromedriverpath/:$PATH"
        self.driver = webdriver.Chrome() 
        
    def tearDown(self):
        self.driver.close()