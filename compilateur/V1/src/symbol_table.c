	#define MAXENTRY 100
	#define STRLENGTH 200
	
	enum type_var { 
		NAN, 
		INT
	};

	struct SymbolTable{
	  
	};

	struct SymbolTableEntry
	{
		type_var type;
		char name[STRLENGTH];
		int address;
		int initialized;
	};

	void initSymbolTable(struct SymbolTableEntry * table){
		int i;		
		for(i=0;i<MAXENTRY;i++){
			table[i].type = NAN;
			strncpy(table[i].name,"\0",STRLENGTH);
			table[i].address = -1;
			table[i].initialized = 0;
		}
	}
	void addEntry(struct SymbolTableEntry * table, SymbolTableEntry e){
		
	}

	void initializeEntry(struct SymbolTableEntry * table, char * name){
	  int i=0;
	  while(i<MAXENTRY && ){
	    
	    i++;
	  }
	}

	SymbolTableEntry getEntry(struct SymbolTableEntry * table, char * name){
		return null;
	}

	struct SymbolTableEntry symbolTable[MAXENTRY];
	initSymbolTable(symbolTable);
	
