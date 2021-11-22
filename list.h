/*
 * Author: Henry Liang
 * Date: 11/20/2020
 */

#ifndef LIST_H
#define LIST_H
#include "elf.h"
#include <stdbool.h>
//#include "as.tab.h" //.h之间不能循环调用

typedef enum {
    PS_CPU,
    PS_FILE,
    PS_TEXT,
    PS_ALIGN,
    PS_GLOBAL,
    PS_ARCH,
    PS_COMM,
    PS_WORD,
    PS_EABI_ATTR,
    PS_SYNTAX,
    PS_ARM,
    PS_FPU,
    PS_TYPE,
    PS_SIZE,
    PS_IDENT
}pseudo_enum;

typedef enum {
    OPCD_ADD,
    OPCD_AND,
    OPCD_ASR,
    OPCD_MOV,
    OPCD_STR,
    OPCD_LDR,
    OPCD_B,
    OPCD_BEQ,
    OPCD_BGE,
    OPCD_BGT,
    OPCD_BLE,
    OPCD_BLT,
    OPCD_BNE,
    OPCD_BX
}opcode_enum;

typedef enum {
    COND_NOP,
    COND_EQ,
    COND_NE,
    COND_GE,
    COND_GT,
    COND_LE,
    COND_LT
}condition_enum;

typedef enum {
    reg,imm
}oprand2_enum;

typedef struct {
    oprand2_enum type;
    char* reg;
    int imm;
}oprand2;

typedef struct {
    condition_enum cond;
    opcode_enum opcd;
    char* rn;
    char* rd;
    oprand2 op2;
    int extra;
    int negative;
}instruction_32;

typedef struct _pseudo_data pseudo_data;
struct _pseudo_data
{
    bool type;//0 for char*, 1 for int.
    char* s;
    int i;
    pseudo_data* next;
};

typedef struct _list_node list_node;
struct _list_node{
    char* s;
    int i;
    opcode_enum opcd;
    pseudo_enum pseu;
    pseudo_data* pseu_extend;
    instruction_32* ins_32;
    list_node* next;
    list_node* child;
};

list_node* new_node();
int show_list(list_node* root, int nest);
instruction_32* create_ins(condition_enum cond,opcode_enum opcd,
                           char* rn, char* rd,oprand2_enum op2_type, char* op2_reg,
                           int op2_imm,int extra);

list_node* create_stmt(opcode_enum opcd, char* s, instruction_32* ins);
list_node* create_pseudo(pseudo_enum type, char* s,bool if_extend,bool data_type,char* data_s,int data_i);
pseudo_data* pseudo_extend(pseudo_data* data,bool type,char* s,int i);

typedef struct _strtab_list strtab_list;
struct _strtab_list{
    char* s;
    strtab_list* next;
};
strtab_list* new_strtab(char* s);

typedef struct _symtab_list symtab_list;
struct _symtab_list{
    Elf32_Word st_name;
    Elf32_Addr st_value;
    Elf32_Word st_size;
    unsigned char st_info;
    Elf32_Section st_shndx;
    symtab_list* next;
};
symtab_list* new_symtab(Elf32_Word st_name,Elf32_Addr st_value,
                        Elf32_Word st_size,unsigned char st_info,
                        Elf32_Section st_shndx);
#endif