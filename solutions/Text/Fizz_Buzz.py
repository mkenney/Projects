#!/usr/bin/env perl

#
# https://github.com/mkenney/Projects
# Write a program that prints the numbers from 1 to 100. But for multiples of
# three print "Fizz" instead of the number and for the multiples of five print
# "Buzz". For numbers which are multiples of both three and five print
# "FizzBuzz".
#

for a in range(1, 101):
	if 0 != (a % 3) and 0 != (a % 5):
		print a,

	if (0 == a % 3):
		print "Fizz",

	if (0 == a % 5):
		print "Buzz",

	print "\n",
