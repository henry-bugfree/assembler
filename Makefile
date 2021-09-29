all: as

as.tab.c as.tab.h: as.y
	bison -t -v -d as.y

lex.yy.c: as.l as.tab.h
	flex as.l
	
as: lex.yy.c as.tab.c as.tab.h
	gcc -o as main.c lex.yy.c list.c as.tab.c -lm
	
clean:
	del as.tab.c lex.yy.c as.tab.h as.output as.exe
