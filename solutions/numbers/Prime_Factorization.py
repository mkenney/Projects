#!/usr/bin/env python

"""
https://github.com/mkenney/Projects
Have the user enter a number and find all Prime Factors (if there are any)
and display them.
"""


def isPrime(n):
	"""
	Return True if n is prime, else False
	"""
	ret_val = True
	if 2 != n:
		if 2 > n or 0 == n % 2:
			ret_val = False

		else:
			low_range = int(n ** 0.5) + 1
			for a in range(3, low_range, 2):
				if 0 == n % a:
					ret_val = False;

	return ret_val


def getSmallestFactor(n):
	"""
	Find the smallest factor of n
	"""
	factor = False
	if n > 3:
		factor_found = False
		factor = 2
		while not factor_found:
			if 0 == n % factor:
				factor_found = True
			else:
				factor += 1

	return factor


def getPrimeFactors(n):
	"""
	Return a list of all the prime factors of n
	"""
	factors = []
	smallest = 0
	cur_n = n
	while smallest != cur_n:
		if cur_n < 4 or isPrime(cur_n):
			break

		smallest = getSmallestFactor(cur_n)
		factors.append(smallest)
		cur_n = cur_n / smallest

	if cur_n > 1:
		factors.append(cur_n)

	return factors

n = 0
while 'q' != n:
	n = raw_input("Enter an integer > 1 to to list it's prime factors ('q' to quit): ")
	if 'q' != n:
		n = int(n)
		factors = getPrimeFactors(n)
		print "    Prime factors of "+`n`+": "+', '.join(str(a) for a in factors)+"\n"
