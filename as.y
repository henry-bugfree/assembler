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

%token PSEUDO_CPU PSEUDO_FILE PSEUDO_TEXT PSEUDO_ALIGN PSEUDO_GLOBAL PSEUDO_ARCH
%token PSEUDO_EABI_ATTR PSEUDO_SYNTAX PSEUDO_ARM PSEUDO_FPU PSEUDO_TYPE PSEUDO_SIZE PSEUDO_IDENT

%token FP SP LR IP
%token ADD AND ASR MOV STR LDR B BEQ BGE BGT BLE BLT BNE BX

%union{
	int	    v_int;
	char*	v_string;
	list_node*	p_list;
}

%token <v_int> NUMBER
%token <v_string> REG LABEL STRING
%type  <p_list> Start TEXT STMTS STMT REGS SPECIAL_REG PSEUDOS PSEUDO ADDRS ADDR IMME
%type  <p_list> UnaryExp
%type  <p_list> STMT_ADD STMT_AND STMT_ASR STMT_MOV STMT_STR STMT_LDR
%type  <p_list> STMT_B STMT_BEQ STMT_BGE STMT_BGT STMT_BLE STMT_BLT STMT_BNE STMT_BX

%start Start

%%

Start
    : TEXT                {$$=$1;list_root=$1;}
    ;

TEXT
    : PSEUDOS             {list_node* var=new_node();var->child=$1;$$=var;}
    | LABEL ':' STMTS         {list_node* var=new_node();var->s=$1;var->child=$3;$$=var;}
    | PSEUDOS TEXT        {list_node* var=new_node();var->child=$1;var->next=$2;$$=var;}
    | LABEL ':' STMTS TEXT    {list_node* var=new_node();var->s=$1;var->child=$3;var->next=$4;$$=var;}
    ;

PSEUDOS
    : PSEUDO              {list_node* var=new_node();var->s="PSEUDO";var->child=$1;$$=var;}
    | PSEUDO PSEUDOS        {list_node* var=new_node();var->s="PSEUDO";var->child=$1;var->next=$2;$$=var;}
    ;

PSEUDO
    : PSEUDO_CPU LABEL
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s="PSEUDO_CPU"; oprand2->s=$2;
        $$=oprand1; oprand1->next=oprand2;}
    | PSEUDO_FILE STRING
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s="PSEUDO_FILE"; oprand2->s=$2;
        $$=oprand1; oprand1->next=oprand2;}
    | PSEUDO_TEXT
       {list_node* oprand1=new_node();
        oprand1->s="PSEUDO_TEXT";
        $$=oprand1;}
    | PSEUDO_ALIGN NUMBER
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s="PSEUDO_ALIGN"; oprand2->i=$2;
        $$=oprand1; oprand1->next=oprand2;}
    | PSEUDO_GLOBAL LABEL
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s="PSEUDO_GLOBAL"; oprand2->s=$2;
        $$=oprand1; oprand1->next=oprand2;}
    | PSEUDO_ARCH LABEL
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s="PSEUDO_ARCH"; oprand2->s=$2;
        $$=oprand1; oprand1->next=oprand2;}
    | PSEUDO_EABI_ATTR NUMBER ',' NUMBER
       {list_node* oprand1=new_node(); list_node* oprand2=new_node(); list_node* oprand3=new_node();
        oprand1->s="PSEUDO_EABI_ATTR"; oprand2->i=$2; oprand3->i=$4;
        $$=oprand1; oprand1->next=oprand2; oprand2->next=oprand3; }
    | PSEUDO_SYNTAX LABEL
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s="PSEUDO_SYNTAX"; oprand2->s=$2;
        $$=oprand1; oprand1->next=oprand2;}
    | PSEUDO_ARM
       {list_node* oprand1=new_node();
        oprand1->s="PSEUDO_ARM";
        $$=oprand1;}
    | PSEUDO_FPU LABEL
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s="PSEUDO_FPU"; oprand2->s=$2;
        $$=oprand1; oprand1->next=oprand2;}
    | PSEUDO_TYPE LABEL ',' LABEL
       {list_node* oprand1=new_node(); list_node* oprand2=new_node(); list_node* oprand3=new_node();
        oprand1->s="PSEUDO_TYPE"; oprand2->s=$2; oprand3->s=$4;
        $$=oprand1; oprand1->next=oprand2; oprand2->next=oprand3; }
    | PSEUDO_SIZE LABEL ',' LABEL
       {list_node* oprand1=new_node(); list_node* oprand2=new_node(); list_node* oprand3=new_node();
        oprand1->s="PSEUDO_SIZE"; oprand2->s=$2; oprand3->s=$4;
        $$=oprand1; oprand1->next=oprand2; oprand2->next=oprand3; }
    | PSEUDO_IDENT STRING
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s="PSEUDO_IDENT"; oprand2->s=$2;
        $$=oprand1; oprand1->next=oprand2;}
    ;

STMTS
    : STMT              {list_node* var=new_node();var->s="STMT";var->child=$1;$$=var;}
    | STMT STMTS        {list_node* var=new_node();var->s="STMT";var->child=$1;var->next=$2;$$=var;}
    ;

STMT
    : ADD STMT_ADD          {list_node* var=new_node();var->s="ADD";var->next=$2;$$=var;}
    | AND STMT_AND          {list_node* var=new_node();var->s="AND";var->next=$2;$$=var;}
    | ASR STMT_ASR          {list_node* var=new_node();var->s="ASR";var->next=$2;$$=var;}
    | MOV STMT_MOV          {list_node* var=new_node();var->s="MOV";var->next=$2;$$=var;}
    | STR STMT_STR          {list_node* var=new_node();var->s="STR";var->next=$2;$$=var;}
    | LDR STMT_LDR          {list_node* var=new_node();var->s="LDR";var->next=$2;$$=var;}
    | B STMT_B              {list_node* var=new_node();var->s="B";var->next=$2;$$=var;}
    | BEQ STMT_BEQ              {list_node* var=new_node();var->s="BEQ";var->next=$2;$$=var;}
    | BGE STMT_BGE              {list_node* var=new_node();var->s="BGE";var->next=$2;$$=var;}
    | BGT STMT_BGT              {list_node* var=new_node();var->s="BGT";var->next=$2;$$=var;}
    | BLE STMT_BLE              {list_node* var=new_node();var->s="BLE";var->next=$2;$$=var;}
    | BLT STMT_BLT              {list_node* var=new_node();var->s="BLT";var->next=$2;$$=var;}
    | BNE STMT_BNE              {list_node* var=new_node();var->s="BNE";var->next=$2;$$=var;}
    | BX STMT_BX            {list_node* var=new_node();var->s="BX";var->next=$2;$$=var;}
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

STMT_AND
    : REGS ',' REGS ',' IMME
       {list_node* oprand1=new_node(); list_node* oprand2=new_node(); list_node* oprand3=new_node();
        oprand1->s=$1; oprand2->s=$3; oprand3->i=$5;
        $$=oprand1; oprand1->next=oprand2; oprand2->next=oprand3; }
    ;

STMT_ASR
    : REGS ',' REGS ',' IMME
       {list_node* oprand1=new_node(); list_node* oprand2=new_node(); list_node* oprand3=new_node();
        oprand1->s=$1; oprand2->s=$3; oprand3->i=$5;
        $$=oprand1; oprand1->next=oprand2; oprand2->next=oprand3; }
    ;

STMT_B
    : LABEL {list_node* oprand1=new_node();oprand1->s=$1;$$=oprand1;}
    ;

STMT_BEQ
    : LABEL {list_node* oprand1=new_node();oprand1->s=$1;$$=oprand1;}
    ;

STMT_BGE
    : LABEL {list_node* oprand1=new_node();oprand1->s=$1;$$=oprand1;}
    ;

STMT_BGT
    : LABEL {list_node* oprand1=new_node();oprand1->s=$1;$$=oprand1;}
    ;

STMT_BLE
    : LABEL {list_node* oprand1=new_node();oprand1->s=$1;$$=oprand1;}
    ;

STMT_BLT
    : LABEL {list_node* oprand1=new_node();oprand1->s=$1;$$=oprand1;}
    ;

STMT_BNE
    : LABEL {list_node* oprand1=new_node();oprand1->s=$1;$$=oprand1;}
    ;

STMT_BX
    : LABEL {list_node* oprand1=new_node();oprand1->s=$1;$$=oprand1;}
    ;

STMT_MOV
    : REGS ',' REGS
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s=$1; oprand2->s=$3;
        $$=oprand1; oprand1->next=oprand2;}
    | REGS ',' IMME
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s=$1; oprand2->i=$3;
        $$=oprand1; oprand1->next=oprand2;}
    ;

STMT_STR
    : REGS ',' ADDRS
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s=$1; oprand2->s="ADDR";
        $$=oprand1; oprand1->next=oprand2;}
    | REGS ',' ADDRS ',' IMME
       {list_node* oprand1=new_node(); list_node* oprand2=new_node(); list_node* oprand3=new_node();
        oprand1->s=$1; oprand2->s="ADDR"; oprand3->i=$5;
        $$=oprand1; oprand1->next=oprand2; oprand2->next=oprand3; }
    ;

STMT_LDR
    : REGS ',' ADDRS
       {list_node* oprand1=new_node(); list_node* oprand2=new_node();
        oprand1->s=$1; oprand2->s="ADDR";
        $$=oprand1; oprand1->next=oprand2;}
    | REGS ',' ADDRS ',' IMME
       {list_node* oprand1=new_node(); list_node* oprand2=new_node(); list_node* oprand3=new_node();
        oprand1->s=$1; oprand2->s="ADDR"; oprand3->i=$5;
        $$=oprand1; oprand1->next=oprand2; oprand2->next=oprand3; }
    ;

STMT_BX
    : REGS
       {list_node* oprand1=new_node();oprand1->s=$1;$$=oprand1;}
    ;

ADDRS
    : ADDR
    | ADDR '!'
    ;

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
