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
letra [a-zA-Z]
caractere [{letra}0-9]
logico {verdadeiro}|{falso}
indefinido "indefinido"

identificador [_{letra}]([_{letra}|{digito}])*

%%

{branco} { /* Nós ignoraremos os espaços em branco */ } 
{real} { 
	yylval=atof(yytext); 
	return(NUMERO);
}

"enquanto" 	return(ENQUANTO);
"se" 		return(SE);
"if" 		return(SE);
"senao"		return(SENAO);
"else" 		return(SENAO);
"para"		return(PARA);
"repita"	return(REPITA);
"faca"		return(REPITA);
"capte"		return(CAPTE);

"+" 		return(MAIS);
"MAIS" 		return(MAIS);
"-" 		return(MENOS);
"MENOS" 	return(MENOS);
"*" 		return(ASTERISCO);
"/" 		return(BARRA);
"^" 		return(POTENCIA);

"<-" 		return(ATRIBUICAO);
"recebe" 	return(ATRIBUICAO);
"!=" 		return(DIFERENTE);
"diferente"	return(DIFERENTE);
"&&" 		return(E);
"||" 		return(OU);
"+<-" 		return(MAIS_ATRIBUICAO);
"-<-" 		return(MENOS_ATRIBUICAO);
"*<-" 		return(ASTERISCO_ATRIBUICAO);
"/<-" 		return(BARRA_ATRIBUICAO);

"<" 		return(MENOR);
"MENOR"|"menor" return(MENOR);
"<=" 		return(MENOR_IGUAL);
">" 		return(MAIOR);
"MAIOR"|"maior"	return(MAIOR);
">=" 		return(MAIOR_IGUAL);
"=" 		return(IGUAL);
"IGUAL"|"igual"	return(IGUAL);
"!" 		return(EXCLAMACAO);
"|" 		return(BARRA_VERTICAL);
"&" 		return(E_COMERCIAL);

":" 		return(DOIS_PONTOS);	/* para a futura identação se der tempo */
";" 		return(PONTO_E_VIRGULA);

"(" 		return(PARENTESIS_ESQUERDO);
")" 		return(PARENTESIS_DIREITO);
"{" 		return(CHAVE_ESQUERDA);
"}" 		return(CHAVE_DIREITA);
"[" 		return(COLCHETE_ESQUERDO);
"]" 		return(COLCHETE_DIREITO);


"\n" 		return(FIM_LINHA);

%%

yywrap () {
return 0;
}
