#!/bin/bash

exec 3< "/arquivos/arquivos_repetidos/teste.txt"


while read arquivo <&3;
do
	#if [[ $(echo "$arquivo" | grep "xxx pack01") ;


	if [[  $(echo "$arquivo" | grep "xxx pack01" = "") ]] &&  sed -i 's/^/\#/' >>  "/arquivos/arquivos_repetidos/teste.txt" || \
      echo "$arquivo" >> "/arquivos/arquivos_repetidos/teste.txt";

done;

exec 3>&-;
