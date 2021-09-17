/*
 * Author: Henry Liang
 * Date: 6/9/2021
 */

%{

#include <stdio.h>
#include "ast.h"
#include "as.tab.h"
int yylex(void);
void yyerror(char *);

%}

%token STR ADD MOV LDR BX FP SP STRING_LITERAL
%union{
	int	v_int;
	char*	v_string;
	ast*	p_ast;
}

%token <v_int> NUMBER
%token <v_string> IDENTIFIER PSEUDO LABEL
%type  <p_ast> TEXT STMT OP ADDR IMME SYB Exp AddExp MulExp UnaryExp PrimaryExp UnaryOp

%start Start

%%

Start
    : TEXT
    ;

TEXT
    : PSEUDO
    | LABEL
    | STMT
    | PSEUDO TEXT
    | LABEL TEXT
    | STMT TEXT
    ;

STMT
    : OP
    | OP STMT
    ;

OP
    : ADDR
    | IMME
    | SYB
    | ADDR ',' OP
    | IMME ',' OP
    | SYB ',' OP
    | SYB OP
    ;

SYB
    : STR
    | ADD
    | MOV
    | LDR
    | BX
    | FP
    | SP
    | STRING_LITERAL
    | IDENTIFIER

ADDR
    : '[' OP ']'
    | '[' OP ']' '!'
    ;

IMME
    : '#' Exp
    ;

Exp
    : AddExp
    ;

AddExp
    : MulExp
    | AddExp '+' MulExp
    | AddExp '-' MulExp
    ;

MulExp
    : UnaryExp
    | MulExp '*' UnaryExp
    | MulExp '/' UnaryExp
    | MulExp '%' UnaryExp
    ;

UnaryExp
    : PrimaryExp
    | UnaryOp UnaryExp
    ;

PrimaryExp
    : '(' Exp ')'
    | NUMBER
    ;

UnaryOp
    : '+'
    | '-'
    | '!'
    ;
%%
extern char yytext[];
extern int column;

void yyerror(char *s)
{
	fflush(stdout);
	printf("\n%*s\n%*s\n", column, "^", column, s);
}
