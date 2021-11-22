/*
 * Author: Henry Liang
 * Date: 6/9/2021
 */

%{

#include <stdio.h>
#include <stdlib.h>
#include "list.h"
#include "as.tab.h"
#include "to_hex.h"
int yylex(void);
void yyerror(char *);
list_node* list_root;
Elf32_Word ins_num=0;
Elf32_Word sym_num=0;
%}

%token PSEUDO_CPU PSEUDO_FILE PSEUDO_TEXT PSEUDO_ALIGN PSEUDO_GLOBAL PSEUDO_ARCH PSEUDO_COMM PSEUDO_WORD
%token PSEUDO_EABI_ATTR PSEUDO_SYNTAX PSEUDO_ARM PSEUDO_FPU PSEUDO_TYPE PSEUDO_SIZE PSEUDO_IDENT

%token FP SP LR IP
%token ADD SUB AND MOV STR LDR BX

%union{
	int	    v_int;
	char*	v_string;
	list_node*	p_list;
}

%token <v_int> NUMBER
%token <v_string> REG LABEL STRING
%type  <p_list> Start TEXT STMTS STMT REGS SPECIAL_REG PSEUDOS PSEUDO IMME
%type  <p_list> UnaryExp
%type  <p_list> STMT_ADD STMT_SUB STMT_AND STMT_MOV STMT_STR STMT_LDR
%type  <p_list> STMT_BX

%start Start

%%

Start
    : TEXT                {$$=$1;list_root=$1;}
    ;

TEXT
    : PSEUDOS             {list_node* var=new_node();var->child=$1;$$=var;}
    | PSEUDOS TEXT        {list_node* var=new_node();var->child=$1;var->next=$2;$$=var;}
    | LABEL ':' PSEUDOS         {list_node* var=new_node();var->s=$1;var->child=$3;$$=var;}
    | LABEL ':' PSEUDOS TEXT    {list_node* var=new_node();var->s=$1;var->child=$3;var->next=$4;$$=var;}
    | LABEL ':' STMTS         {list_node* var=new_node();var->s=$1;var->child=$3;$$=var;}
    | LABEL ':' STMTS TEXT    {list_node* var=new_node();var->s=$1;var->child=$3;var->next=$4;$$=var;}
    ;

PSEUDOS
    : PSEUDO              {list_node* var=new_node();var->s="PSEUDO";var->child=$1;$$=var;}
    | PSEUDO PSEUDOS        {list_node* var=new_node();var->s="PSEUDO";var->child=$1;var->next=$2;$$=var;}
    ;

PSEUDO
    : PSEUDO_CPU LABEL
       {list_node* var=create_pseudo(PS_CPU,"PSEUDO_CPU",1,0,$2,0);
       $$=var;}
    | PSEUDO_FILE STRING
       {list_node* var=create_pseudo(PS_FILE,"PSEUDO_FILE",1,0,$2,0);
       $$=var;sym_num++;}
    | PSEUDO_TEXT
       {list_node* var=create_pseudo(PS_TEXT,"PSEUDO_TEXT",0,0,NULL,0);
       $$=var;}
    | PSEUDO_ALIGN NUMBER
       {list_node* var=create_pseudo(PS_ALIGN,"PSEUDO_ALIGN",1,1,NULL,$2);
       $$=var;}
    | PSEUDO_GLOBAL LABEL
       {list_node* var=create_pseudo(PS_GLOBAL,"PSEUDO_GLOBAL",1,0,$2,0);
       $$=var;sym_num++;}
    | PSEUDO_ARCH LABEL
       {list_node* var=create_pseudo(PS_ARCH,"PSEUDO_ARCH",1,0,$2,0);
       $$=var;}
    | PSEUDO_EABI_ATTR NUMBER ',' NUMBER
       {list_node* var=create_pseudo(PS_EABI_ATTR,"PSEUDO_EABI_ATTR",1,1,NULL,$2);
       pseudo_extend(var->pseu_extend,1,NULL,$4);
       $$=var;}
    | PSEUDO_SYNTAX LABEL
       {list_node* var=create_pseudo(PS_SYNTAX,"PSEUDO_SYNTAX",1,0,$2,0);
       $$=var;}
    | PSEUDO_ARM
       {list_node* var=create_pseudo(PS_ARM,"PSEUDO_ARM",0,0,NULL,0);
       $$=var;}
    | PSEUDO_FPU LABEL
       {list_node* var=create_pseudo(PS_FPU,"PSEUDO_FPU",1,0,$2,0);
       $$=var;}
    | PSEUDO_TYPE LABEL ',' LABEL
       {list_node* var=create_pseudo(PS_TYPE,"PSEUDO_TYPE",1,0,$2,0);
       pseudo_extend(var->pseu_extend,0,$4,0);
       $$=var;}
    | PSEUDO_SIZE LABEL ',' LABEL
       {list_node* var=create_pseudo(PS_SIZE,"PSEUDO_SIZE",1,0,$2,0);
       pseudo_extend(var->pseu_extend,0,$4,0);
       $$=var;}
    | PSEUDO_IDENT STRING
       {list_node* var=create_pseudo(PS_IDENT,"PSEUDO_IDENT",1,0,$2,0);
       $$=var;}
    | PSEUDO_COMM LABEL ',' NUMBER ',' NUMBER
       {list_node* var=create_pseudo(PS_SIZE,"PSEUDO_COMM",1,0,$2,0);
       pseudo_extend(var->pseu_extend,0,$4,0);
       pseudo_extend(var->pseu_extend->next,0,$6,0);
       $$=var;}
    | PSEUDO_WORD LABEL
       {list_node* var=create_pseudo(PS_WORD,"PSEUDO_WORD",1,0,$2,0);
       $$=var;}
    ;

STMTS
    : STMT              {list_node* var=new_node();var->s="STMT";var->child=$1;$$=var;ins_num++;}
    | STMT STMTS        {list_node* var=new_node();var->s="STMT";var->child=$1;var->next=$2;$$=var;ins_num++;}
    ;

STMT
    : ADD STMT_ADD          {$$=create_stmt(OPCD_ADD,"ADD",$2);}
    | AND STMT_AND          {$$=create_stmt(OPCD_AND,"AND",$2);}
    | MOV STMT_MOV          {$$=create_stmt(OPCD_MOV,"MOV",$2);}
    | STR STMT_STR          {$$=create_stmt(OPCD_STR,"STR",$2);}
    | LDR STMT_LDR          {$$=create_stmt(OPCD_LDR,"LDR",$2);}
    | BX  STMT_BX           {$$=create_stmt(OPCD_BX ,"BX ",$2);}
    ;

STMT_ADD
    : REGS ',' REGS ',' IMME
        {$$=create_ins(COND_NOP,OPCD_ADD,$3,$1,imm,NULL,$5,0);}
    | REGS ',' REGS ',' REGS
        {$$=create_ins(COND_NOP,OPCD_ADD,$3,$1,reg,$5,0,0);}
    ;

STMT_AND
    : REGS ',' REGS ',' IMME
       {$$=create_ins(COND_NOP,OPCD_AND,$3,$1,imm,NULL,$5,0);}
    ;

STMT_BX
    : REGS
        {$$=create_ins(COND_NOP,OPCD_BX,NULL,NULL,reg,$1,0,0);}
    ;

STMT_MOV
    : REGS ',' REGS
       {$$=create_ins(COND_NOP,OPCD_MOV,NULL,$1,reg,$3,0,0);}
    | REGS ',' IMME
       {$$=create_ins(COND_NOP,OPCD_MOV,NULL,$1,imm,NULL,$3,0);}
    ;

STMT_STR
    : REGS ',' '[' REGS ']' '!'
        {$$=create_ins(COND_NOP,OPCD_STR,NULL,$1,reg,$4,0,0);}
    | REGS ',' '[' REGS ']'
        {$$=create_ins(COND_NOP,OPCD_STR,NULL,$1,reg,$4,0,1);}
    | REGS ',' '[' REGS ',' IMME ']' '!'
       {$$=create_ins(COND_NOP,OPCD_STR,$4,$1,imm,NULL,$6,2);}
    | REGS ',' '[' REGS ',' IMME ']'
       {$$=create_ins(COND_NOP,OPCD_STR,$4,$1,imm,NULL,$6,3);}
    | REGS ',' '[' REGS ']' ',' IMME
       {$$=create_ins(COND_NOP,OPCD_STR,$4,$1,imm,NULL,$7,4);}
    ;

STMT_LDR
    : REGS ',' '[' REGS ']' '!'
        {$$=create_ins(COND_NOP,OPCD_LDR,NULL,$1,reg,$4,0,0);}
    | REGS ',' '[' REGS ']'
        {$$=create_ins(COND_NOP,OPCD_LDR,NULL,$1,reg,$4,0,1);}
    | REGS ',' '[' REGS ',' IMME ']' '!'
       {$$=create_ins(COND_NOP,OPCD_LDR,$4,$1,imm,NULL,$6,2);}
    | REGS ',' '[' REGS ',' IMME ']'
       {$$=create_ins(COND_NOP,OPCD_LDR,$4,$1,imm,NULL,$6,3);}
    | REGS ',' '[' REGS ']' ',' IMME
       {$$=create_ins(COND_NOP,OPCD_LDR,$4,$1,imm,NULL,$7,4);}
    ;

REGS
    : REG           {$$=$1;}
    | SPECIAL_REG   {$$=$1;}
    ;

SPECIAL_REG
    : FP    {$$="FP";}
    | IP    {$$="IP";}
    | SP    {$$="SP";}
    | LR    {$$="LR";}
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
