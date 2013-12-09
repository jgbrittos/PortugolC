/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TIPO = 258,
     NUMERO_REAL = 259,
     ATRIBUICAO = 260,
     DIFERENTE = 261,
     IDENTIFICADOR = 262,
     MAIS = 263,
     MENOS = 264,
     ASTERISCO = 265,
     BARRA = 266,
     POTENCIA = 267,
     FIM_LINHA = 268,
     TABULACAO = 269,
     E = 270,
     OU = 271,
     MAIS_ATRIBUICAO = 272,
     MENOS_ATRIBUICAO = 273,
     ASTERISCO_ATRIBUICAO = 274,
     BARRA_ATRIBUICAO = 275,
     MENOR = 276,
     MAIOR = 277,
     MAIOR_IGUAL = 278,
     MENOR_IGUAL = 279,
     IGUAL = 280,
     EXCLAMACAO = 281,
     COMENTARIO = 282,
     E_COMERCIAL = 283,
     BARRA_VERTICAL = 284,
     DOIS_PONTOS = 285,
     PONTO_E_VIRGULA = 286,
     VIRGULA = 287,
     CHAVE_ESQUERDA = 288,
     CHAVE_DIREITA = 289,
     COLCHETE_ESQUERDO = 290,
     COLCHETE_DIREITO = 291,
     PARENTESIS_ESQUERDO = 292,
     PARENTESIS_DIREITO = 293,
     INCLUA = 294,
     PRINCIPAL = 295,
     DEFINA = 296,
     LEIA = 297,
     ESCREVA = 298,
     SE = 299,
     SENAO = 300,
     PARA = 301,
     DE = 302,
     ATE = 303,
     PARE = 304,
     ENQUANTO = 305,
     FACA = 306,
     REPITA = 307,
     RETORNE = 308
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 2068 of yacc.c  */
#line 23 "PCSintatico.y"

	int number;
	char caracter;
	char* string;



/* Line 2068 of yacc.c  */
#line 111 "PCSintatico.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


