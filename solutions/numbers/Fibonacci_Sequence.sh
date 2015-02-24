#!/usr/bin/env sh

#
# https://github.com/mkenney/Projects
# Enter a number and have the program generate the Fibonacci sequence to that
# number or to the Nth number.
#

if [ "" = "$1" ]; then
    echo -e "How many Fibonacci numbers do you want? \c"
    read iterations
else
    iterations=$1
fi

cur=1
last=1

for a in `seq 0 ${iterations}`;
do
    echo $cur
    tmp=$cur
    cur=$(($cur + $last))
    last=$tmp
done
