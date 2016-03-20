# test all
import unittest

from website.MedusAppWebsite import *
from backend.MedusAppBackend import *
from api.MedusAppApi import *

print "****************************************"
print "****************************************"
print "Testing website"
print "****************************************"
print "****************************************"

suite = unittest.TestLoader().loadTestsFromTestCase(MedusAppWebsite)
unittest.TextTestRunner(verbosity=2).run(suite)

print "****************************************"
print "****************************************"
print "Testing backend"
print "****************************************"
print "****************************************"

suite = unittest.TestLoader().loadTestsFromTestCase(MedusAppBackend)
unittest.TextTestRunner(verbosity=2).run(suite)

print "****************************************"
print "****************************************"
print "Testing api"
print "****************************************"
print "****************************************"

suite = unittest.TestLoader().loadTestsFromTestCase(MedusAppApi)
unittest.TextTestRunner(verbosity=2).run(suite)