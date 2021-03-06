#!/usr/bin/env node

/**
 * https://github.com/mkenney/Projects
 * Write a program that prints the numbers from 1 to 100. But for multiples of
 * three print "Fizz" instead of the number and for the multiples of five print
 * "Buzz". For numbers which are multiples of both three and five print
 * "FizzBuzz".
 */

for (var a = 1; a < 101; a++) {
	if (0 !== (a % 3) && 0 !== (a % 5)) {
		process.stdout.write(a.toString());
	}
	if (0 === a % 3) {
		process.stdout.write("Fizz");
	}
	if (0 === a % 5) {
		process.stdout.write("Buzz");
	}
	process.stdout.write("\n");
}
