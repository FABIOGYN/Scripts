#!/bin/bash


# Apresentacao      :   Barra de progresso em ASCII
# Descricao         :   Exibe uma serie de pontos, simulando uma barra crescente enquanto executa um script ou funcao.
# Autor            :   Renato Augusto Andrade
# Local/Ano         :   Belo Horizonte,MG/ 2016
# Publico Alvo      :   Iniciantes em Shell Script


# ========================================================================================================
# Funcao super simples que mostra a barra crescente de pontos.

function progresso()
{
   while true
   do
      echo -en "."
                sleep .05                  # Intevalo de 5 centesimos de segundo entre cada ponto. Pode ser alterado.
   done         
}

# ========================================================================================================



# ========================================================================================================
# Coloque aqui sua funcao/script que sera monitorada pela barra de progresso, como por exemplo envio de
# arquivos para um servidor FTP ou a gravacao de uma imagem ISO.

function minhafuncao()
{






}

# Fim do espaco para sua funcao.
# ========================================================================================================


# ========================================================================================================
# A ideia aqui sera exibir uma mensagem na tela para o usuario e, enquanto sua funcao/script executa, a
# barra de progresso em pontos seguira crescendo a partir da mensagem.
 
clear
  echo -ne "\n\n\n\t\tAguarde.\n\t\tExecutando."         # Exibe uma mensagem introdutoria.

  progresso &                                                    # Chama a funcao da barra de progresso e envia para segundo plano.

  meuprogresso=$!                                                 # Obtem o PID da funcao "progresso" e alimenta a variavel "meuprogresso".

  minhafuncao                                                     # Chama a funcao criada por voce. Enquanto ela executa, os pontos seguirao crescendo.
  
  kill $meuprogresso >/dev/null 2>&1                        # "Mata" a barra de progresso ao terminar de executar a funcao criada por voce.

  echo -e " 0k\n\n\t\t Trabalho terminado.\n"            # Avisa ao usuario que o processo terminou.

  sleep 3                                                            # Espera tres segundos antes de sair.

  exit 0                                                             # Encerra e sai.