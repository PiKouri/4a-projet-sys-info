%{
    #include <stdio.h>
    //#include "instructions.h"
    int yylex();
    void yyerror(char*);
    int yydebug = 1;
    extern int yylineno;
%}

/* Union for yylval */
%union {
    int nb;
    char str[100]; // A voir
    
}

%token tMAIN tAO tAF tCONST tINT tPLUS tMOINS tMULTIPLIER tDIVISER tEQ tPO tPF tNewLine tVIRGULE tPOINTVIRGULE tPRINTF tBREAK tCONTINUE tIF tWHILE tELSE tNOT tISEQ tISDIF tAND tOR tINF tSUP tINFEQ tSUPEQ

%token <nb> tNB
%token <str> tID
// %token <str> tSTRING
%token <str> tERROR

%%

%start File;

File:
    tMAIN tPO tPF tAO Declarations Instructions tAF;

Bloc:
    tAO Instructions tAF;

Declarations:
    /* epsilon */
    | {printf("Declaration ");} Declaration Declarations
    ;

Declaration:
    tCONST {printf("consts ");} Ids tPOINTVIRGULE
    | tINT {printf("ints ");} Ids tPOINTVIRGULE
    ;

Instructions:
    /* epsilon */
    | Bloc Instructions
    | Instruction Instructions
    ;

Instruction:
    {printf("Expr ");} Expr tPOINTVIRGULE
    | {printf("printf(");} tPRINTF tPO Arg tPF {printf(")");} tPOINTVIRGULE
    | If Bloc
    | If Expr tPOINTVIRGULE
    | If Bloc tELSE Bloc
    | If Expr tPOINTVIRGULE tELSE Bloc
    | If Bloc tELSE Expr tPOINTVIRGULE
    | If Expr tPOINTVIRGULE tELSE Expr tPOINTVIRGULE
    | While Bloc
    | While Expr tPOINTVIRGULE
    ;

If:
    {printf("If ");} tIF tPO Expr tPF
    ;

While:
    {printf("While ");}tWHILE tPO Expr tPF
    ;

Ids:
    Id
    | Id tVIRGULE {printf(",");} Ids
    ;

Id:
    tID {printf("%s",$1);}
    | Ass
    ; 

Ass: 
    tID tEQ {printf("%s ass expr ",$1);} Expr
    ;

Expr:
    Ass
    | tNB {printf("%d",$1);}
    | tID {printf("%s",$1);}
    | {printf("(");}tPO Expr tPF {printf(")");}
    | Expr {printf("+");} tPLUS Expr
    | Expr {printf("-");} tMOINS Expr
    | Expr {printf("/");} tMULTIPLIER Expr
    | Expr {printf("*");} tDIVISER Expr

    | tNOT {printf("!");} Expr    
    | Expr {printf("==");} tISEQ Expr
    | Expr {printf("!=");} tISDIF Expr
    | Expr {printf("&&");} tAND Expr
    | Expr {printf("||");} tOR Expr
    | Expr {printf("<");} tINF Expr
    | Expr {printf(">");} tSUP Expr
    | Expr {printf("<=");} tINFEQ Expr
    | Expr {printf(">=");} tSUPEQ Expr
    ;

Arg:
    tID {printf("%s",$1);}
    | tNB {printf("%d",$1);}
 //   | tSTRING {printf("%s",$1);}
    ;

%%

void yyerror(char* str) {
    extern int yylineno;
    fprintf(stderr, "ERROR yyparse : Line %d: %s\n", yylineno, str);
}

int main(int argc, char *argv[]) {
    yyparse();
    printf("INFO yyparse : Parsing End\n");
    return 0;
}

