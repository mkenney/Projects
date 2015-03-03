#!/usr/bin/env node

/**
 * https://github.com/mkenney/Projects
 * Checks if the string entered by the user is a palindrome. That is that it
 * reads the same forwards as backwards like "racecar"
 */

var readline = require('readline');

function isPalindrome(word) {
	return (word == word.split('').reverse().join(''));
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

//
// Continuous loop that promps for a word and returns whether it is a palindrome
// or not
//
function promptForPalindrome() {
	prompt("\nEnter the word to check ('q' to quit): ", function(word) {
		if ('q' != word) {
			if (isPalindrome(word)) {
				process.stdout.write("\n\n    '"+word+"' is a palindrome!\n\n");
			} else {
				process.stdout.write("\n\n    '"+word+"' is NOT a palindrome :(\n\n");
			}
			promptForPalindrome();
		}
	});
}

promptForPalindrome();
