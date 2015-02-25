#!/usr/bin/env perl

#
# https://github.com/mkenney/Projects
# Enter a number and have the program generate the Fibonacci sequence to that
# number or to the Nth number.
#

use strict;
use warnings;
use Data::Dumper qw(Dumper);
my ($iterations) = @ARGV;
if (!$iterations) {
	print "How many Fibonacci numbers do you want? ";
	$iterations = <>;
}

my $cur = 1;
my $last = 1;

for ($a = 0; $a < $iterations; $a++) {
	print $cur."\n";
	my $tmp = $cur;
	$cur = $cur + $last;
	$last = $tmp;
}
