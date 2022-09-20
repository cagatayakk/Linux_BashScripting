#!/bin/bash

# in this script we will use (()) paranthesis for the math operations and assign it's result to a variable
# here taking numbers from user
read -p "Enter a number : " first
read -p "Enter a number : " second

# use the numbers given by the users in math operations
sum=$(($first + $second))
echo "sum of the numbers : $sum"

<< EOF
let "sub = $first - $second"
let "mul = $first * $second"
let "div = $first / $second"

echo "Sum of the numbers = $sum"
echo "Subtraction of the numbers = $sub"
echo "Multiplication of the numbers = $mul"
echo "Division of the numbers = $div"
EOF
