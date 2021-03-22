#include "symbol_table.h"
#include <stdio.h>
void main(){
  struct SymbolTable symbolTable;
  initSymbolTable(&symbolTable);

  printTable(&symbolTable);

  printf("%d\n",pushEntry(&symbolTable,INT,"foo"));
  printf("%d\n",pushEntry(&symbolTable,INT,"bar"));
  printf("%d\n",pushEntry(&symbolTable,INT,"foo"));

  printTable(&symbolTable);
  printf("%d\n",getAddress(&symbolTable,"bar"));
  printf("%d\n",popEntry(&symbolTable));
  printTable(&symbolTable);

  printf("%d\n",getAddress(&symbolTable,"foo"));
  

}
