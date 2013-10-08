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
     IDENTACAO = 270,
     E = 271,
     OU = 272,
     MAIS_ATRIBUICAO = 273,
     MENOS_ATRIBUICAO = 274,
     ASTERISCO_ATRIBUICAO = 275,
     BARRA_ATRIBUICAO = 276,
     MENOR = 277,
     MAIOR = 278,
     MAIOR_IGUAL = 279,
     MENOR_IGUAL = 280,
     IGUAL = 281,
     EXCLAMACAO = 282,
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
     CAPTE = 296,
     SE = 297,
     SENAO = 298,
     PARA = 299,
     PARE = 300,
     ENQUANTO = 301,
     FACA = 302,
     REPITA = 303,
     RETORNE = 304
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


