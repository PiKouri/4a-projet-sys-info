SRCC:= ./src/*.c

all: compilateur

lex: ./src/compilateur_test.l
	lex ./src/compilateur_test.l
	gcc lex.yy.c -Isrc -o ex_lex

compilateur: ./src/compilateur.y ./src/compilateur.l ./src/symbol_table.c
	yacc -d ./src/compilateur.y
	lex ./src/compilateur.l
	gcc ./src/symbol_table.c lex.yy.c y.tab.c -Isrc -o compilateur

run : compile

compile: compilateur
	./compilateur < input.txt

execute : 
	./../../interpreter/interpreter < output.asm

clean:
	rm -f ex_lex lex.yy.c compilateur y.tab.h y.tab.c *.o
