%{
#include "global.h"
#include "sintatico.h"
#include <stdlib.h>
%}

falso [0fF]|"falso"
verdadeiro [1vV]|"verdadeiro"
branco [ \t]+
digito [0-9]
inteiro {digito}+
expoente [eE][+-]?{inteiro}
real {inteiro}("."{inteiro})?{expoente}?
caractere [a-zA-Z0-9]
logico {verdadeiro}|{falso}
indefinido "indefinido"

%%

{branco} { /* We ignore white characters */ }
{real} {
yylval=atof(yytext);
return(NUMERO);
}

"+" return(MAIS);
"-" return(MENOS);
"*" return(ASTERISCO);
"/" return(BARRA);
"^" return(POTENCIA);

"<-" | "recebe" return(ATRIBUICAO);
"!=" | "diferente"return(DIFERENTE);
"&&" return(E);
"||" return(OU);
"+<-" return(MAIS_ATRIBUICAO);
"-<-" return(MENOS_ATRIBUICAO);
"*<-" return(ASTERISCO_ATRIBUICAO);
"/<-" return(BARRA_ATRIBUICAO);

"<" return(MENOR);
">" return(MAIOR);
"=" return(IGUAL);
"!" return(EXCLAMACAO);
"|" return(BARRA_VERTICAL);
"&" return(E_COMERCIAL);

":" return(DOIS_PONTOS);	/* para a futura identação se der tempo */

"(" return(PARENTESIS_ESQUERDO);
")" return(PARENTESIS_DIREITO);
"{" return(CHAVE_ESQUERDA);
"}" return(CHAVE_DIREITA);
"[" return(COLCHETE_ESQUERDO);
"]" return(COLCHETE_DIREITO);

"\n" return(FIM_LINHA);

%%

yywrap () {
return 0;
}
