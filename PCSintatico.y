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

%token INTEIRO REAL NUMERO_REAL CARACTERE

/*SESSAO DE ESTRUTURAS CONDICIONAIS E DE REPETICAO*/
%token SE SENAO
%token PARA DE ATE FACA PASSO PARE ENQUANTO REPITA RETORNE

%token ATRIBUICAO DIFERENTE IDENTIFICADOR
%token MAIS MENOS 
%token ASTERISCO BARRA POTENCIA

%token FIM_LINHA TABULACAO

%token E OU
%token MAIS_ATRIBUICAO MENOS_ATRIBUICAO 
%token ASTERISCO_ATRIBUICAO BARRA_ATRIBUICAO

%token MENOR MAIOR MAIOR_IGUAL MENOR_IGUAL
%token IGUAL EXCLAMACAO COMENTARIO FRASE_COMENTARIO

%token E_COMERCIAL BARRA_VERTICAL

%token DOIS_PONTOS PONTO_E_VIRGULA VIRGULA
%token CHAVE_ESQUERDA CHAVE_DIREITA
%token COLCHETE_ESQUERDO COLCHETE_DIREITO
%token PARENTESIS_ESQUERDO PARENTESIS_DIREITO

%token INCLUA PRINCIPAL DEFINA

/*ESTRUTURA DE ENTRADA E SAIDA*/
%token LEIA ESCREVA

%left MAIS MENOS
%left ASTERISCO BARRA

%start Entrada

%%

Entrada:
	/* Empty */
	| Entrada Linha
   	;
Linha:
	TABULACAO { printf("\t"); }
	| FIM_LINHA { printf("\n"); }
	| Principal FIM_LINHA 
	| Expressao FIM_LINHA FIM_LINHA
	| Tipo FIM_LINHA 
	| Retorno 
	| Comentario FIM_LINHA
	| Condicional FIM_LINHA
	| InclusaoDefinicao FIM_LINHA 
	| LeituraEscrita 
	| EstruturaRepeticao 
;

InclusaoDefinicao:
	INCLUA MENOR IDENTIFICADOR MAIOR { printf("#include <%s.h>", buffer); }
	| DEFINA IDENTIFICADOR Expressao { printf("#define %s %.2f", buffer, $3); }
;

Comentario:
	COMENTARIO Expressao { printf("\t//%.2f", $2); }
	| COMENTARIO FRASE_COMENTARIO { printf("\t//%s", buffer); }
;



Principal:
	INTEIRO PRINCIPAL PARENTESIS_ESQUERDO PARENTESIS_DIREITO CHAVE_ESQUERDA { printf("int main(){");}
	| CHAVE_DIREITA FIM_LINHA {printf("}");}
;

Tipo:
	INTEIRO IDENTIFICADOR PONTO_E_VIRGULA{ printf("\tint %s;", buffer); } 
	| REAL IDENTIFICADOR PONTO_E_VIRGULA{ printf("\tfloat %s;", buffer); } 
	| CARACTERE IDENTIFICADOR PONTO_E_VIRGULA{ printf("\tchar %s;", buffer); } 
	| IDENTIFICADOR ATRIBUICAO Expressao PONTO_E_VIRGULA{ printf("%s = %.2f;", buffer, $3);}
;

Expressao:
	NUMERO_REAL { $$=$1; }
;

LeituraEscrita:
	ESCREVA IDENTIFICADOR PONTO_E_VIRGULA{ printf("\tprintf(\"%s \");", buffer); }
	| LEIA IDENTIFICADOR PONTO_E_VIRGULA { printf("\tscanf(\"%%d\", &%s);", buffer); }
;

Condicional:
	SE Expressao MAIOR Expressao { printf("if(%.2f > %.2f)",$2, $4); }
	| SE Expressao MAIOR_IGUAL Expressao { printf("if(%.2f >= %.2f)",$2, $4); }
	| SE PARENTESIS_ESQUERDO Expressao MAIOR Expressao PARENTESIS_DIREITO { printf("if(%.2f > %.2f)",$3, $5); }
	| SE PARENTESIS_ESQUERDO Expressao MAIOR_IGUAL Expressao PARENTESIS_DIREITO { printf("if(%.2f >= %.2f)",$3, $5); }

	| SE Expressao MENOR Expressao { printf("if(%.2f < %.2f)",$2, $4); }
	| SE Expressao MENOR_IGUAL Expressao { printf("if(%.2f <= %.2f)",$2, $4); }
	| SE PARENTESIS_ESQUERDO Expressao MENOR Expressao PARENTESIS_DIREITO{ printf("if(%.2f < %.2f)",$3, $5); }
	| SE PARENTESIS_ESQUERDO Expressao MENOR_IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f <= %.2f)",$3, $5); }

	| SE Expressao MAIOR Expressao CHAVE_ESQUERDA CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f > %.2f) else {%.2f}",$3, $5, $9); }
	| SE Expressao MAIOR_IGUAL Expressao CHAVE_ESQUERDA 	CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA Expressao  CHAVE_DIREITA { printf("if(%.2f >= %.2f) else {%.2f}",$3, $5, $9); }
	| SE PARENTESIS_ESQUERDO Expressao MAIOR Expressao PARENTESIS_DIREITO CHAVE_ESQUERDA CHAVE_DIREITA
	SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f > %.2f) else {%.2f}",$3, $5, $11); }
	| SE PARENTESIS_ESQUERDO Expressao MAIOR_IGUAL Expressao PARENTESIS_DIREITO CHAVE_ESQUERDA CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f >= %.2f) else {%.2f}",$3, $5, $11); }

	| SE Expressao IGUAL Expressao { printf("if(%.2f == %.2f)",$2, $4); }
	| SE PARENTESIS_ESQUERDO Expressao IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f == %.2f)",$3, $5); }
;

EstruturaRepeticao:
	PARA IDENTIFICADOR DE Expressao ATE Expressao FACA { printf("\tfor(%s = %.2f; xomba <= %.2f; xomba++){ ", buffer,$4,$6); }
	| PARA PARENTESIS_ESQUERDO IDENTIFICADOR DE Expressao ATE Expressao PARENTESIS_DIREITO FACA
	{ printf("\tfor (%s = %.2f; xombi <= %.2f; xombi++) {", buffer, $6,$4);}
	| PARA PARENTESIS_ESQUERDO IDENTIFICADOR DE Expressao ATE Expressao PARENTESIS_DIREITO CHAVE_ESQUERDA
	{ printf("\tfor (%s = %.2f; xombi <= %2.f; xombi++) {", buffer, $6,$4);}
	| ENQUANTO IDENTIFICADOR DIFERENTE Expressao FACA 
	{ printf("\t while (%s != %.2f) ", buffer, $4 );}
	| ENQUANTO IDENTIFICADOR IGUAL Expressao FACA 
	{ printf("\t while (%s == %.2f) ", buffer, $4 );}
	| ENQUANTO IDENTIFICADOR DIFERENTE Expressao CHAVE_ESQUERDA 
	{ printf("\t while (%s != %.2f) {", buffer, $4 );}
	| ENQUANTO IDENTIFICADOR IGUAL Expressao CHAVE_ESQUERDA 
	{ printf("\t while (%s == %.2f) {", buffer, $4 );}
;

Retorno:
	RETORNE Expressao PONTO_E_VIRGULA { 
		int aux=0, aux1=0;
		aux = $2;
		aux1 = ceil($2);
		if(aux == aux1){
			printf("\treturn %d;", $2); 
		}else{
			printf("\treturn %.2f;", $2); 
		}
	}
	| RETORNE IDENTIFICADOR PONTO_E_VIRGULA { printf("\treturn %s;", buffer); }
;
 

%%

int yyerror(char *s) {
   printf("%s",s);
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
