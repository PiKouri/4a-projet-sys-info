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
%token <str> tSTRING
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
    tCONST ConstIds PointVirgule {printf("Declaration Consts: ");}
    | tINT Ids PointVirgule {printf("Declaration ints: ");}
    | Ass PointVirgule
    | tPRINTF tPO Arg tPF tPOINTVIRGULE {printf("printf()\n");}
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

PointVirgule:
    tPOINTVIRGULE {printf("\n");}
    ;

Ids:
    Id
    | Id tVIRGULE Ids
    ;

Id:
    tID {printf("%s",$1);}
    | tID tEQ tNB {printf("%s ass %d",$1,$3);}
    ; 

Ass: 
    tID tEQ tNB {printf("%s ass %d",$1,$3);}
    ;

ConstIds:
    ConstId
    | ConstId tVIRGULE ConstIds
    ;

ConstId:
    tID tEQ tNB {printf("const ass NB ");}
    ;

Arg:
    tID
    | tSTRING
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

