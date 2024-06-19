#!/bin/bash

echo -n "Input A: "
read A

echo -n "Input OP: "
read OP

echo -n "Input B: "
read B

case $OP in
    '+') expr $A + $B ;;
    '-') : ;;
    '*') : ;;
    '/') : ;;
    *)   : ;;
esac

