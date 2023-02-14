#!/bin/bash

maxLineasTotal=$(cat consumo.txt | wc -l)

totalMenor=100000
cont=0

for ((i = 2; i < $maxLineasTotal; i++)); do
    ciudad=$(cat consumo.txt | awk ' { print $1 } ' | sed "$i"p -n)

    maxLineas=$(grep $ciudad consumo.txt | wc -l)

    for ((j = 1; j <= $maxLineas; j++)); do
        cons=$(grep $ciudad consumo.txt | awk ' {print $4} ' | sed "$j"p -n)

    done
    if (($cons < $totalMenor)); then
        totalMenor=$cons
        cont=$(($cont+1))
        if (($cont==$maxLineas))
        then
        c=$ciudad
        fi
    fi
done


echo "La ciudad con un cosnsumo decreciente es $c"
