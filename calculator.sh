#!/bin/bash

# here taking numbers from user
read -p "Enter a number : " first
read -p "Enter a number : " second

# use the numbers given by the users in math operations
let "sum = $first + $second"
let "sub = $first - $second"
let "mul = $first * $second"
let "div = $first / $second"

# after math operations results will be displayed 
# let command give results as an integer
echo "Sum of the numbers = $sum"
echo "Subtraction of the numbers = $sub"
echo "Multiplication of the numbers = $mul"
echo "Division of the numbers = $div"
