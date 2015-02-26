#!/usr/bin/env node

/**
 * https://github.com/mkenney/Projects
 * Have the user enter a number and find all Prime Factors (if there are any)
 * and display them.
 */

var readline = require('readline');

/**
 * Return true if n is prime, else false
 */
function isPrime(n) {
	ret_val = true;
	if (2 != n) {
		if (2 > n || 0 == n % 2) {
			ret_val = false;

		} else {
			low_range = Math.sqrt(n) + 1;
			for (var a = 3; a < low_range; a += 2) {
				if (0 == n % a) {
					ret_val = false;
				}
			}
		}
	}
	return ret_val;
}

/**
 * Find the smallest factor of n
 */
function getSmallestFactor(n) {
	factor = false;
	if (n > 3) {
		factor_found = false;
		factor = 2;
		while (!factor_found) {
			if (0 == n % factor) {
				factor_found = true;
			} else {
				factor += 1;
			}
		}
	}
	return factor;
}

/**
 * Return a list of all the prime factors of n
 */
function getPrimeFactors(n) {
	factors = [];
	smallest = 0;
	cur_n = n;
	while (smallest != cur_n) {
		if (cur_n < 4 || isPrime(cur_n)){
			break;
		}

		smallest = getSmallestFactor(cur_n);
		factors.push(smallest);
		cur_n = cur_n / smallest;
	}

	if (cur_n > 1) {
		factors.push(cur_n);
	}

	return factors;
}

/**
 * Prompt for input and execute a callback on the result
 */
function prompt(question, callback) {
	var iface = readline.createInterface({
		input: process.stdin,
		output: process.stdout
	});
	iface.question(question, function(answer) {
		iface.close();
		callback(answer);
	});
};

/**
 * List prime factors until the user quits
 * @return {[type]} [description]
 */
function listPrimeFactors() {
	prompt("Enter an integer > 1 to to list it's prime factors ('q' to quit): ", function(n) {
		if ('q' != n) {
			n = Number(n);
			factors = getPrimeFactors(n);
			console.log("    Prime factors of "+n+": "+factors.join(', '));
			console.log('');
			listPrimeFactors();
		}
	});
}

listPrimeFactors();
