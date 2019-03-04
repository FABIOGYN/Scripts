#!/usr/bin/env bash


##


##Script para encontrar arquivos repetidos pela comparacao de hash md5 e criar relacao de arquivos de varios discos.

#Inserir mensagem de orientação para o usuário saber como executar o script.

####Variaveis e diretórios
#=======================================================================================================================

name='03-repeated-files.sh';
version='0.1a';
paran1=$1; # Recebe o primeiro parametro
paran2=$2; # Recebe o segundo parametro

#Diretorio dos logs

#Verificando se existe o diretório de logs, se não existir, criar

[ -e /tmp/scripts ] || mkdir /tmp/scripts;

##Verificando se existe o arquivo de logs, se não existir, criar

[ -e /tmp/scripts/relacao_repetidos.log ] || >/tmp/scripts/relacao_repetidos.log;

filelog=/tmp/scripts/relacao_repetidos.log;
filedel=/tmp/scripts/relacao_deletados.txt;


#=======================================================================================================================



echo "$(date +"%m-%d-%Y-%T") - Script iniciado pelo usuário $USER" | tee -a "$filelog";
echo "";



####Funções
#=======================================================================================================================

function _msguser(){

	echo " 	============================================================================================================
	       	
	       	Programa em shell script para procurar por arquivos repetidos.

	       	Os hashes MD5SUM dos arquivos são utilizados para identificar os arquivos repetidos, mesmo em diretórios 
	       	diferentes, com nomes diferentes, data de criação diferentes; O conteúdo é o que difencia os arquivos.
						
			Uma listagem de arquivos repetidos agrupados e separados por uma linha em branco será gerada após a busca.
			Será necessário comentar, insesir um # no início das linhas referentes aos arquivos que deverão ser DELETADOS.


			Execução do script:

			O script quando executado da seguinte forma:

			./03-repeated-files.sh


			Irá retornar a tela de opções de execução do script que também pode ser acessada com a seguinte sintaxe:


			./03-repeated-files.sh -h ou ./03-repeated-files.sh --help

			Para iniciar a busca por arquivos repetidos, um exemplo da sintaxe é a seguinte:

			./03-repeated-files.sh -f <caminho-do-diretorio-que-se-deseja-verificar> 

			ou 

			./03-repeated-files.sh --findrepeteadeds <caminho-do-diretorio-que-se-deseja-verificar>

			Exemplo: 

			./03-repeated-files.sh -f /home/fabio/Dowloads ou ./03-repeated-files.sh --findrepeteadeds /home/fabio/Dowloads


			Nesta execução será gerada uma relação de arquivos repetidos agrupados e separados por uma linha em branco dentro do seguinte diretório:

			/arquivos_repetidos, com nome listagem-repetidos-usuario.txt.

			Exemplo do caminho do diretório e da relação de arquivos repetidos:

			/home/fabio/Dowloads/arquivos_repetidos/listagem-repetidos-usuario.txt

			Após esta execução o usuário deve editar o arquivo "listagem-repetidos.txt" e comentar as linhas referentes 
			aos arquivos que deverão ser deletados.
			Neste passo pode-se encerrar o script ate que a relação de arquivos seja comentada com os arquivos a serem deletados 
			e continuar a execução do script posteriormente ou continuar a execução do script.

			No caso de encerrar o script e continuar após a marcação dos arquivos a serem deletados, a sintaxe de execução do script deve ser a seguinte:

			./03-repeated-files.sh -d /home/fabio/Dowloads/arquivos_repetidos/listagem-repetidos-usuario.txt 

			ou 
			
			./03-repeated-files.sh --deletefoundfiles /home/fabio/Dowloads/arquivos_repetidos/listagem-repetidos-usuario.txt

			
           	Deseja continuar? (S/N)

           	============================================================================================================";

           read user_choise; # Salvando a opção escolhida pelo usuário.
};

function _help(){

	#Exibindo na tela as opções de execução do programa.

	cat <<EOF
	Script: ${name} Versão: ${version}

	Opções:

 	-f, --findrepeteadeds
 	Procura por arquivos repetidos no diretorio informado pelo usuário e gera um relatório listando os arquivos repetidos.

 	Sintaxe de execução:

 	./${name} -f <caminho-desejado> ou ./${name} --findrepeteadeds <caminho-desejado>

 	-d, --deletefoundfiles
 	Após o usuŕio marcar com um # os arquivos de devem ser deletados, inicia deleção de arquivos marcados.

 	Sintaxe de execução:

 	./${name} -d ou ./${name} --deletefoundfiles

 	-c, --continuedelete
 	Continua deletando os arquivos repetidos de acordo com relação gerada.

	Sintaxe de execução:

 	./${name} -c ou  ./${name} --continuedelete
	
	-h, --help
 	Imprime a ajuda do script.

 	Sintaxe de execução:

 	./${name} -h ou  ./${name} --help


EOF

}


function _listrepeteadfiles(){

	#Verificando se existe o arquivo com a relação de repetidos, se existe, informa e se não existe, executa a busca

	if [[  -e $paran2"/arquivos_repetidos/listagem-repetidos.txt"  ]]
	
	then
		echo "$(date +"%m-%d-%Y-%T") - A listagem já foi gerada, não é necessário outra listagem." | tee -a "$filelog";
		echo "";

	else

		#Log do início da busca, para ao analisar logs, determinar o tempo gasto pela busca.

		echo "$(date +"%m-%d-%Y-%T") - Iniciando busca por arquivos repetidos no seguinte caminho: $2." | tee -a "$filelog";

		#Em alguns casos o diretório não foi criado, para contornar, crio agora

		mkdir $paran2/arquivos_repetidos;

		#O find faz a busca no diretório informado pelo usuário como segundo parametro de execução do script, em seguida repassa para 
		#o xargs que executa o calculo do hash md5sum, depois ordena (pesquisar melhor opçoes do sort), em seguida "pega" as linhas 
		#baseadas em seus primeiros 32 caracteres e as agrupa inserindo uma linha em branco, e por ultimo, o sed faz uma substituição 
		#do espaço entre o hash e o caminho/nome do arquivo repetido. Salva relação em arquivo de texto dentro do diretorio informado pelo user.

		find "$paran2" -type f -print0 | xargs -0 -I "{}" sh -c 'md5sum "{}"' | sort -h -k2 -r | uniq -w32 --all-repeated=separate | sed 's/  /=/g' > $paran2"/arquivos_repetidos/listagem-repetidos.txt";

		#Log do fim da busca.

		echo "$(date +"%m-%d-%Y-%T") - Finalizada a busca por arquivos repetidos no seguinte caminho: $2." | tee -a "$filelog";
	fi;

	#Log e backup do arquivo da busca para comparação do foi deletado

	echo "$(date +"%m-%d-%Y-%T") - Realizando backup da relação de arquivos repetidos." | tee -a "$filelog";

	cp $paran2"/arquivos_repetidos/listagem-repetidos.txt" $paran2"/arquivos_repetidos/listagem-repetidos-bkp.txt";
	
};


function _delchoosenfiles(){

	#O descritor passa uma linha por vez para o while, evitando que a memória seja sobrecarregada.

	exec 3< "$paran2";


		while read "marcado" <&3;
		do
			# É preciso tratar a linha em branco para que ao entrar no if não gere uma saida com um arquivo que vai ser mantido.
		
			if [[  -n "$marcado"  ]] # linha não nula, ou seja, com conteúdo.

			then

				#Aqui a variável deletar recebe o primeiro caracter da linha lida

				deletar=$(echo "${marcado:0:1}");

				#Se o primeiro caracter da linha for um #, então a condição sera verdadeira e os comandos do if serão executados.


				if [[  "$deletar" == '#'  ]]

				then

					#A variável linha recebe apenas o caminho do arquivo recortado pelo cut

					linha=$(echo $marcado | cut -d"=" -f2);

					#Logando e executando a deleção do arquivo marcado

			

					echo "$(date +"%m-%d-%Y-%T") - Arquivo deletado: $linha" | tee -a "$filelog";

					rm -rf "$linha";

					#echo "$apagar";

					#Remover as linhas referentes aos arquivos repetidos e deletados.

					grep -v "$linha" "$paran2" >> "$filedel";

					mv "$filedel" "$paran2";

				fi;

			else

				#As linhas em brando entre o agrupamentos de arquivos repetidos são tratados para não gerarem erros no script.

				echo "$marcado" > /dev/null;

			fi;


		done;

	#Liberando o descritor 3.

	exec 3>&-;

}


#################################################################################################
##                                                                                             ##
##				                             	MAIN	                    				   ##
##												                                               ##
#################################################################################################


#Chamando a função mensagem para o usuário. 

_msguser;

#Validando se o usuário deseja continuar.

if [[  $user_choise != 'S'  ]];

then

	#Logando

	echo "";
	echo "$(date +"%m-%d-%Y-%T") - Script finalizado por escolha do usuário" | tee -a "$filelog";
	sleep 2;
    exit 0;

fi;

#Tratando do caso de executar o script sem passar nenhum parametro.

[ -z "$1" ] && { echo "$(date +"%m-%d-%Y-%T") - ERROR: Execução do script sem parametros. Execute $name -h para opções de execução!" | tee -a "$filelog"; echo ""; _help; \
	echo "$(date +"%m-%d-%Y-%T") - Script finalizado por falta de informação de caminho para busca." | \
	tee -a "$filelog"; sleep 2; exit 1;}


#Gerando opções execução

case "$1" in

	#Função de busca pelos arquivos repetidos, valida se o caminho foi informado, se não foi, informa a necessidade, 
	#exibe o help com informaçoes sobre como executar o script. Loga.

	-f|--findrepeated)

		shift # Rebaixando o parametro posicional - O segundo parametro se torna o primeiro, o terceiro o segundo e assim por diante.
			[ -z "$1" ] && { echo "$(date +"%m-%d-%Y-%T") - ERROR: É preciso especificar um caminho para realizar a busca." | \
			tee -a "$filelog"; echo ""; _help; echo "$(date +"%m-%d-%Y-%T") - Script finalizado por falta de informação de caminho para busca." | \
			tee -a "$filelog"; sleep 2; exit 1;}
			
			
			_listrepeteadfiles "$@"; 
			echo "";
			echo "==========================================================================================================
					
					Foram encontrados arquivos repetidos. Edite o arquivo $paran2/arquivos_repetidos/listagem-repetidos.txt.
					
					Insira um # no início das linhas referentes aos arquivos que deseje que sejam DELETADOS. 
					Em seguida execute o script novamente com a opção -d ou --delchoosenfiles com caminho para o arquivo 
					editado por você.  Para mais opções de execução execute: $name -h ou --help

					
				  =========================================================================================================="; echo ""; exit 0; ;;


	-h|--help) _help; ;;


	-d|--delchoosenfiles)
		shift # Rebaixando o parametro posicional - O segundo parametro se torna o primeiro, o terceiro o segundo e assim por diante.
			[ -z "$1" ] && { echo "ERROR: É preciso especificar o caminho completo para o relatório da busca anteriormente realizada." | tee -a "$filelog"; echo ""; _help; \
			echo "$(date +"%m-%d-%Y-%T") - Script finalizado por não informar camanho/arquivo com relação de arquivos a serem deletados." | \
			tee -a "$filelog"; sleep 2; exit 1;}


			_delchoosenfiles "$@"; ;;

esac;


#teste de parametros
#echo "Foram digitados $# parâmetros. São eles: $*.";
#echo "O primeiro parâmetro foi: $1";
#echo "O nome do script é: $0"; 


#####Diversos

var=123;

echo 'var';
echo "var";
echo '$var';
echo "$var";
