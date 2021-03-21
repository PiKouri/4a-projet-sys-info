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
    tEGAL = 267,
    tPO = 268,
    tPF = 269,
    tVIRGULE = 270,
    tPOINTVIRGULE = 271,
    tPRINTF = 272,
    tBREAK = 273,
    tCONTINUE = 274,
    tIF = 275,
    tWHILE = 276,
    tELSE = 277,
    tNOT = 278,
    tISEQ = 279,
    tISDIF = 280,
    tAND = 281,
    tOR = 282,
    tINF = 283,
    tSUP = 284,
    tINFEQ = 285,
    tSUPEQ = 286,
    tNB = 287,
    tID = 288,
    tERROR = 289
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
#define tBREAK 273
#define tCONTINUE 274
#define tIF 275
#define tWHILE 276
#define tELSE 277
#define tNOT 278
#define tISEQ 279
#define tISDIF 280
#define tAND 281
#define tOR 282
#define tINF 283
#define tSUP 284
#define tINFEQ 285
#define tSUPEQ 286
#define tNB 287
#define tID 288
#define tERROR 289

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 10 "./src/compilateur.y" /* yacc.c:1909  */

    int nb;
    char str[100]; // A voir
    

#line 128 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */