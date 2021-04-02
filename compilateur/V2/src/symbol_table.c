#include "symbol_table.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void initSymbolTable(struct SymbolTable * t){
  int i;		
  for(i=0;i<MAXENTRY;i++){
    t->table[i].type = NAN;
    strncpy(t->table[i].name,"\0",STRLENGTH);
    t->table[i].address = -1;
    t->table[i].initialized = 0;
  }
  t->n=0;
}

int getAddress(struct SymbolTable * t, char * name){
  int i=0;
  int trouve=0;
  int res =-1;
  
  while(i<(t->n) && !trouve){
    if(strcmp(t->table[i].name,name)==0){
      trouve=1;
      res = t->table[i].address;
    }
    i++;
  }
  return res;
}

int isInitialized(struct SymbolTable * t, char * name){
  int i=0;
  int trouve=0;
  int res =-1;
  
  while(i<(t->n) && !trouve){
    if(strcmp(t->table[i].name,name)==0){
      trouve=1;
      res = t->table[i].initialized;
    }
    i++;
  }
  return res;
}

int pushEntry(struct SymbolTable * t, enum Type_var type ,char * name){
  if((t->n)>=MAXENTRY){
    return -1;
  }
  if(getAddress(t,name)==-1){
    t->table[t->n].type = type;
    strncpy(t->table[t->n].name,name,STRLENGTH);
    t->table[t->n].address = t->n;
    int res = t->n;
    t->table[t->n].initialized = 0;
    (t->n)++;
    return res;
  }
  else{
    return -1;
  }
}

int popEntry(struct SymbolTable * t){
  (t->n)--;
  t->table[t->n].type = NAN;
  strncpy(t->table[t->n].name,"\0",STRLENGTH);
  int res = t->table[t->n].address;
  t->table[t->n].address = -1;
  t->table[t->n].initialized = 0;
  return res;
}

int initializeEntry(struct SymbolTable * t, char * name){
  int i=0;
  int trouve=0;
  while(i<MAXENTRY && !trouve){
    if(strcmp(t->table[i].name,name)==0){
      trouve=1;
      t->table[i].initialized=1;
    }
    i++;
  }
  return trouve-1;
}


void printTable(struct SymbolTable * t){
  printf("Affichage de la table des symboles\n");
  printf("TYPE | NAME | ADDRESS | INIT |\n");
  int i;		
  for(i=0;i<(t->n);i++){
    char stype[10];
	switch (t->table[i].type) {
		case NAN : strncpy(stype,"NAN  ",10);
			break;
		case INT : strncpy(stype,"INT  ",10);
			break;
		case CONST : strncpy(stype,"CONST",10);
			break;
		default : strncpy(stype,"ERR  ",10);
	}    
    printf("%s|  %s   |    %d    |   %d   |\n",stype,t->table[i].name, t->table[i].address, t->table[i].initialized);
  }
}

int getLastAddress(struct SymbolTable * t) {
  int res = t->table[t->n-1].address;
  return res;
}

