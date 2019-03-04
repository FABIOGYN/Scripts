#!/bin/bash


exec 3< "$1";

while read linha <&3;
do
	echo "";
	echo "Linha a ser analisada: $linha";
	echo "";
	
	cerquilha=$(echo ${linha:0:1});
	
	echo "Verificando se o arquivo contem: $cerquilha";

	if [[  $cerquilha == "#" ]]
	then
		echo "O arquivo possui cerquilha e sera deletado!";
		echo "";

		
		deletar=$(echo $linha | cut -d"=" -f2);
		echo "O arquivo $deletar será deletado!" | tee -a $1/relacao_final.log;
		rm -rf "$deletar";

	else
		echo "O arquivo $linha não possui cerquilha e sera mantido!" | tee -a $1/relacao_final.log;

	fi;
done;

