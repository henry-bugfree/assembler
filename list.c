/*
 * Author: Henry Liang
 * Date: 11/20/2020
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "list.h"
#include "as.tab.h"

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

list_node* create_stmt(opcode_enum opcd, char* s, instruction_32* ins)
{
    list_node* var=new_node();
    var->opcd=opcd;
    var->s=s;
    var->ins_32=ins;
    return var;
}

list_node* create_pseudo(pseudo_enum type,char* s,
                         bool if_extend,bool data_type,
                         char* data_s,int data_i)
{
    list_node* var=new_node();
    var->pseu=type;
    var->s=s;
    if(if_extend)
    {
        pseudo_data* new_data = malloc(sizeof(pseudo_data));
        var->pseu_extend=new_data;
        if(data_type==0) new_data->s=data_s;
        else new_data->i=data_i;
    }
    return var;
}

pseudo_data* pseudo_extend(pseudo_data* data,bool type,char* s,int i)
{
    pseudo_data* new_data = malloc(sizeof (pseudo_data));
    new_data->type=type;
    if(type==0) new_data->s=s;
    else new_data->i=i;
    data->next=new_data;
    return new_data;
}

strtab_list* new_strtab(char* s)
{
    strtab_list* new_node = malloc(sizeof (strtab_list));
    if(new_node == NULL)
    {
        printf("run out of memory.\n");
        exit(0);
    }
    memset(new_node, 0, sizeof(strtab_list));
    new_node->s=s;
    return new_node;
}

symtab_list* new_symtab(Elf32_Word st_name,Elf32_Addr st_value,
                        Elf32_Word st_size,unsigned char st_info,
                        Elf32_Section st_shndx)
{
    symtab_list* new_node = malloc(sizeof (symtab_list));
    if(new_node == NULL)
    {
        printf("run out of memory.\n");
        exit(0);
    }
    memset(new_node, 0, sizeof(symtab_list));
    new_node->st_name=st_name;
    new_node->st_value=st_value;
    new_node->st_size=st_size;
    new_node->st_info=st_info;
    new_node->st_shndx=st_shndx;
    return new_node;
}
