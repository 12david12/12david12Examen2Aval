#!/bin/bash

maxLineasTotal=$(cat consumo.txt | wc -l)

totalMenor=100000

for ((i = 2; i < $maxLineasTotal; i++)); do
    ciudad=$(cat consumo.txt | awk ' { print $1 } ' | sed "$i"p -n)

    maxLineas=$(grep $ciudad consumo.txt | wc -l)
    total=0

    for ((j = 1; j <= $maxLineas; j++)); do
        cons=$(grep $ciudad consumo.txt | awk ' {print $4} ' | sed "$j"p -n)
        total=$(($total + $cons))
        media=$(($total / $maxLineas))
    done
    if (($media < $totalMenor)); then
        totalMenor=$media
        c=$ciudad
    fi
done


echo "La ciudad con menor consumo es $c y tiene un consumo medio de $totalMenor"
