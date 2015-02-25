#!/usr/bin/env sh

#
# https://github.com/mkenney/Projects
# Have the user enter a number and find all Prime Factors (if there are any)
# and display them.
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

#
# Find the smallest factor of n
#
function getSmallestFactor {
	n=$1
	factor=0
	if [ "$n" -gt 3 ]; then
		factor_found=0;
		factor=2;
		while [ "0" == $factor_found ]; do
			if [ "0" == "$(expr $n % $factor)" ]; then
				factor_found=1
			else
				((factor+=1))
			fi
		done
	fi
	echo $factor;
}

#
# Return a list of all the prime factors of n
#
declare -a factors
function getPrimeFactors {
	factors=()
	n=$1
	smallest=0
	cur_n=$n

	while [ "$smallest" != "$cur_n" ]; do
		is_prime=$(isPrime $cur_n)
		if [ "$cur_n" -lt "4" ] || [ "1" == is_prime ]; then
			smallest=$cur_n

		else
			smallest=$(getSmallestFactor $cur_n)
			factors+=($smallest)
			cur_n=$(($cur_n / $smallest))
		fi
	done

	if [ "$cur_n" -gt 1 ]; then
		factors+=($cur_n)
	fi
}

n=0
while [ "q" != "$n" ]; do
	echo "Enter an integer > 1 to to list it's prime factors ('q' to quit): \c";
	read n
	n=$(echo $n|tr -d '\n')
	if [ "q" != "$n" ]; then
		getPrimeFactors $n
		echo "    Prime factors of $n: $(IFS=',\ '; echo "${factors[*]}") ";
		echo
	fi
done
