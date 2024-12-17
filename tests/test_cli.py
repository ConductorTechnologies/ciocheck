import unittest
from ciofcheck.cli import _human_file_size

class TestHumanFileSize(unittest.TestCase):
    def test_human_file_size_conversion(self):
        """Test that file sizes are correctly converted to human readable format"""
        test_cases = [
            (0, "0.00 B"),
            (1024, "1.00 KB"),
            (1024 * 1024, "1.00 MB"),
            (1024 * 1024 * 1024, "1.00 GB"),
            (500, "500.00 B"),
            (1500, "1.46 KB"),
        ]
        
        for bytes_value, expected in test_cases:
            with self.subTest(bytes=bytes_value):
                result = _human_file_size(bytes_value)
                self.assertEqual(result, expected)

if __name__ == '__main__':
    unittest.main() 