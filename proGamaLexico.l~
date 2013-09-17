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
{inteiro} {
yylval=atof(yytext);
return(NUMBER);
}


"+" return(PLUS);
"-" return(MINUS);
"*" return(TIMES);
"/" return(DIVIDE);
"^" return(POWER);
"(" return(LEFT_PARENTHESIS);
")" return(RIGHT_PARENTHESIS);
"\n" return(END);

"inteiro" return(INTEIRO);
"real" return(REAL);
"caractere" return(CARACTERE);
"logico" return(LOGICO);
"ponteiro" return(PONTEIRO);


%%

yywrap () {
return 0;
}
