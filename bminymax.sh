#!/bin/bash

min=0
max=100000

maxLineas=$(cat consumo.txt | wc -l)

for((i=2;i<$maxLineas;i++)); do
    valor=$(cat consumo.txt | awk ' {print $4} ' | sed "$i"p -n)
    if (($valor<$max))
    then
    max=$valor;
    fi
    if (($valor>$min))
    then
    min=$valor;
    fi
done

ciudadMax=$(grep $max consumo.txt)
ciudadMin=$(grep $min consumo.txt)

echo "Consumo máximo $ciudadMax"
echo "Consumo mínimo $ciudadMin"