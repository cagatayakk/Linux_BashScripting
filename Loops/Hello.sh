#!/bin/bash

read -p "Enter multiple names : " names

for name in $names
do
    echo "Hello $name"
done
