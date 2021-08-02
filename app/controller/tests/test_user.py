from ..controller import user
import unittest

class Test_TestIncrementDecrement(unittest.TestCase):
    def setUp(self):
        self.app = user.test_client()

    def test_health(self):
        rv = self.user.get('/blueprint_path')
        print(rv.data)


if __name__ == '__main__':
    unittest.main()
