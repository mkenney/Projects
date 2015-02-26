#!/usr/bin/env php
<?php
/**
 * https://github.com/mkenney/Projects
 * Write a program that prints the numbers from 1 to 100. But for multiples of
 * three print "Fizz" instead of the number and for the multiples of five print
 * "Buzz". For numbers which are multiples of both three and five print
 * "FizzBuzz".
 */

for ($a = 1; $a < 101; $a += 1) {
	if (0 != ($a % 3) && 0 != ($a % 5)) {
		echo "$a";
	}
	if (0 == $a % 3) {
		echo "Fizz";
	}
	if (0 == $a % 5) {
		echo "Buzz";
	}
	echo "\n";
}
