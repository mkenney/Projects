#!/usr/bin/env sh

#
# https://github.com/mkenney/Projects
# Write a program that prints the numbers from 1 to 100. But for multiples of
# three print "Fizz" instead of the number and for the multiples of five print
# "Buzz". For numbers which are multiples of both three and five print
# "FizzBuzz".
#

for a in `seq 1 100`; do
    if [ "0" != "$(expr $a % 3)" ] && [ "0" != "$(expr $a % 5)" ]; then
        echo "$a\c"
    fi
    if [ "0" == "$(expr $a % 3)" ]; then
        echo "Fizz\c"
    fi
    if [ "0" == "$(expr $a % 5)" ]; then
        echo "Buzz\c"
    fi
    echo
done
