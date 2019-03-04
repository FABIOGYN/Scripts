#!/bin/bash

#====================================Header===================================
#=============================================================================
#AUTHOR
# Fabio Rodrigues Pinto <fabioti1607@gmail.com>
#
#PROGRAM
#01-Template-for-scripts.sh
#
#DESCRIPTION
#Cria template para cabeçalho e blocos para novos scripts.
#
#CHANGELOG
#
#=============================================================================

#============================VERIFICACAO
#=======================================

#==============================VARIAVEIS

name='organize'
version='0.1a'

#=======================================

#================================FUNCOES
_HELP()
{
cat <<EOF
${name} Versão ${version}

Opções
 -c, --create
 	Cria um template no diretorio atual.

 -h, --help
 	Imprime a ajuda do script.

EOF
}

_CREATE() # Cria o template no diretorio atual.
{
	cat > "${1}.sh" <<EOF # O cat vai criar o arquivo com o conteudo entre os EOF.
#!/bin/bash

#====================================Header===================================
#=============================================================================
#AUTHOR
# Fabio Rodrigues Pinto <fabioti1607@gmail.com>
#
#PROGRAM
#01-Template-for-scripts.sh
#
#DESCRIPTION
#Cria template para cabeçalho e blocos para novos scripts.
#
#CHANGELOG
#
#=============================================================================

#===========================VERIFICACAO
#======================================

#=============================VARIAVEIS
#======================================

#===========================BIBLIOTECAS
#======================================

#===============================FUNCOES
#======================================

#==================================MAIN
#======================================

EOF
}

#=======================================

#===================================MAIN
#=======================================

case $1 in
	-c|--create)
		shift # Rebaixando o parametro posicional
			[ -z "$1" ] && { echo "Precisa especificar um nome de programa"; exit 1 ;}
			
			#Verificando se ha espacos no nome do script e os troca por underscore.

			program_name="$@"; program_name=${program_name// /_}
			echo "$program_name"
			exit
			_CREATE "$@"
	;;
	-h|--help) _HELP ;;
esac
