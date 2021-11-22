all: as

lex.yy.c: as.l as.tab.h
	flex as.l

as.tab.c as.tab.h: as.y
	bison -t -v -d as.y
	
as: lex.yy.c as.tab.c as.tab.h
	gcc -w -o as main.c lex.yy.c list.c as.tab.c to_hex.c -lm
	
clean:
	del as.tab.c lex.yy.c as.tab.h as.output as.exe
