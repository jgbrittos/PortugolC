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
     NUMERO = 258,
     MAIS = 259,
     MENOS = 260,
     ASTERISCO = 261,
     BARRA = 262,
     POTENCIA = 263,
     PARENTESIS_ESQUERDO = 264,
     PARENTESIS_DIREITO = 265,
     FIM_LINHA = 266,
     E = 267,
     OU = 268,
     MAIS_ATRIBUICAO = 269,
     MENOS_ATRIBUICAO = 270,
     ASTERISCO_ATRIBUICAO = 271,
     BARRA_ATRIBUICAO = 272,
     MENOR = 273,
     MAIOR = 274,
     IGUAL = 275,
     EXCLAMACAO = 276,
     E_COMERCIAL = 277,
     BARRA_VERTICAL = 278,
     DOIS_PONTOS = 279,
     CHAVE_ESQUERDA = 280,
     CHAVE_DIREITA = 281,
     COLCHETE_ESQUERDO = 282,
     COLCHETE_DIREITO = 283
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


