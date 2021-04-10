
#include <stdio.h>
#define FILENAME "test.asm"
FILE *fptr=NULL;

int get_nb_lignes_asm(){
	int count = 0;

	fseek(fptr, 0, SEEK_SET);	
	char c = getc(fptr);	
	while(c!=EOF){
		if (c == '\n') // Increment count if this character is newline
    			count = count + 1;
		c=getc(fptr);
	}
	fclose(fptr);
	fseek(fptr, 0, SEEK_END);
	return count;
}

void replaceTokenAtLine(int value, int whereToReplace){
		int count = 0;
		FILE * fptr2 = fopen(FILENAME,"r");
		FILE* fptmp = fopen(".tmp","w");
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
		rename(".tmp", FILENAME);
		fptr=fopen(FILENAME,"a");
	};


void main(){
  fptr = fopen(FILENAME,"a");
  //printf("%d\n",get_nb_lignes_asm());
  replaceTokenAtLine(63,29);
  fclose(fptr);
/*
  printf("%d\n",pushEntry(&symbolTable,INT,"foo"));
  printf("%d\n",pushEntry(&symbolTable,INT,"bar"));
  printf("%d\n",pushEntry(&symbolTable,INT,"foo"));

  printTable(&symbolTable);
  printf("%d\n",getAddress(&symbolTable,"bar"));
  printf("%d\n",popEntry(&symbolTable));
  printTable(&symbolTable);

  printf("%d\n",getAddress(&symbolTable,"foo"));*/
  

}
