#!/bin/bash

read -p "What is your name? : " NAME
read -p "How old are you? : " AGE
read -p "What is average life expectancy in your country? : " ALE

if [[ $AGE -lt 18 ]]; then
        echo "Student. At least $(( 18 - $AGE )) years to become a worker."
elif [[ $AGE -eq 18 ]] || [[ $AGE -lt 65 ]]; then
        echo "Worker. $(( 65 - $AGE )) years to retire."
elif [[ $AGE -ge 65 ]] && [[ $AGE -lt $ALE ]]; then
        echo "Retired. $(( $ALE - $AGE )) years to die."
else
        echo "Is walking dead really happening?? RUUUUUUUN!! "
fi








