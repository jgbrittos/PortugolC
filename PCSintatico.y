%{
#include "global.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// stuff from flex that bison needs to know about:
extern int yylex();
extern int yyparse();
extern FILE *yyin;
extern buffer[];

%}

%token INTEIRO REAL CARACTERE PALAVRA LOGICA

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
   | Tipo FIM_LINHA
   ;
Expressao:
   REAL { $$=$1; }
   | SE Expressao MAIOR Expressao { printf("if(%.2f > %.2f)\n",$2, $4); }
   | SE Expressao MAIOR_IGUAL Expressao { printf("if(%.2f >= %.2f)\n",$2, $4); }
   | SE PARENTESIS_ESQUERDO Expressao MAIOR Expressao PARENTESIS_DIREITO { printf("if(%.2f > %.2f)\n",$3, $5); }
   | SE PARENTESIS_ESQUERDO Expressao MAIOR_IGUAL Expressao PARENTESIS_DIREITO { printf("if(%.2f >= %.2f)\n",$3, $5); }

   | SE Expressao MENOR Expressao { printf("if(%.2f < %.2f)\n",$2, $4); }
   | SE Expressao MENOR_IGUAL Expressao { printf("if(%.2f <= %.2f)\n",$2, $4); }
   | SE PARENTESIS_ESQUERDO Expressao MENOR Expressao PARENTESIS_DIREITO{ printf("if(%.2f < %.2f)\n",$3, $5); }
   | SE PARENTESIS_ESQUERDO Expressao MENOR_IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f <= %.2f)\n",$3, $5); }

/*
   | SE Expressao MAIOR Expressao SENAO Expressao MENOR Expressao { printf("if(%.2f > %.2f) {} else {%.2f < %.2f}", $2,$4,$6,$8); }

   | SE Expressao MAIOR Expressao CHAVE_ESQUERDA CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f > %.2f) else\n",$3, $5); }
   | SE Expressao MAIOR_IGUAL Expressao CHAVE_ESQUERDA 	CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA Expressao  CHAVE_DIREITA { printf("if(%.2f >= %.2f) else\n",$3, $5); }
   | SE PARENTESIS_ESQUERDO Expressao MAIOR Expressao PARENTESIS_DIREITO CHAVE_ESQUERDA CHAVE_DIREITA
	SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f > %.2f) else \n",$3, $5); }
   | SE PARENTESIS_ESQUERDO Expressao MAIOR_IGUAL Expressao PARENTESIS_DIREITO CHAVE_ESQUERDA CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f >= %.2f) else\n",$3, $5); }
*/
   | SE Expressao IGUAL Expressao { printf("if(%.2f == %.2f)\n",$2, $4); }
   | SE PARENTESIS_ESQUERDO Expressao IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f == %.2f)\n",$3, $5); }

   | CAPTE Expressao { printf("scanf(%.2f, &x);\n", $2); }
   | CAPTE PARENTESIS_ESQUERDO Expressao PARENTESIS_DIREITO PONTO_E_VIRGULA { printf("scanf(%%d, &x);\n", $3); }

   | INCLUA MENOR Expressao MAIOR { printf("include <%.2f>\n", $3) ; }
   ;

Tipo:
    INTEIRO Expressao { printf("int %.2f\n", $2); } 
    | IDENTIFICADOR ATRIBUICAO Expressao { printf("x = %s %.2f;\n", buffer, $3);}   
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
