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

%token ATRIBUICAO DIFERENTE IDENTIFICADOR
%token MAIS MENOS 
%token ASTERISCO BARRA POTENCIA

%token FIM_LINHA TABULACAO

%token E OU
%token MAIS_ATRIBUICAO MENOS_ATRIBUICAO 
%token ASTERISCO_ATRIBUICAO BARRA_ATRIBUICAO

%token MENOR MAIOR MAIOR_IGUAL MENOR_IGUAL
%token IGUAL EXCLAMACAO COMENTARIO

%token E_COMERCIAL BARRA_VERTICAL

%token DOIS_PONTOS PONTO_E_VIRGULA VIRGULA
%token CHAVE_ESQUERDA CHAVE_DIREITA
%token COLCHETE_ESQUERDO COLCHETE_DIREITO
%token PARENTESIS_ESQUERDO PARENTESIS_DIREITO

%token INCLUA PRINCIPAL DEFINA

/*ESTRUTURA DE ENTRADA E SAIDA*/
%token LEIA ESCREVA

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
	| Principal FIM_LINHA
	| Expressao FIM_LINHA
	| Tipo FIM_LINHA
	| Retorno FIM_LINHA
	| Comentario FIM_LINHA
	| Condicional FIM_LINHA
	| InclusaoDefinicao FIM_LINHA
	| LeituraEscrita FIM_LINHA
;

Comentario:
	COMENTARIO Expressao
	| COMENTARIO Tipo
	| COMENTARIO Retorno
;

InclusaoDefinicao:
	INCLUA MENOR IDENTIFICADOR MAIOR { printf("#include <%s.h>\n", buffer); }
	| DEFINA IDENTIFICADOR Expressao { printf("#define %s %.2f\n", buffer, $3); }
	//| DEFINA IDENTIFICADOR IDENTIFICADOR { printf("#define %s %s", buffer, buffer); }
;

Principal:
	INTEIRO PRINCIPAL PARENTESIS_ESQUERDO PARENTESIS_DIREITO CHAVE_ESQUERDA { printf("int main(){\n");}
	| CHAVE_DIREITA {printf("}");}
;

Tipo:
	INTEIRO IDENTIFICADOR PONTO_E_VIRGULA{ printf("\tint %s;\n", buffer); } 
	| REAL IDENTIFICADOR PONTO_E_VIRGULA{ printf("\tfloat %s;\n", buffer); } 
	| CARACTERE IDENTIFICADOR PONTO_E_VIRGULA{ printf("\tchar %s;\n", buffer); } 
	| IDENTIFICADOR ATRIBUICAO Expressao PONTO_E_VIRGULA{ printf("%s = %.2f;\n", buffer, $3);}
;

Expressao:
	NUMERO_REAL { $$=$1; }
	//| NUMERO_INTEIRO { $$=$1; } 
;

LeituraEscrita:
//	ESCREVA Expressao PONTO_E_VIRGULA{ printf("printf(%.2f);", $2); }
//	| ESCREVA PARENTESIS_ESQUERDO Expressao PARENTESIS_DIREITO PONTO_E_VIRGULA{ printf("printf(%.2f);", $2); }

	ESCREVA IDENTIFICADOR PONTO_E_VIRGULA{ printf("\tprintf(\"%s \\n\");\n", buffer); }
//	| ESCREVA PARENTESIS_ESQUERDO FRASE PARENTESIS_DIREITO PONTO_E_VIRGULA{ printf("printf(\"%s\");", buffer); }

//	| LEIA PARENTESIS_ESQUERDO Expressao PARENTESIS_DIREITO PONTO_E_VIRGULA { printf("scanf(%%d, &x);\n", $3); }
	| LEIA IDENTIFICADOR PONTO_E_VIRGULA { printf("\tscanf(\"%%d\", &%s);\n", buffer); }

;

Condicional:
	SE Expressao MAIOR Expressao { printf("if(%.2f > %.2f)\n",$2, $4); }
	| SE Expressao MAIOR_IGUAL Expressao { printf("if(%.2f >= %.2f)\n",$2, $4); }
	| SE PARENTESIS_ESQUERDO Expressao MAIOR Expressao PARENTESIS_DIREITO { printf("if(%.2f > %.2f)\n",$3, $5); }
	| SE PARENTESIS_ESQUERDO Expressao MAIOR_IGUAL Expressao PARENTESIS_DIREITO { printf("if(%.2f >= %.2f)\n",$3, $5); }

	| SE Expressao MENOR Expressao { printf("if(%.2f < %.2f)\n",$2, $4); }
	| SE Expressao MENOR_IGUAL Expressao { printf("if(%.2f <= %.2f)\n",$2, $4); }
	| SE PARENTESIS_ESQUERDO Expressao MENOR Expressao PARENTESIS_DIREITO{ printf("if(%.2f < %.2f)\n",$3, $5); }
	| SE PARENTESIS_ESQUERDO Expressao MENOR_IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f <= %.2f)\n",$3, $5); }

	| SE Expressao MAIOR Expressao CHAVE_ESQUERDA CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f > %.2f) else {%.2f}\n",$3, $5, $9); }
	| SE Expressao MAIOR_IGUAL Expressao CHAVE_ESQUERDA 	CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA Expressao  CHAVE_DIREITA { printf("if(%.2f >= %.2f) else {%.2f}\n",$3, $5, $9); }
	| SE PARENTESIS_ESQUERDO Expressao MAIOR Expressao PARENTESIS_DIREITO CHAVE_ESQUERDA CHAVE_DIREITA
	SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f > %.2f) else {%.2f}\n",$3, $5, $11); }
	| SE PARENTESIS_ESQUERDO Expressao MAIOR_IGUAL Expressao PARENTESIS_DIREITO CHAVE_ESQUERDA CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA Expressao CHAVE_DIREITA { printf("if(%.2f >= %.2f) else {%.2f}\n",$3, $5, $11); }

	| SE Expressao IGUAL Expressao { printf("if(%.2f == %.2f)\n",$2, $4); }
	| SE PARENTESIS_ESQUERDO Expressao IGUAL Expressao PARENTESIS_DIREITO{ printf("if(%.2f == %.2f)\n",$3, $5); }
;

Retorno:
	RETORNE Expressao PONTO_E_VIRGULA { 
		int aux=0, aux1=0;
		aux = $2;
		aux1 = ceil($2);
		if(aux == aux1){
			printf("\treturn %d;\n", $2); 
		}else{
			printf("\treturn %.2f;\n", $2); 
		}
	}
	| RETORNE IDENTIFICADOR PONTO_E_VIRGULA { printf("\treturn %s;\n", buffer); }
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
