//
// Created by Henry on 11/8/2021.
//

#ifndef ASSEMBLER_TO_HEX_H
#define ASSEMBLER_TO_HEX_H

#include "elf.h"
#include "list.h"

int to_hex(FILE *fp,list_node* root);
char* elf_header();
char* text(list_node* root);
int process_ins(instruction_32* ptr_ins,Elf32_Word* instruction_set,int ins_count);
int process_condition(Elf32_Word* target, condition_enum cond);
int process_opcode(Elf32_Word* target,instruction_32* ptr_ins);
int process_rd(Elf32_Word* target,char* r);
int process_rn(Elf32_Word* target,char* r);
int process_oprand2(Elf32_Word* target,instruction_32* ptr_ins);
Elf32_Word process_reg(char* reg);
char* data();
char* bss();
char* symtab(list_node* root);
int get_symtab(symtab_list* my_symtab,list_node* root);
char* strtab(list_node* root);
int get_strtab(strtab_list* my_strtab,list_node* root);
char* shstrtab();
char* section_header_table();
int write_to_file(char* c_elfhd,char* c_text,char* c_data,
                  char* c_bss,char* c_sym,char* c_str,
                  char* c_shstr,char* c_shdt,FILE* fp);
int test_to_hex(FILE *fp);
int test_elf_header(FILE *fp);
int test_text(FILE *fp);
int test_data(FILE *fp);
int test_bss(FILE *fp);
int test_symtab(FILE *fp);
int test_strtab(FILE *fp);
int test_shstrtab(FILE *fp);
int test_section_header_table(FILE *fp);

#endif //ASSEMBLER_TO_HEX_H
