import pytest
import logging
logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger()
# The below method is used for test intialization
@pytest.fixture(scope='module')
def init_cases():
    print("[+]-----------------------------------------[+]")
    log.info("Intialization completed")
    print("!!!!!INTIALIZATION COMPLETED!!!!")
# pytest test_first.py -v --html=report1.html
    yield
    print("Tear Down After the cases")
# Calling the intial setup
@pytest.mark.usefixtures("init_cases")
def test_1():
    a = 10
    b = 10
    print("Inside the cases ")

    log.info("hello")
    log.debug("working")
    assert a == b
