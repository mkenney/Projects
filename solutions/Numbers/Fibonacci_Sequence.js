#!/usr/bin/env node

/**
 * https://github.com/mkenney/Projects
 * Enter a number and have the program generate the Fibonacci sequence to that
 * number or to the Nth number.
 */

var readline = require('readline');
var iterations = 0;

if (process.argv.length < 3) {
	prompt("How many Fibonacci numbers do you want? ", function(iterations) {
		calc(iterations);
	});
} else {
	iterations = Number(process.argv[2]);
	calc(iterations);
}

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

function calc(iterations) {
	var cur = 1;
	var last = 1;

	for (var a = 0; a < iterations; a++) {
		console.log(cur);
		var tmp = cur;
		cur = cur + last;
		last = tmp;
	}
};
