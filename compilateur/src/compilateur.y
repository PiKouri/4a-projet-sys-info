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

%token tMAIN tAO tAF tCONST tINT tPLUS tMOINS tMULTIPLIER tDIVISER tEQ tPO tPF tNewLine tVIRGULE tPOINTVIRGULE tPRINTF

%token <nb> tNB
%token <str> tID
%token <str> tERROR

%%

%start File;

File:
    tMAIN tPO tPF Bloc;

Bloc:
    tAO Instructions tAF;

Instructions:
    /* epsilon */
    | Instructions Instruction
    ;

Instruction:
    tCONST Consts tPOINTVIRGULE {printf("Consts\n");}
    | tINT Ids tPOINTVIRGULE
    ;

/*    tADD tNB tNB tNB
        {asm_add_3(ADD, $2, $3, $4);}
    | tMUL tNB tNB tNB
        {asm_add_3(MUL, $2, $3, $4);}
    | tSOU tNB tNB tNB
        {asm_add_3(SOU, $2, $3, $4);}
    | tDIV tNB tNB tNB
        {asm_add_3(DIV, $2, $3, $4);}
    | tCOP tNB tNB
        {asm_add_2(COP, $2, $3);}
    | tAFC tNB tNB
        {asm_add_2(AFC, $2, $3);}
    | tJMP tNB
        {asm_add_1(JMP, $2);}
    | tJMF tNB tNB
        {asm_add_2(JMF, $2, $3);}
    | tINF tNB tNB tNB
        {asm_add_3(INF, $2, $3, $4);}
    | tSUP tNB tNB tNB
        {asm_add_3(SUP, $2, $3, $4);}
    | tEQU tNB tNB tNB
        {asm_add_3(EQU, $2, $3, $4);}
    | tPRI tNB
        {asm_add_1(PRI, $2);}
    ;
*/

Ids:
    Id
    | Id tVIRGULE Ids
    ;

Id:
    tID
    | tID tEQ tNB
    ; 

Consts:
    Const
    | Const tVIRGULE Consts
    ;

Const:
    tID
    | tID tEQ tNB
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

