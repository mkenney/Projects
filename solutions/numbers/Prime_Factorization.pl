#!/usr/bin/env perl

#
# https://github.com/mkenney/Projects
# Have the user enter a number and find all Prime Factors (if there are any)
# and display them.
#

#
# Return true if n is prime, else false
#
sub isPrime {
	my $n = $_[0];
	my $ret_val = 1;
	if (2 != $n) {
		if (2 > $n || 0 == $n % 2) {
			$ret_val = 0;

		} else {
			$low_range = sqrt($n) + 1;
			for ($a = 3; $a < $low_range; $a += 2) {
				if (0 == $n % $a) {
					$ret_val = 0;
				}
			}
		}
	}
	return $ret_val;
}

#
# Find the smallest factor of n
#
sub getSmallestFactor {
	my $n = $_[0];
	$factor = 0;
	if ($n > 3) {
		$factor_found = 0;
		$factor = 2;
		while (!$factor_found) {
			if (0 == $n % $factor) {
				$factor_found = 1;
			} else {
				$factor += 1;
			}
		}
	}
	return $factor;
}

#
# Return a list of all the prime factors of n
#
sub getPrimeFactors {
	my $n = $_[0];
	my @factors = ();
	my $smallest = 0;
	my $cur_n = $n;
	while ($smallest != $cur_n) {
		if ($cur_n < 4 || isPrime($cur_n)){
			last;
		}

		$smallest = getSmallestFactor($cur_n);
		push @factors, $smallest;
		$cur_n = $cur_n / $smallest;
	}

	if ($cur_n > 1) {
		push @factors, $cur_n;
	}

	return @factors;
}

my $n = 0;
while ('q' ne $n) {
	print "Enter an integer > 1 to to list it's prime factors ('q' to quit): ";
	$n = <>;
	chomp($n);
	if ('q' ne $n) {
		my @factors = getPrimeFactors($n);
		print "    Prime factors of $n: ".join(', ', @factors)."\n\n";
	}
}
