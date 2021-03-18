%{
    #include "y.tab.h"
%}

vSEP    [ \t]
vNewLine [\n\r]

%%

{vSEP}  {}
"main" {return tMAIN;}
\{ {return tAO;}
\} {return tAF;}
const {return tCONST;}
int {return tINT;}
\+ {return tPLUS;}
\- {return tMOINS;}
\* {return tMULTIPLIER;}
\/ {return tDIVISER;}
\= {return tEQ;}
\( {return tPO;}
\) {return tPF;}
vNewLine {return tNewLine;}
\, {return tVIRGULE;}
\; {return tPOINTVIRGULE;}
printf {return tPRINTF;}
[0-9]+(e[0-9]+)? {yylval.nb = atoi(yytext); return tNB;}
\".*\" {strcpy(yylval.str,yytext);return tSTRING;}
[a-zA-Z][_a-zA-Z0-9]* {strcpy(yylval.str,yytext); return tID;}
. {return tERROR;}

%%

int yywrap(void){return 1;}
//int main(int argc, char *argv[]) { while (yylex()!=0) ; return 0; }
