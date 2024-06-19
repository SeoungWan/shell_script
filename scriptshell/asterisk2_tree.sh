#!/bin/bash
#         * 1: ' 'x4, '*'x1   
#       * * 2: ' 'x3, '*'x2
#     * * * 3: ' 'x2, '*'x3
#   * * * * 4: ' 'x1, '*'x4
# * * * * * 5: ' 'x0, '*'x5

max1=5 
for i in $(seq 1 $max1)
do
    min2=$(expr $max1 - $i)
    for j in $(seq $min2 -1 1)
    do
        echo -n ' '
    done
    for k in $(seq 1 $i)
    do
        echo -n '*'
    done
    echo
done


