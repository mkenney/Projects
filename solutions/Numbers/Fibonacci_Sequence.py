#!/usr/bin/env python

"""
https://github.com/mkenney/Projects
Enter a number and have the program generate the Fibonacci sequence to that
number or to the Nth number.
"""

import sys

if (len(sys.argv) < 2):
	iterations = int(input("How many Fibonacci numbers do you want? "))
else:
	iterations = int(sys.argv[1])

cur = 1;
last = 1;

for a in range(0, iterations):
	print cur
	tmp = cur
	cur = cur + last
	last = tmp
