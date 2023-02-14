#!/bin/bash

read -p "Introduce la ciudad: " ciudad

maxLineas=$(grep $ciudad consumo.txt | wc -l)
total=0

for ((i = 1; i <= $maxLineas; i++)); do
    cons=$(grep $ciudad consumo.txt | awk ' {print $4} ' | sed "$i"p -n)
    total=$(($total + $cons))
done

echo "CONSUMO TOTAL: $total"
