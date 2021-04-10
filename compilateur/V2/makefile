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

clean:
	rm -f ex_lex lex.yy.c compilateur y.tab.h y.tab.c *.o

compile: compilateur
	./compilateur < input_myc/input.myc

compile_pgcd: compilateur
	./compilateur < input_myc/pgcd.myc

execute : 
	./../../interpreter/interpreter < output_asm/output.asm

test_pgcd_12 : compilateur
	./compilateur < input_myc/pgcd.myc
	./../../interpreter/interpreter < output_asm/output.asm

test_pgcd_7 : compilateur
	./compilateur < input_myc/pgcd_7.myc
	./../../interpreter/interpreter < output_asm/output.asm

test_pgcd_1 : compilateur
	./compilateur < input_myc/pgcd_1.myc
	./../../interpreter/interpreter < output_asm/output.asm

