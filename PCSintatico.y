%{
#include "global.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}

%token NUMERO CARACTERE 
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
%token DOIS_PONTOS PONTO_E_VIRGULA
%token CHAVE_ESQUERDA CHAVE_DIREITA
%token COLCHETE_ESQUERDO COLCHETE_DIREITO
%token PARENTESIS_ESQUERDO PARENTESIS_DIREITO

/*SESSAO DE ESTRUTURAS CONDICIONAIS E DE REPETICAO*/

%token SE SENAO
%token PARA ENQUANTO FACA REPITA

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
   NUMERO { $$=$1; }
   | Expressao ATRIBUICAO Expressao { printf("(%.2f = %.2f)\n", $1, $3); }

   | SE Expressao MAIOR Expressao { printf("if(%.2f > %.2f){}\n",$2, $4); }
   | SE Expressao MAIOR_IGUAL Expressao { printf("if(%.2f >= %.2f){}\n",$2, $4); }
   | SE PARENTESIS_ESQUERDO Expressao MAIOR Expressao PARENTESIS_DIREITO{ printf("if(%.2f > %.2f){}\n",$3, $5); }
   | SE PARENTESIS_ESQUERDO Expressao MAIOR_IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f >= %.2f){}\n",$3, $5); }

   | SE Expressao MENOR Expressao { printf("if(%.2f < %.2f){}\n",$2, $4); }
   | SE Expressao MENOR_IGUAL Expressao { printf("if(%.2f <= %.2f){}\n",$2, $4); }
   | SE PARENTESIS_ESQUERDO Expressao MENOR Expressao PARENTESIS_DIREITO{ printf("if(%.2f < %.2f){}\n",$3, $5); }
   | SE PARENTESIS_ESQUERDO Expressao MENOR_IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f <= %.2f){}\n",$3, $5); }

   | SE Expressao IGUAL Expressao { printf("if(%.2f == %.2f)\n",$2, $4); }
   | SE PARENTESIS_ESQUERDO Expressao IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f == %.2f){}\n",$3, $5); }
   ;

%%

int yyerror(char *s) {
   printf("%s\n",s);
}

int main(void) {
   yyparse();
}
