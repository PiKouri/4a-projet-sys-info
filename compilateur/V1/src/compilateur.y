%code requires{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symbol_table.h"
    #include "globals.h"
    #define FILENAME "./file.ass"
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
    struct SymbolTable table;
    enum Type_var lasttype; 
    FILE *fptr;
    int itmp = 0;
    void operation2addr(char* op) {
        int tmp1 = popEntry(&table);
        int tmp2 = getLastAddress(&table);            
        fprintf(fptr,"%s %d %d %d\n",op,tmp2,tmp2,tmp1);
    }

    void operation1cst(char* op, int cst) {
        char str[10];
        sprintf(str,"tmp%d",itmp++);
        int tmp = pushEntry(&table,INT,str);
        initializeEntry(&table,str);
        fprintf(fptr,"%s %d %d\n",op,tmp,cst);
    }

    void operation1addr(char* op, char* name) {
        char str[10];
        sprintf(str,"tmp%d",itmp++);
        int tmp = pushEntry(&table,INT,str);
        initializeEntry(&table,str);
        int addr = getAddress(&table,name);
        if (addr == -1) {
            printf("\n\n%s is not defined -> EXIT (line %d)\n\n",name,yylineno);
            exit(-1);
        }
        if (isInitialized(&table,name)!=1) {
            printf("\n\n%s has not been initialized -> EXIT (line %d)\n\n",name,yylineno);
            exit(-2);            
        }
        fprintf(fptr,"%s %d %d\n",op,tmp,addr);
    }

    void affectation(char* name,int declaration){
        int tmp = popEntry(&table);
        int addr = getAddress(&table,name);
        if (!declaration && addr == -1) {
                printf("\n\n%s is not defined -> EXIT (line %d)\n\n",name,yylineno);
                exit(-1);
        }
        initializeEntry(&table,name);
        fprintf(fptr,"COP %d %d\n",addr,tmp);
    }

    void print(char* name){
        int addr = getAddress(&table,name);
        if (addr == -1) {
            printf("\n\n%s is not defined -> EXIT (line %d)\n\n",name,yylineno);
            exit(-1);
        }
        if (isInitialized(&table,name)!=1) {
            printf("\n\n%s has not been initialized -> EXIT (line %d)\n\n",name,yylineno);
            exit(-2);            
        }
        fprintf(fptr,"PRI %d\n",addr);
    }
%}

%left tPLUS
%left tMOINS
%left tMULTIPLIER
%left tDIVISER

%token tMAIN tAO tAF tCONST tINT tPLUS tMOINS tMULTIPLIER tDIVISER tEGAL tPO tPF tVIRGULE tPOINTVIRGULE tPRINTF tBREAK tCONTINUE tIF tWHILE tELSE tNOT tISEQ tISDIF tAND tOR tINF tSUP tINFEQ tSUPEQ

%token <nb> tNB
%token <str> tID
%token <str> tERROR
%type <type> TYPE
%type <str> ID_EGAL
// %token <str> tSTRING

%%

%start FILE;

FILE:
	{printf("-----DEBUT-----\n"); initSymbolTable(&table); fptr = fopen(FILENAME,"w");} 
		tMAIN tPO tPF tAO {printf("-----ZONE DE DECLARATIONS-----\n");} DECLARATIONS 
		{printTable(&table);printf("-----ZONE D'INSTRUCTIONS-----\n");} INSTRUCTIONS tAF 
		{printf("-----FIN-----\n");printTable(&table); fclose(fptr);};

DECLARATIONS :
	/* epsilon */
	| {printf("DECLARATION ");} DECLARATION DECLARATIONS
	;

DECLARATION : 
	TYPE ID_SET tPOINTVIRGULE {printf("\n");}
	;

TYPE : 
	tCONST {printf("CONST : ");lasttype=CONST;}
	| tINT {printf("INT : ");lasttype=INT;}
	;

ID_SET : 
	ID_EGAL EXPRESSION {printf("->%s",$1); affectation($1,1);}
	| tID tVIRGULE 
		{printf("%s,",$1);
		pushEntry(&table,lasttype,$1);} ID_SET
	| ID_EGAL EXPRESSION tVIRGULE 
		{printf("->%s,",$1); affectation($1,1);        
        } ID_SET    
	| tID 
		{printf("%s",$1);
		pushEntry(&table,lasttype,$1);}
	;

ID_EGAL :
    tID tEGAL {pushEntry(&table,lasttype,$1);strncpy($$,$1,STRLENGTH);} 
    ;

INSTRUCTIONS : 
	/* epsilon */
	| IF INSTRUCTION tELSE {printf("ELSE ");} INSTRUCTION INSTRUCTIONS
 	| IF INSTRUCTION INSTRUCTIONS
	| WHILE INSTRUCTION  INSTRUCTIONS
	| INSTRUCTION INSTRUCTIONS 
	;

IF : {printf("IF (");} tIF  tPO EXPRESSION tPF {printf(") ");};

WHILE : {printf("WHILE (");} tWHILE tPO EXPRESSION tPF {printf(") ");};

INSTRUCTION : 
	{printf("BLOC ");} BLOC
	| {printf("INSTRUCTION ");} EXPRESSION tPOINTVIRGULE {printf("\n");}
	;

BLOC : tAO INSTRUCTIONS tAF;

EXPRESSION :
	 tNB {printf("%d",$1);operation1cst("AFC",$1);}
	| tID {printf("%s=",$1);} tEGAL EXPRESSION 
        {initializeEntry(&table,$1); affectation($1,0);}
	| tID {printf("%s",$1);operation1addr("COP",$1);}
	| tPO {printf("(");} EXPRESSION {printf(")");} tPF
	| tNOT {printf("!");} EXPRESSION
	| tPRINTF tPO tID tPF {printf("printf(%s)",$3);print($3);} 
	| EXPRESSION {printf("+");} tPLUS EXPRESSION {operation2addr("ADD");}
	| EXPRESSION {printf("-");} tMOINS EXPRESSION {operation2addr("SOU");}
	| EXPRESSION {printf("*");} tMULTIPLIER EXPRESSION {operation2addr("MUL");}
	| EXPRESSION {printf("/");} tDIVISER EXPRESSION {operation2addr("DIV");}
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

