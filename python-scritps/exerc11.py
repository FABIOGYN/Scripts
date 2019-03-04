#!/usr/bin/env python3.7

alt = float(input('Qual a altura da sala? '))
larg = float(input('Qual a largura da sala? '))
print ('A parede de medidas {0} X {1} tem área de {2:3} metros quadrados e serão necessários {3:3} litros de tinta para pintá-la'.format(alt, larg, alt * larg, (alt * larg)/2))