portugolc: PCLexico.l PCSintatico.y
	bison -d PCSintatico.y
	mv PCSintatico.tab.h sintatico.h
	mv PCSintatico.tab.c sintatico.c
	flex PCLexico.l
	mv lex.yy.c lexico.c
	gcc -o portugolc sintatico.c lexico.c -lm

init: portugolc
	rm codigo.c
	./portugolc >> codigo.c

exec: codigo.c
	gcc codigo.c -o programaC
	./programaC
	
clean:
	rm lexico.* sintatico.* portugolc


