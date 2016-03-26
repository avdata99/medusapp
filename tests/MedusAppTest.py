import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


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

    def wait_some(self, seconds=10):
        driver = self.driver
    	wait = WebDriverWait(driver, seconds)
        element = wait.until(EC.element_to_be_clickable((By.ID,'not-exist-id')))
