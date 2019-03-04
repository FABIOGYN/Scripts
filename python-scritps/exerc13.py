#!/usr/bin/env python3.7

sal = float(input('Qual o seu salário? '))
print ('O seu salário era de R$ {0:2} e ganhou um reajuste de 15%, no valor R$ {2:2} e seu novo salário é de: R$ {2:2}'.format(sal, (sal / 100) * 15, sal + ((sal /100) * 15)))