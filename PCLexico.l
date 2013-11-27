%{
#include "sintatico.h"
#include <stdlib.h>
#include <string.h>
#define YY_DECL extern int yylex()
%}

/* This tells flex to read only one input file */
%option noyywrap
%option nounput

branco [ ]+
falso [0fF]|"falso"
verdadeiro [1vV]|"verdadeiro"
logico {verdadeiro}|{falso}
digito [0-9]
inteiro {digito}+
expoente [eE][+-]?{inteiro}
numero_real {inteiro}("."{inteiro})?{expoente}?
letra [a-zA-Z]
caractere [{letra}0-9]
indefinido "indefinido"
tipo (caractere|inteiro|real|ponteiro)
identificador {letra}+|{letra}+_{letra}+|_{letra}+

%%

{branco} {/* Ignorando espacos */}

{numero_real} { 
	yylval.number = atof(yytext); 
	return(NUMERO_REAL);
}

"\t"		return(TABULACAO);
"\n" 		return(FIM_LINHA);

"inclua"	return(INCLUA);
"defina"	return(DEFINA);

"enquanto" 	return(ENQUANTO);
"se" 		return(SE);
"senao"		return(SENAO);
"else" 		return(SENAO);
"para"		return(PARA);
"de"		return(DE);
"ate"		return(ATE);
"repita"	return(REPITA);
"faca"		return(FACA);

"pare"		return(PARE);
"retorne"	return(RETORNE);
"return"	return(RETORNE);

"leia"		return(LEIA);
"escreva"	return(ESCREVA);

"+" 		return(MAIS);
"-" 		return(MENOS);
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

"//"		return(COMENTARIO);

":" 		return(DOIS_PONTOS);	/* para a futura identação se der tempo */
";" 		return(PONTO_E_VIRGULA);
","			return(VIRGULA);
"(" 		return(PARENTESIS_ESQUERDO);
")" 		return(PARENTESIS_DIREITO);
"{" 		return(CHAVE_ESQUERDA);
"}" 		return(CHAVE_DIREITA);
"[" 		return(COLCHETE_ESQUERDO);
"]" 		return(COLCHETE_DIREITO);

"principal"	return(PRINCIPAL);

{tipo} {
	yylval.string = strdup(yytext); 
	return TIPO;
}

{identificador} { 
	yylval.string = strdup(yytext);
	return IDENTIFICADOR; 
}


%%

//no aditional c code

