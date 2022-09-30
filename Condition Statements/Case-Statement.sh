#!/bin/bash

read -p "Input first number: " first_number
read -p "Input second number: " second_number
read -p "Select an math operation
1 - addition
2 - subtraction
3 - multiplication
4 - division
" operation

case $operation in
  "1") 
     echo "result= $(( $first_number + $second_number))"
  ;;
  "2")
     echo "result= $(( $first_number - $second_number))"
  ;;
  "3")
     echo "result= $(( $first_number * $second_number))" 
     ;;
  "4")
     echo "result= $(( $first_number / $second_number))"
  ;;
  *)
     echo "Wrong choice..." 
  ;;
esac



# #!/bin/bash

# read -p "Input first number: " first_number
# read -p "Input second number: " second_number

# echo "1 - addition
# 2 - subtraction
# 3 - multiplication
# 4 - division"

# read -p "Select an math operation: " op

# if (( op==1)); then
#         echo "result= $(( $first_number + $second_number))"
# elif (( op==2)); then
#         echo "result= $(( $first_number - $second_number))"
# elif (( op==3)); then
#         echo "result= $(( $first_number * $second_number))" 
# elif (( op==4)); then
#         echo "result= $(( $first_number / $second_number))"
# fi



