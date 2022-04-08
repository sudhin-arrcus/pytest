import pytest
@pytest.fixture(scope='class')
def init_cases(flag):
    flag.cls.