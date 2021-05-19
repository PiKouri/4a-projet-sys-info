SRCC:= ./src/*.c

all: compilateur

lex: ./src/compilateur_test.l
	lex ./src/compilateur_test.l
	gcc lex.yy.c -Isrc -o ex_lex

compilateur: ./src/compilateur.y ./src/compilateur.l ./src/symbol_table.c
	yacc -d ./src/compilateur.y
	lex ./src/compilateur.l
	gcc ./src/symbol_table.c lex.yy.c y.tab.c -Isrc -o compilateur

clean:
	rm -f ex_lex lex.yy.c compilateur y.tab.h y.tab.c *.o

run : compile 
ifdef SRC
	make execute SRC=$(subst .myc,.asm,$(SRC))
else
	make execute
endif
	

compile: compilateur
ifdef SRC
	./compilateur < input_myc/$(SRC)
	rm -f -- output_asm/$(subst .myc,.asm,$(SRC))
	mv output_asm/output.asm output_asm/$(subst .myc,.asm,$(SRC))
else
	./compilateur < input_myc/default.myc
	rm -f -- output_asm/default.asm
	mv output_asm/output.asm output_asm/default.asm
endif

execute :
ifdef SRC
	./../../interpreter/interpreter < output_asm/$(SRC)
else
	./../../interpreter/interpreter < output_asm/default.asm
endif


