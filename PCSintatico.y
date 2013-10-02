%{
#include "global.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// stuff from flex that bison needs to know about:
extern int yylex();
extern int yyparse();
extern FILE *yyin;

%}

%token INTEIRO REAL CARACTERE 
%token ATRIBUICAO DIFERENTE IDENTIFICADOR
%token MAIS MENOS 
%token ASTERISCO BARRA POTENCIA
%token FIM_LINHA
%token E OU
%token MAIS_ATRIBUICAO MENOS_ATRIBUICAO 
%token ASTERISCO_ATRIBUICAO BARRA_ATRIBUICAO
%token MENOR MAIOR MAIOR_IGUAL MENOR_IGUAL
%token IGUAL EXCLAMACAO
%token E_COMERCIAL BARRA_VERTICAL
%token DOIS_PONTOS PONTO_E_VIRGULA VIRGULA
%token CHAVE_ESQUERDA CHAVE_DIREITA
%token COLCHETE_ESQUERDO COLCHETE_DIREITO
%token PARENTESIS_ESQUERDO PARENTESIS_DIREITO

%token INCLUA

/*ESTRUTURA DE ENTRADA E SAIDA*/
%token CAPTE

/*SESSAO DE ESTRUTURAS CONDICIONAIS E DE REPETICAO*/
%token SE SENAO
%token PARA PARE ENQUANTO FACA REPITA RETORNE

%left MAIS MENOS
%left ASTERISCO BARRA

%start Entrada



%%

Entrada:
   /* Empty */
   | Entrada Linha
   ;
Linha:
   FIM_LINHA
   | Expressao FIM_LINHA { /*printf("Resultado: %.2f\n",$1); */}
   ;
Expressao:
   REAL { $$=$1; }
  /* | SE Expressao MAIOR Expressao { printf("if(%.2f > %.2f){}\n",$2, $4); }
   | SE Expressao MAIOR_IGUAL Expressao { printf("if(%.2f >= %.2f){}\n",$2, $4); }
   | SE PARENTESIS_ESQUERDO Expressao MAIOR Expressao PARENTESIS_DIREITO { printf("if(%.2f > %.2f){}\n",$3, $5); }
   | SE PARENTESIS_ESQUERDO Expressao MAIOR_IGUAL Expressao PARENTESIS_DIREITO { printf("if(%.2f >= %.2f){}\n",$3, $5); }

   | SE Expressao MAIOR Expressao CHAVE_ESQUERDA 
	CHAVE_DIREITA SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f > %.2f){}else{}\n",$3, $5); }
   | SE Expressao MAIOR_IGUAL Expressao CHAVE_ESQUERDA 
	CHAVE_DIREITA SENAO CHAVE_ESQUERDA Expressao  CHAVE_DIREITA { printf("if(%.2f >= %.2f){}else{}\n",$3, $5); }
   | SE PARENTESIS_ESQUERDO Expressao MAIOR Expressao PARENTESIS_DIREITO CHAVE_ESQUERDA 
	CHAVE_DIREITA SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f > %.2f){}else{}\n",$3, $5); }
   | SE PARENTESIS_ESQUERDO Expressao MAIOR_IGUAL Expressao PARENTESIS_DIREITO CHAVE_ESQUERDA 
	CHAVE_DIREITA SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f >= %.2f){}else{}\n",$3, $5); }

   | SE Expressao MENOR Expressao { printf("if(%.2f < %.2f){}\n",$2, $4); }
   | SE Expressao MENOR_IGUAL Expressao { printf("if(%.2f <= %.2f){}\n",$2, $4); }
   | SE PARENTESIS_ESQUERDO Expressao MENOR Expressao PARENTESIS_DIREITO{ printf("if(%.2f < %.2f){}\n",$3, $5); }
   | SE PARENTESIS_ESQUERDO Expressao MENOR_IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f <= %.2f){}\n",$3, $5); }

   | SE Expressao IGUAL Expressao { printf("if(%.2f == %.2f)\n",$2, $4); }
   | SE PARENTESIS_ESQUERDO Expressao IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f == %.2f){}\n",$3, $5); }

*/
   | IDENTIFICADOR ATRIBUICAO Expressao PONTO_E_VIRGULA { printf("%s = %.2f;\n", $1, $3);}   
   | CAPTE Expressao { printf("scanf(%%d, &%.2f);\n", $2); }
   | CAPTE PARENTESIS_ESQUERDO Expressao PARENTESIS_DIREITO PONTO_E_VIRGULA { printf("scanf(%%d, &%.2f);\n", $3); }
/*Até aqui consegui fazer com numeros, mas com letras é preciso definir novas regras para existência de variáveis*/

   ;



%%

int yyerror(char *s) {
   printf("%s\n",s);
}

int main() {
	// open a file handle to a particular file:
	FILE *myfile = fopen("codigo.prg", "r");

	// make sure it is valid:
	if (!myfile) {
		printf("Desculpe-nos!! Não conseguimos abrir o arquivo: codigo.prg!! D: \n");
		return -1;
	}
	// set flex to read from it instead of defaulting to STDIN:
	yyin = myfile;
	
	// parse through the input until there is no more:
	do {
		yyparse();
	} while (!feof(yyin));

	return 0;
}
