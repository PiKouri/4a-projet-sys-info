
vSEP    [ \t\r]


%%

{vSEP}  {printf("Token : %s\n", yytext);}
"main" {printf("Token : %s\n", yytext);}
\{ {printf("Token : %s\n", yytext);}
\} {printf("Token : %s\n", yytext);}
const {printf("Token : %s\n", yytext);}
int {printf("Token : %s\n", yytext);}
\+ {printf("Token : %s\n", yytext);}
\- {printf("Token : %s\n", yytext);}
\* {printf("Token : %s\n", yytext);}
\/ {printf("Token : %s\n", yytext);}
\= {printf("Token : %s\n", yytext);}
\( {printf("Token : %s\n", yytext);}
\) {printf("Token : %s\n", yytext);}
\n {printf("Token : %s\n", yytext);}
\, {printf("Token : %s\n", yytext);}
\; {printf("Token : %s\n", yytext);}
printf {printf("Token : %s\n", yytext);}
[0-9]+(e[0-9]+)? {printf("Token : %s\n", yytext);}
[a-zA-Z][_a-zA-Z0-9]* {printf("Token : %s\n", yytext);}
. {printf("Non reconnu: %s\n", yytext);}


%%

int yywrap(void){return 1;}
int main(int argc, char *argv[]) { while (yylex()!=0) ; return 0; }
