#!/bin/bash
read -p "Введите число: " num

if [ $((num % 2)) -eq 0 ]; then
    echo "Число $num чётное"
else
    echo "Число $num нечётное"
fi
