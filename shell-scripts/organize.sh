#!/usr/bin/env bash
# Template orgulhosamente criado por (Shell-Base)
#-----------HEADER-----------------------------------------------------------------|
#AUTOR
#  Jefferson Rocha <lrcjefferson@gmail.com>
#
#PROGRAMA
#  Shell-Base
#
#PEQUENA-DESCRIÇÃO
#  Programa para criação de template, deixe tudo organizado como deve ser!
#  Seus programas serão mais profissionais com o Shell-Base
#
#LICENÇA
#  MIT
#
#HOMEPAGE
#  https://slackjeff.github.io
#
#CHANGELOG
#
#----------------------------------------------------------------------------------|


#------VARS--------->
template="template."

# Colorindo a sua vida.
fecha="\033[m"
verde="\033[32;1m"
vermelho="\033[31;1m"
branco="\033[37;1m"
#-------------------->


#------FUNCTIONS----------->

dicas(){
clear
cat | less << EOF
INFORMAÇÃO

    Você sabe o poder do Shell? espero que sim! Vou te passar algumas dicas valiosas
    para deixar seu programa com um grande diferencial, afinal queremos criar programas
    e não scripts não é? scripts são descartáveis... Programas não.


VÁRIAVEIS DENTRO DE FUNÇÕES

    Quando você cria uma váriavel dentro de uma função utilize sempre local na frente,
    você não quer sujar o sistema do usuário não é?
    Utilizando o local na frente da váriavel, como o próprio nome sugere, vocẽ cria uma
    váriavel local, o que é mais correto de se fazer! exemplos:

    variavel=\$(printf %s "oi tudo bem?\n")        ERRADO
    local variavel=\$(printf %s "oi tudo bem?\n")  CORRETO


ECHO OU PRINTF?

    Prefira utilizar printf ao invés do echo!
    Vários testes foram feitos e todos eles apontaram que o printf é mais leve
    que o echo.
    O echo tem vários parâmetros que não são portáveis para outros dialetos do shell.
    Então prefira e se acostume com o printf! ele é mais simples, poderoso e portável para
    Todos os dialetos do Shell.
    
    echo -e "\033[31;1m OLÁ MUNDO! \033[m"   ERRADO
    printf %b "\033[31;1m OLÁ MUNDO! \033[m" CORRETO
    

NÃO USE PRINTF OU ECHO DESNECESSÁRIOS!

    É de costume que muitos programadores usem echo e printf desnecessários!
    Por exemplo para criar um simples menu, 10 echo antes e 10 echo depois para
    deixar o script bem alinhado!
    Isso é correto? sim... Se funciona não tem como dizer que é errado, porem é bom
    sempre criar programas mais profissionais, principalmente quando você disponibiliza
    na internet!
    Sempre use a boa prática e não faça nada na base do facão. 
    Sabemos que Shell e perfomace já não andam juntos! então prefira
    não deixar seu programa mais lento.

    MANEIRA LENTA
    
    echo
    echo
    echo "-----------------------------------------------------------"
    echo "OI TUDO BEM?"
    echo "Este é meu programa que faz alguma coisa!"
    echo "Este monte de echo, não sei por que estou usando."
    echo "Achei bonito e resolvi fazer um cabeçalho para meu programa"
    echo "Desta forma!"
    echo "-----------------------------------------------------------"
    echo
    echo
    
    OPÇÕES MAIS RÁPIDAS

    printf %b \\
      "\n\n\nOI TUDO BEM?
      Este é meu programa que faz alguma coisa!
      Agora com certeza estou deixando meu programa um pouco mais leve
      Não estou usando echo ou printf desnecessários!\n\n\n"

    cat << FECHA
    
    
    
      OI TUDO BEM?
      Este é meu programa que faz alguma coisa!
      Agora com certeza estou deixando meu programa um pouco mais leve
      Não estou usando echo ou printf desnecessários!
      
      
      
    FECHA


ESTÁ EM DÚVIDA? USE ASPAS.

    Em Shell tudo é strings, prefira sempre usar aspas em tudo.
    Além de aspas proteger sua string caso ela esteja nula, ficará mais agradavel
    e mais profissional desta forma!
    Mas tome cuidado, alguns retornos de algumas váriaveis de ambiente podem
    ser alteradas! como por exemplo a váriavel de ambiente $*
    Sem aspas ela criar uma string em uma única linha, caso você use
    aspas ela muda o seu retorno!
    
    
    var="Aqui tem string e número 1991"
    var="Jefferson"
    var="1991"
    var="Uma string"
    case "\$UID" in 1000) printf %b "OI?\n"; esac
    for list in "arq1" "arq2" "arq3" "slackjeff the power"; do printf "\$list\n"; done
    "\$?"
    

COMENTÁRIOS SÃO IMPORTANTES!
    
    Ao contrário que muita gente fala, comentários são extremamentes importantes!
    Não faça declarações de amor, ou falando mau do seu programa ou do mundo em geral!
    Sim, eu sei que as vezes ficamos com ráiva por que um certo trecho de código não está
    funcionando, faz parte e lide com isso.
    Comentários são de extrema importância, pois assim estamos cooperando para outros programadores
    mais leigos!
    Eles conseguiram ler com mais facilidade um bloco de código, quando ele está comentado!
    Faça sempre comentários nas linhas de códigos mais "complicadas" isto por exemplo não
    é tão certo:
    
    # Bloca que verifica se o usuário é root
    # se for root ele imprimi uma mensagem para
    # o usuário.
    # Se não for root o programa continua!
    if test "\$UID" -eq "0"; then
        printf "Rooot? não."
    fi    
   

    Você não está falando para crianças do prezinho! você está falando com outros programadores.
    Quem for ler o seu código, sabe o que quer! Mesmo que sejam programadores que estão récem aprendendo
    Eles não são incopetentes a ponto de não saber o que um bloco simples deste faz!
    Caso prefira comentar, faça algo simples e direto:
    
    # É root?
    if test "\$UID" -eq "0"; then
        printf "Rooot? não."
    fi  

   # Dialog está instalado? 
   if ! type -P dialog; then
      printf %b "Parece que o dialog não está no seu sistema."
   fi   
   
   Percebeu que comentado fica mais fácil compreender? e eu precisei especificar o que todo o bloco faz?
   Um simples comentário indo direto ao ponto já fica bem melhor a compreensão!
   Por exemplo, muitas pessoas não sabem que com o comando type podemos verificar se o programa X está instalado
   no sistema...
   Ahh, já que entramos no assunto, o comando type é portavel para outros dialetos do Shell! 
   ao contrário do comando which.
   
   Caso você irá fazer uma maior explicação do que aquele bloco de código faz, use o bloco de comentários, 
   por exemplo:
   
   # BUG
   # Nesta parte do código não estou conseguindo
   # resolver a questão do status de sáida!
   # Ele retorna status 0, quando era para estar
   # retornando status 1.
   
   Se for um pequeno comentário, prefira usar comentários de meia linha.
   
   > "arquivo.\$log" # Criando log temporário.
   
   Ou comentários do tipo cabeçalho.
   
   # Criando log temporário.
   > "arquivo.\$log"
   
   
&& || NÃO SUBSTITUI IF E ELSE

     Operadores lógicos AND e OR não são blocos condicionais if e else!
     Tudo bem acontece que o && só executa o próximo comando se o primeiro comando retornar
     status de sáida 0.
     E o || é executado caso o primeiro comando retornar um status diferente de 0.
     Utilize sempre operadores lógicos quando precisar verifcar um status por exemplo, que pode ser criado
     em uma única linha, mas não abuse, prefira sempre blocos condicionais completos!
     
     Ok, seu código irá ficar mais grande, mas use a boa prática sempre!
     Dê uma conferida em programas de programadores avançados em Shell...
     Dificilmente você verá blocos de Operadores lógicos substituindo if/else.
     
     Condicional com and e not
     
     [[ "\$name" = "Slackjeff" ]] && shutdown -r now || printf "Usuário $name, não encontrado no sistema.\n."
      
     ou
     
     [[ "\$name" = "Slackjeff" ]] && \	\
       shutdown -r now
       || \\
       printf "Usuário $name, não encontrado no sistema.\nVocê não tem permissão\n." 
      
     Bloco condicional completo, if/else   
     
     if [[ "\$name" = "Slackjeff" ]]; then
        shutdown -r now
     else
        printf "Usuário $name, não encontrado no sistema.\nVocê não tem permissão\n."
     fi
   

USE AWK COM MODERAÇÃO!

    awk sem dúvidas é uma linguagem de manipulação de texto muito potente!
    Integrada com sed, que é outra linguagem muito potente, você faz tudo, o que uma não faz
    a outra com certeza irá fazer.
    Mas use com cuidado a linguagem awk, ela é pesada e com certeza irá deixar seus programas mais
    pesados. 
    Para substituir o awk você pode utilizar as ferramentas básicas que está presente em qualquer distribuição
    GNU/Linux.
  
    sed
    grep
    cut


OH MY READ

    Programas com interação com o usuário é muito importante e legal!
    Para isto usamos o comando read, ele faz a leitura do stdin (teclado).
    Mas a partir de agora você vai começar a reparar como os programadores o fazem!
    Vamos a alguns exemplos:
    
     printf %s "Qual é o diretorio que você deseja salvar o arquivo?"
     read dir_save
    
    O código acima pode simplesmente ser substituido assim, economizando uma linha e um printf:
    
     read -p  "Qual é o diretorio que você deseja salvar o arquivo?" dir_save
    
    Legal! mas eu quero colorir o o texto do read, como faço? simples utilize $'', basicamente você está
    protegendo sua string mas interpreta \n, \t, \a etc... diferente das aspas simples '' sozinha.
    
     read -p  $'\033[34;1mQual é o diretorio que você deseja salvar o arquivo?\033[m\n' dir_save
    
    Um problema que vejo é ter 50 read fazendo um formulario, por exemplo supondo que eu quero fazer várias
    perguntas para meu usuário, como eu faço?
    
     read -p  "Qual a sua idade?" idade
     read -p  "Cor favorita?" cor
     read -p  "Nome da sua mae" nome_mae
     read -p  "Escolaridadae?" escolaridade
     read -p  "Nome da namorada" nome_namorada
     
    Está correto usar vários read? sim! não está errado, e tem situações que você irá precisar usar o read neste
    formato.
    Mas como é um simples formulário, podemos criar um loop for por exemplo, assim vamos economizar dedo.
    
    for form in "idade" "cor_favorita" "nome_mae" "escolaridade" "nome_namorada"; do
        read -p "\${form[@]}: "\${form[@]}
    done    
    
      
STATUS DE SÁIDA!    
    
    Em muitos casos a váriavel de ambiente \$? salva nosso dia! principalmente quando precisamos verificar muitos
    status de sáida, como é no caso da interface dialog.
    Vamos ao exemplo, se o usuário apertar Yes o status retorna 0 se for No retorna 1.
    
    # Aperto no, o script sai.
    dialog --yesno "Você deseja continuar?" 0 0
    if [[ "\$?" -ne "0" ]]; then
        exit 1
    fi
    
    Mas pode dar erro! se por acidente em uma madrugada eu acabo inserindo um echo
    entre o dialog e a condicional if?
    Não preciso dizer que o status irá mudar não é? será sempre 0, já que é quase impossivel do echo dar erro.
    Você precisa entender que a váriavel de ambiente \$? é a maria vai com as outras, então tente evitar de usar ela.
    Mas terá casos que você irá precisar usar.
    Em seu lugar utilize bloco/blocos if! será melhor, e você evitá problemas futuros!
    Vamos ao mesmo exemplo acima com dialog... 
    
    # Aperto no, o script sai.
    if ! dialog --yesno "Você deseja continuar?" 0 0; then
        exit 1
    fi
    
    Mais um exemplo, vamos verificar se o grep achou o usuário root em /etc/passwd
    
    if grep -e "^[Rr]oot" /etc/passwd; then
        printf "Encontrei o usuário root no sistema!"
    else
        printf "O usuário root não foi encontrado! favor criar."
    fi    


TESTE COM CONCIENCIA!
  
    No interpretador bash não é correto fazer testes neste formato [ teste ], sim! se você não está usando
    o bourne shell "sh" como interpretador prefira utilizar o padrão bash [[ teste ]].
    
    if [[ -z "\$HOME" ]]; then
        printf "Não está vazia."
    else
        printf "Está vazia."
    fi
    
    ou teste de uma linha
    
    [[ -z "\$HOME" ]] && printf "Está vazia." || printf "Não está vazia."    
  

Texto criado por Jefferson Rocha <lrcjefferson@gmail.com>
EOF
}



ajuda(){
clear
cat << EOF
OPÇÕES DISPONIVEIS: 

     -c ou --criar
        Para criar um template utilize este parâmetro.
        Você pode deixar todas informações nulas se caso você deseja.
         
    -a ou --ajuda
        Mostra esta opção de ajuda.
    
    -d ou --dicas
        Texto contendo algumas dicas de programação Shell.
 
EOF

}



base(){
# Base de todo o programa se encontra aqui
# Caso queira modificar, não esqueça de adicionar
# tambem no vetor.

cat << EOF > "${template}${interpretador}"
#!/usr/bin/env $interpretador
# Template orgulhosamente criado por (Shell-Base)
#-----------HEADER-----------------------------------------------------------------|
#AUTOR
#  $autor <$e_mail>
#
##DATA-DE-CRIAÇÃO
#  $data 
#
#PROGRAMA
#  $nome_do_programa
#
#PEQUENA-DESCRIÇÃO
#  $pequena_descricao
#
#LICENÇA
#  $licenca
#
#HOMEPAGE
#  $homepage 
#
#CHANGELOG
#
#----------------------------------------------------------------------------------|


#--------VÁRIAVEIS--------->
# Aqui vai todas as 
# váriaveis do programa.
#-------------------------->


#--------FUNÇÕES----------->
# Funções vão aqui!
#-------------------------->

#------TESTES-------------->
# Testes iniciais do
# seu programa vão
# neste bloco.
#-------------------------->


# Programa começa aqui :)

EOF
}


criar(){
data=$(date "+%d/%m/%Y ás %H:%M")
# Vetor contendo o questionario que será passado para o usuario.
informacoes=("interpretador" "autor" "e_mail" "nome_do_programa" "pequena_descricao" "licenca" "homepage")

local texto="${vermelho}Preencha todos os dados corretamente!
Assim você não perde seu tempo depois.
O arquivo gerado terá o nome ${branco}template.INTERPRETADOR${fecha} ${vermelho}no diretório atual.\n\n${fecha}"

printf %b "$texto"
for info in "${informacoes[@]}"; do
    read -ep "${info[@]}: " ${info[@]}
done

# Chamando e testando a função para criar template de acordo
# com os dados passados.
if base; then
    printf %b "${verde}Concluído com sucesso.\nArquivo gerado: ${template}${interpretador}${fecha}\n"
      exit 0
else
    printf %b "${vermelho}Não consegui criar o arquivo, tente novamente...\n${fecha}"    
    exit 1
fi
}
#-------------------------->



# Verificando qual parâmetro foi passado.
case $1 in
    -c|--criar) criar ;; # Chamada Função.
    -a|--ajuda) ajuda ;; # Chamada Função.
    -d|--dicas) dicas ;; # Chamada Função.
    *) printf %b "Você pode conferir toda ajuda utilizando o parâmetro ${vermelho}-a${fecha} ou ${vermelho}--ajuda${fecha}\n"
esac