%{
#include "global.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}

%token NUMERO
%token MAIS MENOS 
%token ASTERISCO BARRA POTENCIA
%token PARENTESIS_ESQUERDO PARENTESIS_DIREITO
%token FIM_LINHA
%token E OU
%token MAIS_ATRIBUICAO MENOS_ATRIBUICAO 
%token ASTERISCO_ATRIBUICAO BARRA_ATRIBUICAO
%token MENOR MAIOR IGUAL EXCLAMACAO
%token E_COMERCIAL BARRA_VERTICAL
%token DOIS_PONTOS
%token CHAVE_ESQUERDA CHAVE_DIREITA
%token COLCHETE_ESQUERDO COLCHETE_DIREITO
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
   | Expressao FIM_LINHA { printf("Resultado: %f\n",$1); }
   ;
Expressao:
   NUMERO { $$=$1; }
   | Expressao MAIS Expressao { $$=$1+$3; }
   | Expressao MENOS Expressao { $$=$1-$3; }
   | Expressao ASTERISCO Expressao { $$=$1*$3; }
   | Expressao BARRA Expressao { $$=$1/$3; }
   | Expressao POTENCIA Expressao { $$=pow($1,$3); }
   | PARENTESIS_ESQUERDO Expressao PARENTESIS_DIREITO { $$=$2; }
   ;

%%

int yyerror(char *s) {
   printf("%s\n",s);
}

int main(void) {
   yyparse();
}
