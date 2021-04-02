#include "globals.h"
	
enum Type_var { 
	NAN, 
	CONST,
	INT
};

struct SymbolTableEntry
{
	enum Type_var type;
	char name[STRLENGTH];
	int address;
	int initialized;
};

struct SymbolTable{
  struct SymbolTableEntry table[MAXENTRY];
  int n;
};

void initSymbolTable(struct SymbolTable * t);

int pushEntry(struct SymbolTable * t, enum Type_var type ,char * name);
int popEntry(struct SymbolTable * t);

int initializeEntry(struct SymbolTable * t, char * name);
int getAddress(struct SymbolTable * t, char * name);
int getLastAddress(struct SymbolTable * t);
int isInitialized(struct SymbolTable * t, char * name);
void printTable(struct SymbolTable * t);
	

/*
struct SymbolTable symbolTable;
initSymbolTable(symbolTable);
*/

