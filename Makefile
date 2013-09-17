calc: exemplo01.l exemplo01.y
	bison -d exemplo01.y
	mv exemplo01.tab.h sintatico.h
	mv exemplo01.tab.c sintatico.c
	flex exemplo01.l
	mv lex.yy.c lexico.c
	gcc -o calc sintatico.c lexico.c

clean:
	rm lexico.* sintatico.* calc.exe
