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
     ATRIBUICAO = 262,
     DIFERENTE = 263,
     IDENTIFICADOR = 264,
     MAIS = 265,
     MENOS = 266,
     ASTERISCO = 267,
     BARRA = 268,
     POTENCIA = 269,
     FIM_LINHA = 270,
     TABULACAO = 271,
     E = 272,
     OU = 273,
     MAIS_ATRIBUICAO = 274,
     MENOS_ATRIBUICAO = 275,
     ASTERISCO_ATRIBUICAO = 276,
     BARRA_ATRIBUICAO = 277,
     MENOR = 278,
     MAIOR = 279,
     MAIOR_IGUAL = 280,
     MENOR_IGUAL = 281,
     IGUAL = 282,
     EXCLAMACAO = 283,
     COMENTARIO = 284,
     E_COMERCIAL = 285,
     BARRA_VERTICAL = 286,
     DOIS_PONTOS = 287,
     PONTO_E_VIRGULA = 288,
     VIRGULA = 289,
     CHAVE_ESQUERDA = 290,
     CHAVE_DIREITA = 291,
     COLCHETE_ESQUERDO = 292,
     COLCHETE_DIREITO = 293,
     PARENTESIS_ESQUERDO = 294,
     PARENTESIS_DIREITO = 295,
     INCLUA = 296,
     PRINCIPAL = 297,
     DEFINA = 298,
     LEIA = 299,
     ESCREVA = 300,
     SE = 301,
     SENAO = 302,
     PARA = 303,
     PARE = 304,
     ENQUANTO = 305,
     FACA = 306,
     REPITA = 307,
     RETORNE = 308
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


