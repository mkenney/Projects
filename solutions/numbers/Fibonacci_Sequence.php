#!/usr/bin/env php
<?php
/**
 * https://github.com/mkenney/Projects
 * Enter a number and have the program generate the Fibonacci sequence to that
 * number or to the Nth number.
 */

if (count($argv) < 2) {
    $iterations = (int) readline("How many Fibonacci numbers do you want? ");
} else {
    $iterations = int($argv[1]);
}

$cur = 1;
$last = 1;

for ($a = 0; $a < $iterations; $a++) {
    echo number_format($cur, 0)."\n";
    $tmp = $cur;
    $cur = $cur + $last;
    $last = $tmp;
}
