#!/bin/bash

a=2334
let "a += 1"
echo "a = $a"
echo

b=${a/23/BB}	#замена "23" на "ВВ"
		#происходит трансформация числа в строку
echo "b = $b"
declare -i b
echo "b = $b"
let "b += 1"
echo "b = $b"
echo

c=BB34
echo "c = $c"
d=${c/BB/23}	#замена ВВ на 23
		#переменная трансформируется в число
echo "d = $d"
let "d += 1"
echo "d = $d"
echo

#Работа с пустой переменной
e=""
echo "e = $e"
let "e += 1"
echo "e = $e"
echo

#Работа с необъявленной переменной
echo "f = $f"
let "f += 1"
echo "f = $f"
echo

exit 0
