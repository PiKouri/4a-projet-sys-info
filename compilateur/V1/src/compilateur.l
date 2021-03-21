%{
	#include "y.tab.h"
%}

vSEP    [ \t]
vNewLine [\n\r]

%option yylineno

%%

{vSEP}  {}
vNewLine {}
\n {}
\, {return tVIRGULE;}
\; {return tPOINTVIRGULE;}

"main" {return tMAIN;}

\( {return tPO;}
\) {return tPF;}
\{ {return tAO;}
\} {return tAF;}

const {return tCONST;}
int {return tINT;}

break {return tBREAK;}
continue {return tCONTINUE;}
if {return tIF;}
else {return tELSE;}
while {return tWHILE;}

\= {return tEGAL;}
\+ {return tPLUS;}
\- {return tMOINS;}
\* {return tMULTIPLIER;}
\/ {return tDIVISER;}

\! {return tNOT;}
"==" {return tISEQ;}
"!=" {return tISDIF;}
"&&" {return tAND;}
"||" {return tOR;}
"<" {return tINF;}
">" {return tSUP;}
"<=" {return tINFEQ;}
">=" {return tSUPEQ;}

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
*/

