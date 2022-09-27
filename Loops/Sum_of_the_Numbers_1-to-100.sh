#!/bin/bash

i=1
sum=0

while [[ $i -le 100 ]]
do
    sum=$(($sum+$i))
    ((i++))
done
echo "total= $sum"
