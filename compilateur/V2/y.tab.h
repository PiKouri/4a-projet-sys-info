/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 1 "./src/compilateur.y" /* yacc.c:1909  */

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symbol_table.h"
    #include "globals.h"
    #define FILENAME "./output_asm/output.asm"

#line 53 "y.tab.h" /* yacc.c:1909  */

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tMAIN = 258,
    tAO = 259,
    tAF = 260,
    tCONST = 261,
    tINT = 262,
    tPLUS = 263,
    tMOINS = 264,
    tMULTIPLIER = 265,
    tDIVISER = 266,
    tEGAL = 267,
    tPO = 268,
    tPF = 269,
    tVIRGULE = 270,
    tPOINTVIRGULE = 271,
    tPRINTF = 272,
    tIF = 273,
    tWHILE = 274,
    tELSE = 275,
    tISEQ = 276,
    tINF = 277,
    tSUP = 278,
    tNB = 279,
    tID = 280
  };
#endif
/* Tokens.  */
#define tMAIN 258
#define tAO 259
#define tAF 260
#define tCONST 261
#define tINT 262
#define tPLUS 263
#define tMOINS 264
#define tMULTIPLIER 265
#define tDIVISER 266
#define tEGAL 267
#define tPO 268
#define tPF 269
#define tVIRGULE 270
#define tPOINTVIRGULE 271
#define tPRINTF 272
#define tIF 273
#define tWHILE 274
#define tELSE 275
#define tISEQ 276
#define tINF 277
#define tSUP 278
#define tNB 279
#define tID 280

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 11 "./src/compilateur.y" /* yacc.c:1909  */

    int nb;
    char str[STRLENGTH]; // A voir
    enum Type_var type;

#line 121 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
