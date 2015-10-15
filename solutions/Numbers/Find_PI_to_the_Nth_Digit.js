#!/usr/bin/env node

/**
 * https://github.com/mkenney/Projects
 * Enter a number and have the program generate the Fibonacci sequence to that
 * number or to the Nth number.
 */

var readline = require('readline');

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
 * Direct port of the lisp version (calc-pi-spigot-v4).  It's much, much faster
 * here than in Lisp, don't know why.  Maybe I'll try it in PHP or Python.
 */
function calc_pi_spigot_v4( digits ) {

	if (digits % 4)
		digits = digits + (4 - (digits % 4));

	var pi = [];
	var quotient;
	var modulo = 0;
	var divisor;

	var compute_size = Math.floor(digits * 14 / 4);
	var compute_table = new Array(compute_size + 1);
	var outer_key = compute_size;
	var inner_key = 1;
	var digit_counter = 0;

	var a = 10000;

	for (inner_key = 1; inner_key <= compute_size; inner_key++) {
		compute_table[inner_key] = Math.floor(a / 5);
	}
	compute_table[compute_size] = 0;

	while (outer_key > 0) {
		divisor = 2 * outer_key;
		quotient = 0;
		inner_key = outer_key;
		while (inner_key > 0) {
			quotient = quotient + compute_table[inner_key] * a;
			divisor = divisor - 1;
			compute_table[inner_key] = quotient % divisor;
			quotient = Math.floor(quotient / divisor);
			divisor = divisor - 1;
			inner_key = inner_key - 1;
			if (inner_key != 0) {
				quotient = quotient * inner_key;
			}
		}
		outer_key = outer_key - 14;

		// Output 4 digits as a string
		pre_pi = modulo + Math.floor( quotient / a)+'';
		// Fix rounding errors
		while (pre_pi.length < 4) {
			pre_pi = "0"+pre_pi
		}
		pi.push(pre_pi)
		digit_counter++;
		modulo = quotient % a;
	}
	return pi;
};

function main() {
	prompt("  How many digits of Pi do you want ('q' to quit)? ", function(n) {
		if ('q' != n) {
			if (!isNaN(n)) {
				var n = Number(n);
				var pi = calc_pi_spigot_v4(n);
				process.stdout.write("\n"+pi.join('').substr(0, n)+"\n\n\n");
			}
			main();
		}
	});
}

process.stdout.write("\n  Pi Digit Generator using the Spigot algorithm by Stanley Rabinowitz and Stan Wagon\n\n");
main();
