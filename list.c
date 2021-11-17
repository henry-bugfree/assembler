/*
 * Author: Henry Liang
 * Date: 11/20/2020
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "list.h"

list_node* new_node()
{
    list_node* new_node = (list_node *)malloc(sizeof(list_node));
    if(new_node == NULL)
    {
        printf("run out of memory.\n");
        exit(0);
    }
    memset(new_node, 0, sizeof(list_node));
    return new_node;
}

int show_list(list_node* root, int nest)
{
    list_node* cur=root;
    while(cur!=NULL)
    {
        switch(nest) {
            case 0:
                printf("%s\n", cur->s);
                break;
            case 1:
                printf("\t%s\n", cur->s);
                break;
            case 2:
                cur->s==NULL ? printf("\t\t%d\n", cur->i) : printf("\t\t%s\n", cur->s);
                break;
            default:
                break;
        }
        if(cur->child!=NULL) show_list(cur->child,nest+1);
        cur=cur->next;
    }
    return 0;
}

//typedef struct {
//    condition_enum cond;
//    opcode_enum opcd;
//    char* rn;
//    char* rd;
//    oprand2 op2;
//    int extra;
//    int negative;
//}instruction_32;

instruction_32* create_ins(condition_enum cond,opcode_enum opcd,
               char* rn, char* rd,oprand2_enum op2_type, char* op2_reg,
               int op2_imm,int extra)
{
    instruction_32* new_ins=malloc(sizeof(instruction_32));
    memset(new_ins,0,sizeof(instruction_32));
    new_ins->cond=cond;
    new_ins->opcd=opcd;
    new_ins->rn=rn;
    new_ins->rd=rd;
    new_ins->op2.type=op2_type;
    new_ins->op2.reg=op2_reg;
    new_ins->op2.imm=op2_imm;
    if(new_ins->op2.imm<0){new_ins->negative=1;new_ins->op2.imm=-new_ins->op2.imm;}
    new_ins->extra=extra;
    return new_ins;
}