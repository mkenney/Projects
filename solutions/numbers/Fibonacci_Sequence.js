
/**
 * https://github.com/mkenney/Projects
 * Enter a number and have the program generate the Fibonacci sequence to that
 * number or to the Nth number.
 */
+function(global, undefined) {
	'use strict';

	if (undefined === global.iterations) {
		global.iterations = prompt("How many Fibonacci numbers do you want?");
	}
	global.iterations = Number(global.iterations);

	var cur = 1;
	var last = 1;
	var tmp;

	for (var a = 0; a < iterations; a++) {
		console.log(cur);
		tmp = cur;
		cur = cur + last;
		last = tmp;
	}
}(this);
