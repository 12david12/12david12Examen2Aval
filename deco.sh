#!/bin/bash

maxLineas=$(grep $1 consumo.txt | wc -l)
total=0

for ((i = 1; i <= $maxLineas; i++)); do
    cons=$(grep $1 consumo.txt | awk ' {print $4} ' | sed "$i"p -n)
    total=$(($total + $cons))
    media=$(($total/$maxLineas))
done

if (($media<400))
then
echo "$1 es ECO"
else
echo "$1 NO es ECO"
fi