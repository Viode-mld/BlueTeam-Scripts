#!/bin/bash
# Search for suspicious PHP files (possible webshells)

echo "Searching for suspicious PHP files in /var/www..."
find /var/www/ -iname "*.php" -exec grep -i "exec" {} \; -print
