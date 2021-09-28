/*
 * Author: Henry Liang
 * Date: 6/9/2021
 */

%{

#include <stdio.h>
#include "list.h"
#include "as.tab.h"
int yylex(void);
void yyerror(char *);
list_node* list_root;

%}

%token FP SP LR IP STRING_LITERAL
%token ADD MOV STR LDR BX

%union{
	int	    v_int;
	char*	v_string;
	list_node*	p_list;
}

%token <v_int> NUMBER
%token <v_string> REG PSEUDO LABEL
%type  <p_list> Start TEXT PSEUDOS STMTS STMT REGS SPECIAL_REG ADDRS ADDR IMME
%type  <p_list> UnaryExp
%type  <p_list> STMT_ADD STMT_MOV STMT_STR STMT_LDR STMT_BX

%start Start

%%

Start
    : TEXT                {$$=$1;list_root=$1;}
    ;

TEXT
    : PSEUDOS             {list_node* var=new_node();var->child=$1;$$=var;}
    | LABEL STMTS         {list_node* var=new_node();var->s=$1;var->child=$2;$$=var;}
    | PSEUDOS TEXT        {list_node* var=new_node();var->child=$1;var->next=$2;$$=var;}
    | LABEL STMTS TEXT    {list_node* var=new_node();var->s=$1;var->child=$2;var->next=$3;$$=var;}
    ;

PSEUDOS
    : PSEUDO                {list_node* var=new_node();$$=var;}
    | PSEUDO PSEUDOS        {list_node* var=new_node();var->s=$1;var->next=$2;$$=var;}
    ;

STMTS
    : STMT              {list_node* var=new_node();var->child=$1;$$=var;}
    | PSEUDO            {list_node* var=new_node();var->s=$1;$$=var;}
    | STMT STMTS        {list_node* var=new_node();var->child=$1;var->next=$2;$$=var;}
    | PSEUDO STMTS      {list_node* var=new_node();var->s=$1;var->next=$2;$$=var;}
    ;

STMT
    : ADD STMT_ADD          {$$=$2;}
    | MOV STMT_MOV          {$$=$2;}
    | STR STMT_STR          {$$=$2;}
    | LDR STMT_LDR          {$$=$2;}
    | BX STMT_BX            {$$=$2;}
    ;

STMT_ADD
    : REGS ',' REGS ',' IMME
       {list_node* oprand1=new_node(); list_node* oprand2=new_node(); list_node* oprand3=new_node();
        oprand1->s=$1; oprand2->s=$3; oprand3->i=$5;
        $$=oprand1; oprand1->next=oprand2; oprand2->next=oprand3; }
    | REGS ',' REGS ',' REGS
       {list_node* oprand1=new_node(); list_node* oprand2=new_node(); list_node* oprand3=new_node();
        oprand1->s=$1; oprand2->s=$3; oprand3->s=$5;
        $$=oprand1; oprand1->next=oprand2; oprand2->next=oprand3; }
    ;

STMT_MOV
    : REGS ',' REGS
    | REGS ',' IMME
    ;

STMT_STR
    : REGS ',' ADDRS
    | REGS ',' ADDRS ',' IMME
    ;

STMT_LDR
    : REGS ',' ADDRS
    | REGS ',' ADDRS ',' IMME
    ;

STMT_BX
    : LR

ADDRS
    : ADDR
    | ADDR '!'

ADDR
    : '[' REGS ']'
    | '[' REGS ',' IMME ']'
    ;

REGS
    : REG           {$$=$1;}
    | SPECIAL_REG   {$$=$1;}
    ;

SPECIAL_REG
    : FP    {$$="FP";}
    | SP    {$$="SP";}
    | LR    {$$="LR";}
    | IP    {$$="IP";}
    ;

IMME
    : '#' UnaryExp  {$$=$2;}
    ;

UnaryExp
    : NUMBER        {$$=$1;}
    | '-' NUMBER    {$$=-$2;}
    ;


%%
extern char yytext[];
extern int column;

void yyerror(char *s)
{
	fflush(stdout);
	printf("\n%*s\n%*s\n", column, "^", column, s);
}
