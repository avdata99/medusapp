    # -*- coding: utf-8 -*-
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select
from random import randint

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

    def test_login_admin(self):
        driver = self.driver
        driver.get("{}/home".format(self.base_url))

        # login OK
        elem = driver.find_element_by_name("user")
        elem.send_keys("admin")
        elem = driver.find_element_by_name("password")
        elem.send_keys("admin")
        elem.send_keys(Keys.RETURN)
        self.assertIn(u"MedusApp - Home :: Admin user (admin)", driver.page_source)

    def has_gov_add_btn(self):
        """ tiene el boton agregar gobierno? """
        driver = self.driver
        add_gov_link = '{}/home/gobiernos/add'.format(self.base_url)
        xpath = "//a[@href='{}']".format(add_gov_link)
        try:
            add_gov_btn = driver.find_element_by_xpath(xpath)
        except Exception, e:
            print "no encuentra link '{}' con xpath='{}'".format(add_gov_link, xpath)

            return False
        return add_gov_btn
        

    def test_create_gov(self):
        """ crear un nuevo gobierno """
        self.test_login_admin() # LOGIN
        driver = self.driver
        # click en "gobiernos"
        menu_gov = driver.find_element_by_name('menu_gobiernos')
        menu_gov.click()
        add_gov_btn = self.has_gov_add_btn()

        if not add_gov_btn:
            raise ValueError('Sin boton para crear Gobierno en usuaro administrador')

        add_gov_btn.click()
        # cargar el frm con el nuevo gobierno (ID=crudForm)
        #Nombre ID:field-nombre
        element = driver.find_element_by_id("field-nombre")
        element.send_keys("Gobiernolandia-{}".format(randint(10000,99999)))
        # pais select
        element = driver.find_element_by_id("field_pais_id_chzn")
        element.click()
        # select pais from list
        element = driver.find_element_by_id("field_pais_id_chzn_o_1")
        element.click()

        # dificil de seleccionar el editor WYSIWYG
        element = driver.find_element_by_id("field-nombre")
        element.send_keys(Keys.TAB)
        element = driver.switch_to.active_element
        element.send_keys(Keys.TAB)
        element = driver.switch_to.active_element
        # texto HTML de presentacion: field-texto_presentacion
        # INVISIBLE element = driver.find_element_by_id("field-texto_presentacion")
        # element = driver.find_element_by_id("cke_contents_field-texto_presentacion")
        element.send_keys("Datos del <b>GOBIERNO NUEVO</b> <p>Hola parrafo 1</p><p>Hola parrafo 2</p>")
        
        sbm_button = driver.find_element_by_xpath('//button[@type="submit"]')
        sbm_button.click()

        # self.wait_some(30)
        
if __name__ == "__main__":
    import unittest
    unittest.main(verbosity=2)