#!/usr/bin/env bash

#1 ponto de atenção: Sempre usar o shebang dinamico, assim o script pode ser utilizado em diferentes distribuições.

echo "content-type: text/html"
echo
echo
URL=$(sed -n '1p')

echo $URL

#=============================================================================
#Verificando o que esta sendo recebido pelo cgi da pagina web quando o usuario digita o caminho e clica em "Procurar arquivos repetidos".



#2 ponto de atenção: Criar um cabeçalho com a identificação de quem fez o script, dados de contato, nome do script, função e chamgelog.


#====================================Header===================================
#=============================================================================
#AUTHOR
# Fabio Rodrigues Pinto <fabioti1607@gmail.com>
#
#PROGRAM
#FindRepeatedFiles.cgi
#
#DESCRIPTION
#Script CGI que procura por arquivos repetidos, gera uma saída com os arquivos repetidos encontrados agrupados e separados por linhas em branco, 
#para que o usuário selecione (checkbok) os arquivos que deseja deletar, em seguida o script atua sobre os arquivos selecionados e os deleta. 
#Logs das ações são armazenados, bem como uma relação dos arquivos após deleção dos repetidos para futura comparação em caso de haver algum arquivo 
#repetido em outro dispositivo de armazenagem.
#
#CHANGELOG
#24/01/2019 - Criação do script CGI;
#=============================================================================

#3 ponto de atenção: Mensagem ao usuário. É preciso que seja passada uma mensagem para o usuário entender o que o script faz, 
#como deve ser utilizado e passos adicionais que o usuário precisa dar para a completa e correta execução do script.

#================================MENSAGEM
#A mensagem para o usuário está no arquivo html inicial que chama o script.

#=======================================


#4 ponto de atenção: Variáveis inseridas neste campo para facilitar a compreensão e organização do script.

#==============================VARIAVEIS

name='FindRepeatedFiles.cgi';
version='0.1a';

#=======================================

#5 ponto de atenção: Campo para as funções, crie funções que possam ser exetadas sozinhas.

#================================FUNCOES

#Verifica se o diretorio informado existe e exibe mensagem solitando diretorio válido
#Verifica se o diretorio onde serão salvos as relações dos arquivos procurar existe e se não existe, cria.

function _directoryrepeteadfiles(){

	[ -d "$URL" ] || echo "O diretório $URL não existe. Clique em voltar e insira um diretário válido";
	[ -d "$URL/arquivos_repetidos" ] || mkdir "$URL/arquivos_repetidos";

}


function _listrepeteadfiles(){

	if [[  -e $URL"/arquivos_repetidos/listagem-repetidos.txt"  ]]
	then
		echo "A listagem ja foi gerada, não é necesario outra listagem.";
		echo "";

	else

		find $URL -type f -print0 | xargs -0 -I "{}" sh -c 'md5sum "{}"' | sort -h -k2 -r | uniq -w32 --all-repeated=separate | sed 's/  /=/g' > $URL"/arquivos_repetidos/listagem-repetidos.txt";
	fi;

	cp $URL"/arquivos_repetidos/listagem-repetidos.txt" $URL"/arquivos_repetidos/listagem-repetidos-bkp.txt";

	#Retirando linhas em branco e inserindo o # no inicio de cada linha.
	#grep -v "^$" | sed s/^/\#/
	
};


#=======================================

















#=================================================================================================

echo "<html><head>"
echo              "<title>Find Repetead Files</title>"
echo       "</head>"
echo "<body>"
echo "Porque não esta sainda nada?"
echo "Não sei, tenho que descobrir, pesquisar, testar e continuar!"
echo "Nunca desistir, vc é o cara!"
echo "$DADOS"
echo "$_directoryrepeteadfiles"
echo      "<a href='../index.html'>Voltar</a><br />"
echo "</body>"
echo "</html>"

#=================================================================================================


##Diversos para não esquecer:

#Formulario com checkbox

#<form>
#<input type="checkbox" name="bike">
#Eu tenho uma bicicleta
#<br>
#<input type="checkbox" name="car">
#Eu tenho um carro