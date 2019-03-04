#!/bin/usr/env python3

algo = input ('Digite algo: ')
print ('O tipo primitivo desse valor é: ', type(algo))
print ('So tem espaços? ', algo.isspace())
print ('É um número? ', algo.isnumeric())
print ('É alfanúmerico? ', algo.isalnum())
print ('É alfabético? ', algo.isalpha())
print ('Está em minúsculas? ', algo.islower())
print ('Está em maiúsculas? ', algo.isupper())
print ('Está capitalizado? ', algo.istitle())
