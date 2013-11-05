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
     INTEIRO = 258,
     REAL = 259,
     NUMERO_REAL = 260,
     CARACTERE = 261,
     SE = 262,
     SENAO = 263,
     PARA = 264,
     DE = 265,
     ATE = 266,
     FACA = 267,
     PASSO = 268,
     PARE = 269,
     ENQUANTO = 270,
     REPITA = 271,
     RETORNE = 272,
     ATRIBUICAO = 273,
     DIFERENTE = 274,
     IDENTIFICADOR = 275,
     MAIS = 276,
     MENOS = 277,
     ASTERISCO = 278,
     BARRA = 279,
     POTENCIA = 280,
     FIM_LINHA = 281,
     TABULACAO = 282,
     E = 283,
     OU = 284,
     MAIS_ATRIBUICAO = 285,
     MENOS_ATRIBUICAO = 286,
     ASTERISCO_ATRIBUICAO = 287,
     BARRA_ATRIBUICAO = 288,
     MENOR = 289,
     MAIOR = 290,
     MAIOR_IGUAL = 291,
     MENOR_IGUAL = 292,
     IGUAL = 293,
     EXCLAMACAO = 294,
     COMENTARIO = 295,
     FRASE_COMENTARIO = 296,
     E_COMERCIAL = 297,
     BARRA_VERTICAL = 298,
     DOIS_PONTOS = 299,
     PONTO_E_VIRGULA = 300,
     VIRGULA = 301,
     CHAVE_ESQUERDA = 302,
     CHAVE_DIREITA = 303,
     COLCHETE_ESQUERDO = 304,
     COLCHETE_DIREITO = 305,
     PARENTESIS_ESQUERDO = 306,
     PARENTESIS_DIREITO = 307,
     INCLUA = 308,
     PRINCIPAL = 309,
     DEFINA = 310,
     LEIA = 311,
     ESCREVA = 312
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


