portugolc: PCLexico.l PCSintatico.y
	bison -d PCSintatico.y
	mv PCSintatico.tab.h sintatico.h
	mv PCSintatico.tab.c sintatico.c
	flex PCLexico.l
	mv lex.yy.c lexico.c
	g++ sintatico.c lexico.c -Wall -g -o portugolc -lm

init: portugolc
	rm codigo.c
	./portugolc codigo.prg >> codigo.c

exec: codigo.c
	gcc codigo.c -o programaC
	./programaC

clean: 
	rm lexico.* sintatico.* portugolc


