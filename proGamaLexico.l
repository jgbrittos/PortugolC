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
/*exponant [eE][+-]?{integer}*/
real {inteiro}("."{inteiro})
caractere [a-zA-Z0-9]
/*literal {caractere}+*/
logico {verdadeiro}|{falso}
indefinido "indefinido"
SIMBOLO [a-zA-Z]+



/*

vetor xpto de 5 inteiros

vetor: 
	"vetor" SIMBOLO "de" NUMERO tipo

tipo:
	INTEIRO | REAL | CARACTERE | LOGICO



inteiro vet[5]

vetor:
	tipo IDENTIFICADOR "[" inteiro "]"
tipo:
	inteiro | REAL | CARACTERE | LOGICO


ponteiro indefinido p
(inteiro) p

int x;
void *x;

ponteiro "ponteiro"
ponteiro inteiro *p;
*/

%%

{white} { /* We ignore white characters */ }
{real} {
yylval=atof(yytext);
return(NUMBER);
}

"+" return(MAIS);
"-" return(MENOS);
"*" return(ASTERISCO);
"/" return(BARRA);


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
"%" return(PORCENTAGEM);
"|" return(BARRA_VERTICAL);
"&" return(E_COMERCIAL);

":" return(DOIS_PONTOS);	/* para a futura identação se der tempo */

"(" return(PARENTESIS_ESQUERDO);
")" return(PARENTESIS_DIREITO);
"{" return(CHAVES_ESQUERDO);
"}" return(CHAVES_DIREITO);
"[" return(COLCHETES_ESQUERDO);
"]" return(COLCHETES_DIREITO);

"\n" return(FIM_LINHA);

"inteiro" return(INTEIRO);
"real" return(REAL);
"caractere" return(CARACTERE);
"logico" return(LOGICO);
"ponteiro" return(PONTEIRO);


%%

yywrap () {
return 0;
}
