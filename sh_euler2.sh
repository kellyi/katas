#!/bin/sh

FIRST=1
SECOND=2
ACCUMULATOR=0
until [[ $((SECOND)) -gt 4000000 ]]
do
    TEMP=$((FIRST))
    FIRST=$((SECOND))
    SECOND=$((TEMP+SECOND))
    if [[ $((FIRST%2)) -eq 0 ]]; then
        ACCUMULATOR=$((ACCUMULATOR+FIRST))
    fi
done

echo $ACCUMULATOR
exit
