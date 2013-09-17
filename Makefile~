progama: lexico.l sintatico.y
	bison -d sintatico.y
	mv sintatico.tab.h sintatico.h
	mv sintatico.tab.c sintatico.c
	flex lexico.l
	mv lex.yy.c lexico.c
	gcc -o progama sintatico.c lexico.c

clean:
	#rm lexico.* sintatico.* progama.exe
