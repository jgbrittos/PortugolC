%{
#include "global.h"
#include "sintatico.h"
#include <stdlib.h>
#include <string.h>
//#include <tabelasimbolos.c>
#define YY_DECL extern int yylex()
char buffer[100];
//char *buffer;
%}

/* This tells flex to read only one input file */
%option noyywrap

falso [0fF]|"falso"
verdadeiro [1vV]|"verdadeiro"
branco [ \t]+
digito [0-9]
inteiro {digito}+
expoente [eE][+-]?{inteiro}
numero_real {inteiro}("."{inteiro})?{expoente}?
letra [a-zA-Z]
caractere [{letra}0-9]
logico {verdadeiro}|{falso}
indefinido "indefinido"

identificador {letra}+|{letra}+_{letra}+|_{letra}+

%%

{branco} { printf("\n");/*Nós ignoraremos o espaço em branco*/ } 

{numero_real} { 
	yylval=atof(yytext); 
	return(NUMERO_REAL);
}

"inclua"	return(INCLUA);
"defina"	return(DEFINA);

"caractere"	return(CARACTERE);
"inteiro"	return(INTEIRO);
"real"		return(REAL);

"enquanto" 	return(ENQUANTO);
"se" 		return(SE);
"if" 		return(SE);
"senao"		return(SENAO);
"else" 		return(SENAO);
"para"		return(PARA);
"de"		return(DE);
"ate"		return(ATE);
"passo"		return(PASSO);
"faca"		return(FACA);
"repita"	return(REPITA);

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
","		return(VIRGULA);
"(" 		return(PARENTESIS_ESQUERDO);
")" 		return(PARENTESIS_DIREITO);
"{" 		return(CHAVE_ESQUERDA);
"}" 		return(CHAVE_DIREITA);
"[" 		return(COLCHETE_ESQUERDO);
"]" 		return(COLCHETE_DIREITO);

"main"		return(PRINCIPAL);
"principal"	return(PRINCIPAL);

"\n" 		return(FIM_LINHA);

{identificador} { 
	/*char c = ' ';
	int i = 0;
	while(c != '\0'){
		if(yytext[i] == '\0')
			break;
		i++;
	}
	buffer = (char *) calloc(i,(sizeof(char)));*/
	strcpy(buffer, yytext);
	return IDENTIFICADOR; 
}


%%

//no aditional c code

