%code requires{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symbol_table.h"
    #include "globals.h"
    #define FILENAME "./output_asm/output.asm"
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
  int asmLineCount = 1;
  void operation(char* op) {
        int tmp1 = popEntry(&table);
        int tmp2 = getLastAddress(&table);
        fprintf(fptr,"%s %d %d %d\n",op,tmp2,tmp2,tmp1);
		asmLineCount++;
    }

    void cst_to_vartemp(int cst) {
        char str[10];
        sprintf(str,"_tmp%d",itmp++);
        int tmp = pushEntry(&table,INT,str);
        initializeEntry(&table,str);
        fprintf(fptr,"AFC %d %d\n",tmp,cst);
		asmLineCount++;
    }

    void var_to_vartemp(char* name) {
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
        fprintf(fptr,"COP %d %d\n",tmp,addr);
		asmLineCount++;
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
		asmLineCount++;
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
		asmLineCount++;
    }

    int makeString(char *dest, char *s1, char *s2, char *s3){
      int len = strlen(s1)+strlen(s2)+strlen(s3);
      if(len<STRLENGTH){
	strcpy(dest,s1);
	strcat(dest,s2);
	strcat(dest,s3);
	return len;
      }else{
	strcpy(dest,"ERROR : Too long expression");
	return -1;
      }
    }

    int get_nb_lignes_asm(){
		return asmLineCount;
    }

	void replaceTokenAtLine(int value, int whereToReplace){
		value--;		
		fclose(fptr);
		int count = 0;
		FILE * fptr2 = fopen(FILENAME,"r");
		FILE* fptmp = fopen("./output_asm/.tmp","w");
		fseek(fptr2, 0, SEEK_SET);
		char buf[100];
		//Aller jusqu'à la ligne précédent la cible.
		while (fgets( buf, 100, fptr2 ) != NULL) 
		{
			count++;
			if(count==whereToReplace){
				//Buf est la ligne cible
				int index;
				for(index=0; buf[index]!='\0';index++){
					if(buf[index]=='?'){
						fprintf(fptmp,"%d",value);
					}else{
						fputc(buf[index], fptmp);	
					}
				}
			}
			else
				fprintf(fptmp,"%s",buf);
		}
		fclose(fptr2);
		fclose(fptmp);
		remove(FILENAME);
		rename("./output_asm/.tmp", FILENAME);
		fptr=fopen(FILENAME,"a");
	};

%}


%token tMAIN tAO tAF tCONST tINT tPLUS tMOINS tMULTIPLIER tDIVISER tEGAL tPO tPF tVIRGULE tPOINTVIRGULE tPRINTF tIF tWHILE tELSE tISEQ tINF tSUP

%token <nb> tNB
%token <str> tID
%type <type> TYPE
%type <str> ID_EGAL
%type <str> EXPRESSION
%type <nb> IF
%type <nb> ELSE
%type <nb> WHILE
%type <nb> WHILE_CONDITION


/* Priorité */
%right tEGAL
%left tSUP tINF
%left tISEQ
%left tPLUS tMOINS
%left tMULTIPLIER tDIVISER

%%

%start FILE;

FILE:
	{printf("-----DEBUT-----\n"); initSymbolTable(&table); fptr = fopen(FILENAME,"w");} tMAIN tPO tPF tAO {printf("-----ZONE DE DECLARATIONS-----\n");} DECLARATIONS 
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
ID_EGAL EXPRESSION {printf("%s<-%s",$1,$2); affectation($1,1);}
	| tID tVIRGULE 
		{printf("%s,",$1);
		pushEntry(&table,lasttype,$1);} ID_SET
	| ID_EGAL EXPRESSION tVIRGULE 
		{printf("%s<-%s,",$1,$2); affectation($1,1);        
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
	| INSTRUCTION INSTRUCTIONS 
	;

INSTRUCTION : 
	  {printf("BLOC BEGIN\n");} BLOC {printf("BLOC END\n");}
	| EXPRESSION tPOINTVIRGULE {printf("INSTRUCTION %s;\n",$1);}
	| IF INSTRUCTION {fprintf(fptr, "JMP ?\n"); asmLineCount++;replaceTokenAtLine(get_nb_lignes_asm(),$1); printf("ELSE ");} ELSE INSTRUCTION {replaceTokenAtLine(get_nb_lignes_asm(),$4);}
	| IF INSTRUCTION {replaceTokenAtLine(get_nb_lignes_asm(),$1);}
	| WHILE WHILE_CONDITION INSTRUCTION {fprintf(fptr, "JMP %d\n",$1);asmLineCount++;replaceTokenAtLine(get_nb_lignes_asm(),$2);}
	;

BLOC : tAO INSTRUCTIONS tAF;

IF : tIF tPO EXPRESSION tPF 
		{
			printf("IF (%s) ",$3);
			int tmp = popEntry(&table);
			$$ = get_nb_lignes_asm() ;
			fprintf(fptr, "JMF %d ?\n", tmp) ;
			asmLineCount++;
		};

ELSE : tELSE {$$=get_nb_lignes_asm()-1;};

WHILE : tWHILE {$$ = get_nb_lignes_asm() ;};

WHILE_CONDITION : tPO EXPRESSION tPF 
		{
			printf("WHILE (%s) ",$2);
			int tmp = popEntry(&table);
			$$ = get_nb_lignes_asm() ;
			fprintf(fptr, "JMF %d ?\n", tmp) ;
			asmLineCount++;
		};

EXPRESSION :
	tNB                                       {sprintf($$,"%d",$1);cst_to_vartemp($1);}
	| tID tEGAL EXPRESSION                    {makeString($$,$1,"<-",$3);affectation($1,0);}
	| tID                                     {makeString($$,$1,"","");var_to_vartemp($1);}
	| tPO EXPRESSION tPF                      {makeString($$,"(",$2,")");}
	| tPRINTF tPO tID tPF                     {makeString($$,"printf(",$3,")");print($3);} 
	| EXPRESSION tPLUS EXPRESSION             {makeString($$,$1,"+",$3);operation("ADD");}
	| EXPRESSION tMOINS EXPRESSION            {makeString($$,$1,"-",$3);operation("SOU");}
	| EXPRESSION tMULTIPLIER EXPRESSION       {makeString($$,$1,"*",$3);operation("MUL");}
	| EXPRESSION tDIVISER EXPRESSION          {makeString($$,$1,"/",$3);operation("DIV");}
	| EXPRESSION tISEQ EXPRESSION             {makeString($$,$1,"==",$3);operation("EQU");}
	| EXPRESSION tINF EXPRESSION              {makeString($$,$1,"<",$3);operation("INF");}
	| EXPRESSION tSUP EXPRESSION              {makeString($$,$1,">",$3);operation("SUP");}
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

