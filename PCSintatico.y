%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <string>
#include <map>

using namespace std;

// stuff from flex that bison needs to know about:
extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s);

map <string,string> dicionario;

%}

%union {
	int number;
	char caracter;
	char* string;
}

%token <string> TIPO
%token <number> NUMERO_REAL

%token ATRIBUICAO DIFERENTE 
%token <string> IDENTIFICADOR
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
%token PARA DE ATE PARE ENQUANTO FACA REPITA 
%token RETORNE

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
	| FIM_LINHA {printf ("\n");}
	| Condicional
	| Principal
	| Tipo
	| InclusaoDefinicao
	| LeituraEscrita
	| EstruturaRepeticao
	| Retorno
;

InclusaoDefinicao:
	INCLUA MENOR IDENTIFICADOR MAIOR { cout << "#include <" << $3 << ".h>;"; }
	| DEFINA IDENTIFICADOR NUMERO_REAL { cout << "#define " << $2 << " " << $3 << ";"; }
;

Principal:
	TIPO PRINCIPAL PARENTESIS_ESQUERDO PARENTESIS_DIREITO CHAVE_ESQUERDA { cout << dicionario[$1] << " main() {" ;}
	| CHAVE_DIREITA {printf("}");}
;

Tipo:
	TIPO IDENTIFICADOR PONTO_E_VIRGULA { cout << dicionario[$1] << " " << $2 << ";"; } 
;

LeituraEscrita:
	ESCREVA IDENTIFICADOR PONTO_E_VIRGULA{ printf("printf(\"%s\");", $2);  }
	| LEIA IDENTIFICADOR PONTO_E_VIRGULA { printf("scanf(\"%%d\", &%s);", $2); }
;

Condicional:
	SE IDENTIFICADOR MAIOR NUMERO_REAL { printf("if(%s > %d)",$2, $4); }
	| SE IDENTIFICADOR MAIOR_IGUAL NUMERO_REAL { printf("if(%s >= %d)",$2, $4); }
	| SE PARENTESIS_ESQUERDO IDENTIFICADOR MAIOR NUMERO_REAL PARENTESIS_DIREITO { printf("if(%s > %d)",$3, $5); }
	| SE PARENTESIS_ESQUERDO IDENTIFICADOR MAIOR_IGUAL NUMERO_REAL PARENTESIS_DIREITO { printf("if(%s >= %d)",$3, $5); }

	| SE IDENTIFICADOR MENOR NUMERO_REAL { printf("if(%s < %d)",$2, $4); }
	| SE IDENTIFICADOR MENOR_IGUAL NUMERO_REAL { printf("if(%s <= %d)",$2, $4); }
	| SE PARENTESIS_ESQUERDO IDENTIFICADOR MENOR NUMERO_REAL PARENTESIS_DIREITO{ printf("if(%s < %d)",$3, $5); }
	| SE PARENTESIS_ESQUERDO IDENTIFICADOR MENOR_IGUAL NUMERO_REAL PARENTESIS_DIREITO{ printf("if(%s <= %d)",$3, $5); }

	| SE IDENTIFICADOR MAIOR NUMERO_REAL CHAVE_ESQUERDA CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA IDENTIFICADOR CHAVE_DIREITA { printf("if(%s > %d) else {%s}",$2, $4, $9); }
	| SE Expressao MAIOR_IGUAL NUMERO_REAL CHAVE_ESQUERDA CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA NUMERO_REAL CHAVE_DIREITA { printf("if(%.2f >= %.2f) else {%.2f}",$3, $5, $9); }
	| SE PARENTESIS_ESQUERDO NUMERO_REAL MAIOR NUMERO_REAL PARENTESIS_DIREITO CHAVE_ESQUERDA CHAVE_DIREITA
	SENAO CHAVE_ESQUERDA NUMERO_REAL CHAVE_DIREITA { printf("if(%.2f > %.2f) else {%.2f}",$3, $5, $11); }
	| SE PARENTESIS_ESQUERDO NUMERO_REAL MAIOR_IGUAL NUMERO_REAL PARENTESIS_DIREITO CHAVE_ESQUERDA CHAVE_DIREITA 
	SENAO CHAVE_ESQUERDA NUMERO_REAL CHAVE_DIREITA { printf("if(%.2f >= %.2f) else {%.2f}",$3, $5, $11); }

	| SE IDENTIFICADOR IGUAL NUMERO_REAL { printf("if(%s == %d)",$2, $4); }
	| SE PARENTESIS_ESQUERDO IDENTIFICADOR IGUAL NUMERO_REAL PARENTESIS_DIREITO{ printf("if(%s == %d)",$3, $5); }
;

EstruturaRepeticao:
	PARA IDENTIFICADOR DE NUMERO_REAL ATE NUMERO_REAL FACA { printf("for (%s = %d; %s <= %d; %s++) { ", $2,$4,$2,$6,$2); }
	| PARA PARENTESIS_ESQUERDO IDENTIFICADOR DE NUMERO_REAL ATE NUMERO_REAL PARENTESIS_DIREITO FACA
	{ printf("for (%s = %d; %s <= %d; %s++) {",$3,$5,$3,$7,$3);}
	| PARA PARENTESIS_ESQUERDO IDENTIFICADOR DE NUMERO_REAL ATE NUMERO_REAL PARENTESIS_DIREITO CHAVE_ESQUERDA
	{ printf("for (%s = %d; %s <= %d; %s++) {",$3,$5,$3,$7,$3);}
	| ENQUANTO IDENTIFICADOR DIFERENTE NUMERO_REAL FACA { printf("while (%s != %d) ", $2, $4 );}
	| ENQUANTO IDENTIFICADOR IGUAL NUMERO_REAL FACA { printf("while (%s == %d) ", $2, $4 );}
	| ENQUANTO IDENTIFICADOR DIFERENTE NUMERO_REAL CHAVE_ESQUERDA { printf("while (%s != %d) {", $2, $4 );}
	| ENQUANTO IDENTIFICADOR IGUAL NUMERO_REAL CHAVE_ESQUERDA { printf("while (%s == %d) {", $2, $4 );}
;

Retorno:
	RETORNE NUMERO_REAL PONTO_E_VIRGULA { 
		int aux=0, aux1=0;
		aux = $2;
		aux1 = ceil($2);
		if(aux == aux1){
			printf("return %d;", $2); 
		}else{
			printf("return %.2f;", $2); 
		}
	}
	| RETORNE IDENTIFICADOR PONTO_E_VIRGULA { printf("return %s;", $2); }
;



%%

void yyerror(const char *s) {
    printf("%s\n",s);
}

int main(int argc, char *argv[]) 
{	
	dicionario["inteiro"] = "int";
	dicionario["real"] = "float";
	dicionario["caractere"] = "char";
	dicionario["literal"] = "string";
	dicionario["real"] = "float";
	
	string arquivoEntrada;

	if(argc == 1)
		arquivoEntrada = "codigo.prg";
	else
		arquivoEntrada = argv[1];

	// open a file handle to a particular file:
	FILE *myfile = fopen(arquivoEntrada.c_str(), "r");

/*	string arquivoSaida;

	if(argc > 2)
		arquivoSaida = argv[argc-1];*/

	// make sure it is valid:
	if (!myfile) {
		printf("Desculpe-nos!! Não conseguimos abrir o arquivo: %s! \n", arquivoEntrada.c_str());
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
