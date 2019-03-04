#!/bin/bash

#Teste de regex

repetidos="/home/fabio/Documentos/Desenvolvimento/Regex/teste.txt";
[ -e "/home/fabio/Documentos/Desenvolvimento/Regex/teste_new.txt" ] && > "/home/fabio/Documentos/Desenvolvimento/Regex/teste_new.txt"
novorepetido="/home/fabio/Documentos/Desenvolvimento/Regex/teste_new.txt";

exec 3< "$repetidos";

	while read "linha" <&3;

	do
		echo "";
		echo "$linha";

		hash=$(echo $linha | cut -d"=" -f1);
		comparar=$(grep "$hash" "$repetidos");

		test -z $comparar && echo "Arquivo nulo" || grep -v ".svn" "$comparar" > $novorepetido; mv "$novorepetido" "$repetidos"; 

	done;



exec 3>&-;

