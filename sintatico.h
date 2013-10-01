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
     CARACTERE = 260,
     ATRIBUICAO = 261,
     DIFERENTE = 262,
     IDENTIFICADOR = 263,
     MAIS = 264,
     MENOS = 265,
     ASTERISCO = 266,
     BARRA = 267,
     POTENCIA = 268,
     FIM_LINHA = 269,
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
     E_COMERCIAL = 282,
     BARRA_VERTICAL = 283,
     DOIS_PONTOS = 284,
     PONTO_E_VIRGULA = 285,
     VIRGULA = 286,
     CHAVE_ESQUERDA = 287,
     CHAVE_DIREITA = 288,
     COLCHETE_ESQUERDO = 289,
     COLCHETE_DIREITO = 290,
     PARENTESIS_ESQUERDO = 291,
     PARENTESIS_DIREITO = 292,
     INCLUA = 293,
     SE = 294,
     SENAO = 295,
     PARA = 296,
     PARE = 297,
     ENQUANTO = 298,
     FACA = 299,
     REPITA = 300,
     RETORNE = 301
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


