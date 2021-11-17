/*
 * Author: Henry Liang
 * Date: 11/20/2020
 */

#ifndef LIST_H
#define LIST_H

#include "elf.h"
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

typedef struct _list_node list_node;
struct _list_node{
    char* s;
    opcode_enum opcd;
    instruction_32* ins_32;
    int i;
    list_node* next;
    list_node* child;
};

list_node* new_node();
int show_list(list_node* root, int nest);
#endif