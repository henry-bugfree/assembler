/*
 * Author: Henry Liang
 * Date: 6/9/2021
 */

%{

#include <stdio.h>
#include "list.h"
#include "as.tab.h"
#include "to_hex.h"
int yylex(void);
void yyerror(char *);
list_node* list_root;
int ins_num=0;
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
%type  <p_list> Start TEXT STMTS STMT REGS SPECIAL_REG PSEUDOS PSEUDO IMME
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
    : STMT              {list_node* var=new_node();var->s="STMT";var->child=$1;$$=var;ins_num++;}
    | STMT STMTS        {list_node* var=new_node();var->s="STMT";var->child=$1;var->next=$2;$$=var;ins_num++;}
    ;

STMT
    : ADD STMT_ADD          {list_node* var=new_node();var->opcd=OPCD_ADD;var->s="ADD";var->ins_32=$2;$$=var;}
    | AND STMT_AND          {list_node* var=new_node();var->opcd=OPCD_AND;var->s="AND";var->ins_32=$2;$$=var;}
    | ASR STMT_ASR          {list_node* var=new_node();var->opcd=OPCD_ASR;var->s="ASR";var->ins_32=$2;$$=var;}
    | MOV STMT_MOV          {list_node* var=new_node();var->opcd=OPCD_MOV;var->s="MOV";var->ins_32=$2;$$=var;}
    | STR STMT_STR          {list_node* var=new_node();var->opcd=OPCD_STR;var->s="STR";var->ins_32=$2;$$=var;}
    | LDR STMT_LDR          {list_node* var=new_node();var->opcd=OPCD_LDR;var->s="LDR";var->ins_32=$2;$$=var;}
    | B STMT_B              {list_node* var=new_node();var->opcd=OPCD_B;  var->s="B";  var->ins_32=$2;$$=var;}
    | BEQ STMT_BEQ          {list_node* var=new_node();var->opcd=OPCD_BEQ;var->s="BEQ";var->ins_32=$2;$$=var;}
    | BGE STMT_BGE          {list_node* var=new_node();var->opcd=OPCD_BGE;var->s="BGE";var->ins_32=$2;$$=var;}
    | BGT STMT_BGT          {list_node* var=new_node();var->opcd=OPCD_BGT;var->s="BGT";var->ins_32=$2;$$=var;}
    | BLE STMT_BLE          {list_node* var=new_node();var->opcd=OPCD_BLE;var->s="BLE";var->ins_32=$2;$$=var;}
    | BLT STMT_BLT          {list_node* var=new_node();var->opcd=OPCD_BLT;var->s="BLT";var->ins_32=$2;$$=var;}
    | BNE STMT_BNE          {list_node* var=new_node();var->opcd=OPCD_BNE;var->s="BNE";var->ins_32=$2;$$=var;}
    | BX STMT_BX            {list_node* var=new_node();var->opcd=OPCD_BX;var->s="BX";  var->ins_32=$2;$$=var;}
    ;

STMT_ADD
    : REGS ',' REGS ',' IMME
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_ADD;ins->rn=$3;ins->rd=$1;
       ins->op2.type=imm;ins->op2.imm=$5;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    | REGS ',' REGS ',' REGS
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_ADD;ins->rn=$3;ins->rd=$1;
       ins->op2.type=reg;ins->op2.reg=$5;}
    ;

STMT_AND
    : REGS ',' REGS ',' IMME
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_AND;ins->rn=$3;ins->rd=$1;
       ins->op2.type=imm;ins->op2.imm=$5;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    ;

STMT_ASR
    : REGS ',' REGS ',' IMME
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_ASR;ins->rn=$3;ins->rd=$1;
       ins->op2.type=imm;ins->op2.imm=$5;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
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
    : REGS
        {instruction_32* ins=malloc(sizeof(instruction_32));
        memset(ins,0,sizeof(ins));$$=ins;
        ins->cond=COND_NOP;ins->opcd=OPCD_BX;ins->op2.type=reg;ins->op2.reg=$1;}
    ;

STMT_MOV
    : REGS ',' REGS
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_MOV;ins->rd=$1;
       ins->op2.type=reg;ins->op2.reg=$3;}
    | REGS ',' IMME
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_MOV;ins->rd=$1;
       ins->op2.type=imm;ins->op2.imm=$3;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    ;

STMT_STR
    : REGS ',' '[' REGS ']' '!'
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_STR;ins->rd=$1;
       ins->op2.type=reg;ins->op2.reg=$4;ins->extra=0;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    | REGS ',' '[' REGS ']'
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_STR;ins->rd=$1;
       ins->op2.type=reg;ins->op2.reg=$4;ins->extra=1;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    | REGS ',' '[' REGS ',' IMME ']' '!'
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_STR;ins->rd=$1;ins->rn=$4;
       ins->op2.type=imm;ins->op2.imm=$6;ins->extra=2;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    | REGS ',' '[' REGS ',' IMME ']'
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_STR;ins->rd=$1;ins->rn=$4;
       ins->op2.type=imm;ins->op2.imm=$6;ins->extra=3;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    | REGS ',' '[' REGS ']' ',' IMME
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_STR;ins->rd=$1;ins->rn=$4;
       ins->op2.type=imm;ins->op2.imm=$7;ins->extra=4;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    ;

STMT_LDR
    : REGS ',' '[' REGS ']' '!'
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_LDR;ins->rd=$1;
       ins->op2.type=reg;ins->op2.reg=$4;ins->extra=0;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    | REGS ',' '[' REGS ']'
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_LDR;ins->rd=$1;
       ins->op2.type=reg;ins->op2.reg=$4;ins->extra=1;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    | REGS ',' '[' REGS ',' IMME ']' '!'
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_LDR;ins->rd=$1;ins->rn=$4;
       ins->op2.type=imm;ins->op2.imm=$6;ins->extra=2;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    | REGS ',' '[' REGS ',' IMME ']'
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_LDR;ins->rd=$1;ins->rn=$4;
       ins->op2.type=imm;ins->op2.imm=$6;ins->extra=3;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
    | REGS ',' '[' REGS ']' ',' IMME
       {instruction_32* ins=malloc(sizeof(instruction_32));
       memset(ins,0,sizeof(ins));$$=ins;
       ins->cond=COND_NOP;ins->opcd=OPCD_LDR;ins->rd=$1;ins->rn=$4;
       ins->op2.type=imm;ins->op2.imm=$7;ins->extra=4;
       if(ins->op2.imm<0){ins->negative=1;ins->op2.imm=-ins->op2.imm;}}
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
