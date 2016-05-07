#!/bin/sh
# sum all multiples of 3 & 5 below 1000

COUNTER=1; ACCUMULATOR=0
until [[ $((COUNTER)) -eq 1000 ]]
do
    if [[ $((COUNTER%3)) -eq 0 ]] || [[ $((COUNTER%5)) -eq 0 ]]; then
        ACCUMULATOR=$((ACCUMULATOR+COUNTER))
    fi
    COUNTER=$((COUNTER+1))
done

echo $ACCUMULATOR
exit
