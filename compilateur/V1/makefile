SRCC:= ./src/*.c

all: compilateur

lex: ./src/compilateur.l
	lex ./src/compilateur.l
	gcc lex.yy.c -Isrc -o ex_lex

compilateur: ./src/compilateur.y ./src/compilateur.l
	yacc -d ./src/compilateur.y
	lex ./src/compilateur.l
	gcc lex.yy.c y.tab.c -Isrc -o compilateur

run: compilateur
	./compilateur < input.txt

clean:
	rm -f lex.yy.c compilateur y.tab.h y.tab.c *.o
