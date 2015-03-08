#!/usr/bin/env sh

#
# https://github.com/mkenney/Projects
# Have the program find prime numbers until the user chooses to stop asking for
# the next one.
#

#
# Return true if n is prime, else false
#
function isPrime {
	n=$1
	ret_val=1;
	if [ "2" != "$n" ]; then
		if [ "2" -gt "$n" ] || [ "0" == "$(expr $n % 2)" ]; then
			ret_val=0

		else
			n_root=$(expr $(echo "sqrt($n)" | bc))
			low_range=$((n_root+1))
			for a in `seq 3 ${low_range}`; do
				test=$(expr $n % 2)
				if [ "1" == "$test" ]; then
					test=$(expr $n % $a)
					if [ "0" == "$test" ]; then
						ret_val=0
					fi
				fi
			done
		fi
	fi
	echo $ret_val;
}

n=2
input=""
while [ "q" != "$input" ]; do
	echo
	echo
	if [ "2" == "$n" ]; then
		echo "        The first \c"
	else
		echo "        The next \c"
	fi
	echo "prime number is: ${n}"

	echo
	echo
	echo "Press <enter> to see the next prime number ('q' to quit): \c";
	read input

	n=$(echo $n|tr -d '\n')
	if [ "q" != "$n" ]; then
		is_prime=0
		while [ "$is_prime" != "1" ]; do
			((n += 1))
			is_prime=$(isPrime $n)
		done
	fi
done
