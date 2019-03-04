#!/usr/bin/env python3.7

aluno = input('Dgite o nome do aluno: ')
nota1 = float(input('Digite a primeira nota: '))
nota2 = float(input('Digite a segunda nota: '))
media = (nota1 + nota2) / 2
print ('O aluno {0} tirou na primeira avaliação a nota {1}, na segunda avaliação a {2} e está com a média {3:.2f}'.format(aluno, nota1, nota2, media))