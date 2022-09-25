#!/bin/bash

read -p "Enter the Application you want to find out if it is installed : " app
$app --version

if [[ $(echo $?) != 0  ]]; then
        sudo yum update -y
        sudo yum install $app -y && echo "$app installed"
else
        echo "$app already installed."
fi
