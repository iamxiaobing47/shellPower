#!/bin/bash

#1
echo "Last modified file: $(ls -lt | tail -n 1)"

#2
echo 'Last modified file: `ls -lt | tail -n 1`'

#3
echo "The result is $((3 + 4))"

#4
echo 'The result is $((3 + 4))'