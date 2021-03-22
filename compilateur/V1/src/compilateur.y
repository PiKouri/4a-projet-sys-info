%code requires {
    #include <stdio.h>
    #include "symbol_table.h"
    #include "globals.h"
}

/* Union for yylval */
%union {
    int nb;
    char str[STRLENGTH]; // A voir
    enum Type_var type;
} 

%{
	int yylex();
	void yyerror(char*);
	int yydebug = 1;
	extern int yylineno;   
    struct SymbolTable symbolTable;
    enum Type_var type; 
%}

%left tPLUS
%left tMOINS
%left tMULTIPLIER

%token tMAIN tAO tAF tCONST tINT tPLUS tMOINS tMULTIPLIER tDIVISER tEGAL tPO tPF tVIRGULE tPOINTVIRGULE tPRINTF tBREAK tCONTINUE tIF tWHILE tELSE tNOT tISEQ tISDIF tAND tOR tINF tSUP tINFEQ tSUPEQ

%token <nb> tNB
%token <str> tID
%token <str> tERROR
%type <type> TYPE
// %token <str> tSTRING

%%

%start FILE;

FILE:
	{printf("-----DEBUT-----\n"); initSymbolTable(&symbolTable);} tMAIN tPO tPF tAO {printf("-----ZONE DE DECLARATIONS-----\n");} DECLARATIONS {printf("-----ZONE D'INSTRUCTIONS-----\n");} INSTRUCTIONS tAF {printf("-----FIN-----\n");};

DECLARATIONS :
	/* epsilon */
	| {printf("DECLARATION ");} DECLARATION DECLARATIONS
	;

DECLARATION : 
	TYPE ID_SET tPOINTVIRGULE {printf("\n");}
	;

TYPE : 
	tCONST {printf("CONST : ");type=INT;}
	| tINT {printf("INT : ");type=INT;}
	;

ID_SET : 
	tID tEGAL EXPRESSION {printf("->%s",$1);}
	| tID tVIRGULE {printf("%s,",$1);} ID_SET
	| tID tEGAL EXPRESSION tVIRGULE {printf("->%s,",$1);} ID_SET    
	| tID {printf("%s",$1);}
	;

INSTRUCTIONS : 
	/* epsilon */
	| IF INSTRUCTION tELSE {printf("ELSE ");} INSTRUCTION INSTRUCTIONS {printf("\n");}
	| IF INSTRUCTION INSTRUCTIONS {printf("\n");}
	| WHILE INSTRUCTION  INSTRUCTIONS {printf("\n");}
	| INSTRUCTION INSTRUCTIONS 
	;

IF : {printf("IF (");} tIF  tPO EXPRESSION tPF {printf(")");};

WHILE : {printf("WHILE (");} tWHILE tPO EXPRESSION tPF {printf(")");};

INSTRUCTION : 
	{printf("BLOC ");} BLOC {printf("\n");}
	| {printf("INSTRUCTION ");} EXPRESSION tPOINTVIRGULE {printf("\n");}
	;

BLOC : tAO INSTRUCTIONS tAF;

EXPRESSION :
	 tNB {printf("%d",$1);}
	| tID {printf("%s=",$1);} tEGAL EXPRESSION
	| tID {printf("%s",$1);}
	| tPO {printf("(");} EXPRESSION {printf(")");} tPF
	| tNOT {printf("!");} EXPRESSION
	| tPRINTF tPO tID tPF {printf("printf(%s)",$3);} 
	| EXPRESSION {printf("+");} tPLUS EXPRESSION
	| EXPRESSION {printf("-");} tMOINS EXPRESSION
	| EXPRESSION {printf("*");} tMULTIPLIER EXPRESSION
	| EXPRESSION {printf("/");} tDIVISER EXPRESSION
	| EXPRESSION {printf("==");} tISEQ EXPRESSION
	| EXPRESSION {printf("!=");} tISDIF EXPRESSION
	| EXPRESSION {printf("<");} tINF EXPRESSION
	| EXPRESSION {printf("<=");} tINFEQ EXPRESSION
	| EXPRESSION {printf(">");} tSUP EXPRESSION
	| EXPRESSION {printf(">=");} tSUPEQ EXPRESSION
	;

/*------------

Bloc:
    tAO Instructions tAF;

DECLARATIONS:
    /* epsilon 
    | {printf("Declaration ");} Declaration DECLARATIONS
    ;

Declaration:
    tCONST {printf("consts ");} Ids tPOINTVIRGULE
    | tINT {printf("ints ");} Ids tPOINTVIRGULE
    ;

Instructions:
    /* epsilon 
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
    tID tEGAL {printf("%s ass expr ",$1);} Expr
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
*/
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

