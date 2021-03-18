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
    tEQ = 267,
    tPO = 268,
    tPF = 269,
    tNewLine = 270,
    tVIRGULE = 271,
    tPOINTVIRGULE = 272,
    tPRINTF = 273,
    tBREAK = 274,
    tCONTINUE = 275,
    tIF = 276,
    tWHILE = 277,
    tELSE = 278,
    tNOT = 279,
    tISEQ = 280,
    tISDIF = 281,
    tAND = 282,
    tOR = 283,
    tINF = 284,
    tSUP = 285,
    tINFEQ = 286,
    tSUPEQ = 287,
    tNB = 288,
    tID = 289,
    tERROR = 290
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
#define tEQ 267
#define tPO 268
#define tPF 269
#define tNewLine 270
#define tVIRGULE 271
#define tPOINTVIRGULE 272
#define tPRINTF 273
#define tBREAK 274
#define tCONTINUE 275
#define tIF 276
#define tWHILE 277
#define tELSE 278
#define tNOT 279
#define tISEQ 280
#define tISDIF 281
#define tAND 282
#define tOR 283
#define tINF 284
#define tSUP 285
#define tINFEQ 286
#define tSUPEQ 287
#define tNB 288
#define tID 289
#define tERROR 290

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 11 "./src/compilateur.y" /* yacc.c:1909  */

    int nb;
    char str[100]; // A voir
    

#line 130 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
