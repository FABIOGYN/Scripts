#!/bin/bash

##Teste de menu com comando select


#for arquivo in $(ls /arquivos/arquivos_repetidos/conjunto_arquivos_repetidos/*.txt);
#do
	#echo "Exibindo a linha : $arquivo";
	#echo "";

	#teste=$arquivo;

	#files=( $(cat $arquivo));
#redirecionar=$(ls "/arquivos/arquivos_repetidos/conjunto_arquivos_repetidos")


#redirecionar=$(find "/arquivos/arquivos_repetidos/conjunto_arquivos_repetidos" -name "*.txt" );

#echo $redirecionar > /tmp/teste.txt;

#	exec 3< "/tmp/teste.txt";

	#echo "";
	#cat /tmp/teste.txt;
	#echo "";

#	while read repetido <&3;
#	do
#		echo "Exibindo o repetido";
#		echo \n "$repetido";
#
#		echo "";

	
#	done;

#	exec 3>&-;
	#done< $arquivo;

	#${files[*]}

	#PS3="Choose :";

	#select repetido in "$(cat $arquivo)";
	#do
	#	echo "O arquivo: $REPLY foi escolhido e será mantido!";
		
	#	echo "";
	#	echo "Exibindo o arquivo a ser mantido: $arquivo";
	#	echo "";
	#	break;


		
	#done;



	#PS3="Choose: "
	#select repetido in "${files[*]}";
	#do
	#	echo $repetido;
	#	break;
	#done;

#done;


####Nova tentativa

##Tentar passar a relação completa de repetidos agrupados, separados por linha em branco.


exec 3< "/arquivos/arquivos_repetidos/conjunto_arquivos_repetidos/listagem-repetidos.txt";

primeira_linha=$(head -n 1 "/arquivos/arquivos_repetidos/conjunto_arquivos_repetidos/listagem-repetidos.txt");