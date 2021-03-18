%{
    #include "y.tab.h"
%}

vSEP    [ \t]
vNewLine [\n\r]

%%

{vSEP}  {}

"main" {return tMAIN;}
const {return tCONST;}
int {return tINT;}

break {return tBREAK;}
continue {return tCONTINUE;}
if {return tIF;}
else {return tELSE;}
while {return tWHILE;}


\{ {return tAO;}
\} {return tAF;}

\+ {return tPLUS;}
\- {return tMOINS;}
\* {return tMULTIPLIER;}
\/ {return tDIVISER;}
\= {return tEQ;}
\( {return tPO;}
\) {return tPF;}

\! {return tNOT;}
"==" {return tISEQ;}
"!=" {return tISDIF;}
"&&" {return tAND;}
"||" {return tOR;}
"<" {return tINF;}
">" {return tSUP;}
"<=" {return tINFEQ;}
">=" {return tSUPEQ;}


vNewLine {return tNewLine;}
\, {return tVIRGULE;}
\; {return tPOINTVIRGULE;}

printf {return tPRINTF;}
[0-9]+(e[0-9]+)? {yylval.nb = atoi(yytext); return tNB;}

[a-zA-Z][_a-zA-Z0-9]* {strcpy(yylval.str,yytext); return tID;}
. {return tERROR;}

%%

int yywrap(void){return 1;}
//int main(int argc, char *argv[]) { while (yylex()!=0) ; return 0; }

/*

Strings

\".*\" {strcpy(yylval.str,yytext);return tSTRING;}

ADDED token : tBREAK, tCONTINUE, tIF, tELSE, tWHILE

DONE :
main
int
const
break
else
const
continue
while
if

OPT:
return {return tRETURN;}
void
switch
case
char
for
do*/
