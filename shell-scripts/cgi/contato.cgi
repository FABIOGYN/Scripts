#!/bin/bash
  
  meu_mail="user@localhost.com.br"
  
  echo "content-type: text/html"
  echo
  echo
  echo "<html> <head> <title> CGI script </title> </head>"
  echo "<body>"
  VAR=$(sed -n '1p')
  echo "Exibindo ==>> $VAR"
  nome=$(echo $VAR | sed 's/\(name=\)\(.*\)\(\&address=.*\)/\2/;s/+/ /g')
  mail=$(echo $VAR | sed 's/\(.*&address=\)\(.*\)\(\&subject=.*\)/\2/;s/%40/@/')
  subj=$(echo $VAR | sed 's/\(.*&subject=\)\(.*\)\(\&message=.*\)/\2/')
  text=$(echo $VAR | sed 's/.*\&message=//')
  
  echo "<br>
  <br><b>Nome:</b> $nome
  <br><b>mail:</b> $mail
  <br><b>Subject:</b> $subj
  <br><b>Message:</b> $text
  <br>"
  
  mail -s "Mail from CGI" "$meu_mail" < $(echo -e "
  Nome: $nome 
  mail: $mail
  Subject: $subj
  Message: $text")
  
  echo "</body>"
  echo "</html>"i
