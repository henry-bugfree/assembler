//
// Created by Henry on 11/8/2021.
//
#include <stdio.h>
#include <stdlib.h>
#include "to_hex.h"
#include "elf.h"
#include "list.h"
#include <string.h>

extern Elf32_Word ins_num;
extern Elf32_Word sym_num;
Elf32_Word strtab_len=0;

int to_hex(FILE *fp,list_node* root)
{
    elf_header(fp);
    //test_text(fp);
    text(fp, root);
    data(fp);
    bss(fp);
    symtab(fp,root);
    strtab(fp,root);
//    test_strtab(fp);
    shstrtab(fp);
    section_header_table(fp,7);
//    test_section_header_table(fp);
    return 0;
}
int elf_header(FILE *fp)
{
    Elf32_Ehdr* header= malloc(sizeof (Elf32_Ehdr));
    memcpy(header->e_ident,"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0",16);   /* Magic number and other info */
    header->e_type=0x0001;          /* Object file type */
    header->e_machine=0x0028;       /* Architecture */
    header->e_version=0x00000001;   /* Object file version */
    header->e_entry=0x00000000;     /* Entry point virtual address */
    header->e_phoff=0x00000000; 	/* Program header table file offset */
    header->e_shoff=0x000000bc;		/* Section header table file offset */
    header->e_flags=0x05000000;		/* Processor-specific flags */
    header->e_ehsize=0x0034;		/* ELF header size in bytes */
    header->e_phentsize=0x0000;		/* Program header table entry size */
    header->e_phnum=0x0000;		    /* Program header table entry count */
    header->e_shentsize=0x0028;		/* Section header table entry size */
    header->e_shnum=0x0007;		    /* Section header table entry count */
    header->e_shstrndx=0x0006;		/* Section header string table index */

    char* header_char=(char*)header;
    for(int i=0;i<sizeof(Elf32_Ehdr);i++)
        fprintf(fp,"%c",header_char[i]);
    return 0;
}
int text(FILE *fp,list_node* root)
{
    Elf32_Word* instruction_set=malloc(sizeof(Elf32_Word)*ins_num);
    int ins_count=0;
    list_node* cur0=root;
    while(cur0!=NULL)
    {
        list_node* cur1=cur0->child;
        while(cur1!=NULL)
        {
            if(strcmp(cur1->s,"STMT")==0)
            {
                process_ins(cur1->child->ins_32,instruction_set,ins_count);
                ins_count++;
            }
            cur1=cur1->next;
        }
        cur0=cur0->next;
    }
    char* text_char=(char*)instruction_set;
    for(int i=0;i<sizeof(Elf32_Word)*ins_num;i++)
        fprintf(fp,"%c",text_char[i]);
    return 0;
}
int process_condition(Elf32_Word* target, condition_enum cond)
{
    switch(cond)
    {
        case COND_NOP:
            *target=(*target) | (0xe0);
            break;
        case COND_EQ:
            break;
        case COND_NE:
            break;
        case COND_GE:
            break;
        case COND_GT:
            break;
        case COND_LE:
            break;
        case COND_LT:
            break;
        default:
            break;
    }
    return 0;
}
int process_opcode(Elf32_Word* target,instruction_32* ptr_ins)
{
    opcode_enum opcd=ptr_ins->opcd;
    oprand2_enum op2_type=ptr_ins->op2.type;
    int extra=ptr_ins->extra;
    int neg=ptr_ins->negative;
    switch(opcd)
    {
        case OPCD_ADD:
//            add r1,r2,r3
//            1110 0000 1000 0010 0001 0000 0000 0011
//            0000 0011 0001 0000 1000 0010 1110 0000
            if(op2_type==reg){
                *target=*target | (0x00);
                *target=*target | (0x8000);
            }
            else if(op2_type==imm && neg==0){
                *target=*target | (0x02);
                *target=*target | (0x8000);
            }
            else if(op2_type==imm && neg==1){
                *target=*target | (0x02);
                *target=*target | (0x4000);
            }
            break;
        case OPCD_AND:
            break;
        case OPCD_ASR:
            break;
        case OPCD_MOV:
            if(op2_type==reg){
                *target=*target | (0x01);
                *target=*target | (0xa000);
            }
            else if(op2_type==imm && neg==0){
                *target=*target | (0x03);
                *target=*target | (0xa000);
            }
            else if(op2_type==imm && neg==1){
                *target=*target | (0x03);
                *target=*target | (0xe000);
            }
            break;
        case OPCD_STR:
            switch (extra) {
                case 0:
                    *target=*target | (0x05);
                    *target=*target | (0xa000);
                    break;
                case 1:
                    *target=*target | (0x05);
                    *target=*target | (0x8000);
                    break;
                case 2:
                    *target = *target | (0x05);
                    *target = *target | (0xa000);
                    if(neg==1) *target = *target ^ 0x8000;
                    break;
                case 3:
                    *target=*target | (0x05);
                    *target=*target | (0x8000);
                    if(neg==1) *target = *target ^ 0x8000;
                    break;
                case 4:
                    *target=*target | (0x04);
                    *target=*target | (0x8000);
                    if(neg==1) *target = *target ^ 0x8000;
                    break;
                default:
                    break;
            }
            break;
        case OPCD_LDR:
            switch (extra) {
                case 0:
                    *target=*target | (0x05);
                    *target=*target | (0xb000);
                    break;
                case 1:
                    *target=*target | (0x05);
                    *target=*target | (0x9000);
                    break;
                case 2:
                    *target=*target | (0x05);
                    *target=*target | (0xb000);
                    if(neg==1) *target = *target ^ 0x8000;
                    break;
                case 3:
                    *target=*target | (0x05);
                    *target=*target | (0x9000);
                    if(neg==1) *target = *target ^ 0x8000;
                    break;
                case 4:
                    *target=*target | (0x04);
                    *target=*target | (0x9000);
                    if(neg==1) *target = *target ^ 0x8000;
                    break;
                default:
                    break;
            }
            break;
        case OPCD_B:
            break;
        case OPCD_BEQ:
            break;
        case OPCD_BGE:
            break;
        case OPCD_BGT:
            break;
        case OPCD_BLE:
            break;
        case OPCD_BLT:
            break;
        case OPCD_BNE:
            break;
        case OPCD_BX:
            *target=*target | (0x10FF2F01);
            break;
        default:
            break;
    }
    return 0;
}
Elf32_Word process_reg(char* reg)
{
    Elf32_Word ans;
    if(strcmp(reg,"FP")==0) ans=11;
    else if(strcmp(reg,"IP")==0) ans=12;
    else if(strcmp(reg,"SP")==0) ans=13;
    else if(strcmp(reg,"LR")==0) ans=14;
    else {
        if(strlen(reg)==3) ans=10;
        else{
            ans=reg[1]-'0';
        }
    }
    return ans;
}
int process_rd(Elf32_Word* target,char* r)
{
    Elf32_Word reg;
    reg=process_reg(r);
    *target |= (reg<<20);
    return 0;
}
int process_rn(Elf32_Word* target,char* r)
{
    Elf32_Word reg;
    reg=process_reg(r);
    *target |= (reg<<8);
    return 0;
}
int process_oprand2(Elf32_Word* target,instruction_32* ptr_ins)
{
    oprand2 op2=ptr_ins->op2;
    if(ptr_ins->opcd==OPCD_BX)
    {
        Elf32_Word reg;
        reg=process_reg(op2.reg);
        *target |= (reg<<24);
    }
    else {
        if(op2.type==reg)
        {
            Elf32_Word reg;
            reg=process_reg(op2.reg);
            *target |= (reg<<24);
        }
        if(op2.type==imm)
        {
            //max imm=256??(0x xxxxxxxC01)
            *target |= (op2.imm<<24);
        }
    }
    return 0;
}
int process_ins(instruction_32* ptr_ins,Elf32_Word* instruction_set,int ins_count)
{
    Elf32_Word target=0x00;
    process_condition(&target,ptr_ins->cond);
    process_opcode(&target,ptr_ins);
    if(ptr_ins->rd!=NULL)process_rd(&target,ptr_ins->rd);
    if(ptr_ins->rn!=NULL) process_rn(&target,ptr_ins->rn);
    process_oprand2(&target,ptr_ins);
    *(instruction_set + ins_count)=target;
    return 0;
}
int data(FILE *fp)
{
    return 0;
}
int bss(FILE *fp)
{
    return 0;
}
int symtab(FILE *fp,list_node* root)
{
    sym_num++;
    Elf32_Sym* sym_set=malloc(sizeof(Elf32_Sym)*sym_num);

    symtab_list *my_symtab = new_symtab(0,0,0,0,0);
    get_symtab(my_symtab, root);
    symtab_list *cur=my_symtab;

//    FILE* debug;
//    debug = freopen("./debug.txt","w",stdin);

    unsigned int pos=0;
    (sym_set+pos)->st_name=0x00;		/* Symbol name (string tbl index) */
    (sym_set+pos)->st_value=0x00;		/* Symbol value */
    (sym_set+pos)->st_size=0x00;		/* Symbol size */
    (sym_set+pos)->st_info=0x00;		/* Symbol type and binding */
    (sym_set+pos)->st_other=0x00;		/* Symbol visibility */
    (sym_set+pos)->st_shndx=0x00;		/* Section index */
    pos++;

    while(cur->next!=NULL){
        cur=cur->next;

        (sym_set+pos)->st_name=cur->st_name;		/* Symbol name (string tbl index) */
        (sym_set+pos)->st_value=cur->st_value;		/* Symbol value */
        (sym_set+pos)->st_size=cur->st_size;		/* Symbol size */
        (sym_set+pos)->st_info=cur->st_info;		/* Symbol type and binding */
        (sym_set+pos)->st_other=0x00;		/* Symbol visibility */
        (sym_set+pos)->st_shndx=cur->st_shndx;		/* Section index */
//        fprintf(debug,"%d ",pos);

        pos++;
    }

//    fclose(debug);
    char* sym_set_char=(char*)sym_set;
    for(int i=0;i<sizeof(Elf32_Sym)*sym_num;i++)
        fprintf(fp,"%c",sym_set_char[i]);

    return 0;
}
int get_symtab(symtab_list* my_symtab,list_node* root)
{
//    FILE* debug;
//    debug = freopen("./debug.txt","w",stdin);
    symtab_list* cur_symtab=my_symtab;
    list_node* cur0=root;
    Elf32_Word pos=1;
    while(cur0!=NULL)
    {
        list_node* cur1=cur0->child;
        while(cur1!=NULL)
        {
            if(strcmp(cur1->s,"PSEUDO")==0)
            {
                list_node* cur2=cur1->child;
                switch(cur2->pseu)
                {
                    case PS_FILE:
                        cur_symtab->next= new_symtab(pos,0,0,0x4,0xfff1);
                        pos=pos+strlen(cur2->pseu_extend->s)+1;
                        cur_symtab=cur_symtab->next;
                        break;
                    case PS_GLOBAL:
                        cur_symtab->next=new_symtab(pos,0,0x1c,0x12,0x1);
                        pos=pos+strlen(cur2->pseu_extend->s)+1;
                        cur_symtab=cur_symtab->next;
                        break;
                    default:
                        break;
                }
            }
            cur1=cur1->next;
        }
        cur0=cur0->next;
    }
    return 0;
}
int strtab(FILE *fp,list_node* root)
{
    char* str_set;
    unsigned int len=1;

    strtab_list *my_strtab = new_strtab(NULL);
    get_strtab(my_strtab, root);

//    FILE* debug;
//    debug = freopen("./debug.txt","w",stdin);

    strtab_list *cur=my_strtab;
    while(cur->next!=NULL){
        cur=cur->next;
        len += strlen(cur->s);
        len++;
    }
//    fprintf(debug,"%d",len);
//    fclose(debug);
    strtab_len=len;

    str_set=malloc(sizeof(char)*len);
    memcpy(str_set,"\000",1);
    cur=my_strtab;
    unsigned int pos=1;
    while(cur->next!=NULL){
        cur=cur->next;
        strcpy(str_set+pos,cur->s);
        pos += strlen(cur->s);
        memcpy(str_set+pos+1,"\000",1);
        pos++;
    }

    for(int i=0;i<len;i++)
        fprintf(fp,"%c",str_set[i]);
    return 0;
}
int get_strtab(strtab_list* my_strtab,list_node* root)
{
    strtab_list* cur_strtab=my_strtab;
    list_node* cur0=root;
    while(cur0!=NULL)
    {
        list_node* cur1=cur0->child;
        while(cur1!=NULL)
        {
            if(strcmp(cur1->s,"PSEUDO")==0)
            {
                list_node* cur2=cur1->child;
                switch(cur2->pseu)
                {
                    case PS_FILE:
                    case PS_GLOBAL:
                        cur_strtab->next=new_strtab(cur2->pseu_extend->s);
                        cur_strtab=cur_strtab->next;
                        break;
                    default:
                        break;
                }
            }
            cur1=cur1->next;
        }
        cur0=cur0->next;
    }
    return 0;
}
int shstrtab(FILE *fp)
{
    char* shstr_set=malloc(sizeof(char)*44);
    memcpy(shstr_set,"\000.symtab\000.strtab\000.shstrtab\000.text\000.data\000.bss\000",44);
    for(int i=0;i<sizeof(char)*44;i++)
        fprintf(fp,"%c",shstr_set[i]);
    return 0;
}
int section_header_table(FILE *fp,int sect_num)
{
    Elf32_Shdr* shdr_set=malloc(sizeof(Elf32_Shdr)*sect_num);
    Elf32_Off hd_off=0x00000034;
    Elf32_Word ins_size=ins_num*4;
    Elf32_Word sym_size=sym_num*sizeof(Elf32_Sym);

    int pos=0;
    //NULL
    (shdr_set+pos)->sh_name=0x00000000;		/* Section name (string tbl index) */
    (shdr_set+pos)->sh_type=0x00000000;		/* Section type */
    (shdr_set+pos)->sh_flags=0x00000000;		/* Section flags */
    (shdr_set+pos)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+pos)->sh_offset=0x00000000;		/* Section file offset */
    (shdr_set+pos)->sh_size=0x00000000;		/* Section size in bytes */
    (shdr_set+pos)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+pos)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+pos)->sh_addralign=0x00000000;	/* Section alignment */
    (shdr_set+pos)->sh_entsize=0x00000000;		/* Entry size if section holds table */
    pos++;

    //.text
    (shdr_set+pos)->sh_name=0x0000001b;		/* Section name (string tbl index) */
    (shdr_set+pos)->sh_type=0x00000001;		/* Section type */
    (shdr_set+pos)->sh_flags=0x00000006;		/* Section flags */
    (shdr_set+pos)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+pos)->sh_offset=hd_off;		/* Section file offset */
    (shdr_set+pos)->sh_size=ins_size;		/* Section size in bytes */
    (shdr_set+pos)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+pos)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+pos)->sh_addralign=0x00000004;	/* Section alignment */
    (shdr_set+pos)->sh_entsize=0x00000000;		/* Entry size if section holds table */
    pos++;

    //.data
    (shdr_set+pos)->sh_name=0x00000021;		/* Section name (string tbl index) */
    (shdr_set+pos)->sh_type=0x00000001;		/* Section type */
    (shdr_set+pos)->sh_flags=0x00000003;		/* Section flags */
    (shdr_set+pos)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+pos)->sh_offset=(shdr_set+pos-1)->sh_offset+(shdr_set+pos-1)->sh_size;		/* Section file offset */
    (shdr_set+pos)->sh_size=0x00000000;		/* Section size in bytes */
    (shdr_set+pos)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+pos)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+pos)->sh_addralign=0x00000001;	/* Section alignment */
    (shdr_set+pos)->sh_entsize=0x00000000;		/* Entry size if section holds table */
    pos++;

    //.bss
    (shdr_set+pos)->sh_name=0x00000027;		/* Section name (string tbl index) */
    (shdr_set+pos)->sh_type=0x00000008;		/* Section type */
    (shdr_set+pos)->sh_flags=0x00000003;		/* Section flags */
    (shdr_set+pos)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+pos)->sh_offset=(shdr_set+pos-1)->sh_offset+(shdr_set+pos-1)->sh_size;		/* Section file offset */
    (shdr_set+pos)->sh_size=0x00000000;		/* Section size in bytes */
    (shdr_set+pos)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+pos)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+pos)->sh_addralign=0x00000001;	/* Section alignment */
    (shdr_set+pos)->sh_entsize=0x00000000;		/* Entry size if section holds table */
    pos++;

    //.symtab
    (shdr_set+pos)->sh_name=0x00000001;		/* Section name (string tbl index) */
    (shdr_set+pos)->sh_type=0x00000002;		/* Section type */
    (shdr_set+pos)->sh_flags=0x00000000;		/* Section flags */
    (shdr_set+pos)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+pos)->sh_offset=(shdr_set+pos-1)->sh_offset+(shdr_set+pos-1)->sh_size;		/* Section file offset */
    (shdr_set+pos)->sh_size=sym_size;		/* Section size in bytes */
    (shdr_set+pos)->sh_link=0x00000005;		/* Link to another section */
    (shdr_set+pos)->sh_info=0x00000003;		/* Additional section information */
    (shdr_set+pos)->sh_addralign=0x00000004;	/* Section alignment */
    (shdr_set+pos)->sh_entsize=0x00000010;		/* Entry size if section holds table */
    pos++;

    //.strtab
    (shdr_set+pos)->sh_name=0x00000009;		/* Section name (string tbl index) */
    (shdr_set+pos)->sh_type=0x00000003;		/* Section type */
    (shdr_set+pos)->sh_flags=0x00000000;		/* Section flags */
    (shdr_set+pos)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+pos)->sh_offset=(shdr_set+pos-1)->sh_offset+(shdr_set+pos-1)->sh_size;		/* Section file offset */
    (shdr_set+pos)->sh_size=strtab_len;		/* Section size in bytes */
    (shdr_set+pos)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+pos)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+pos)->sh_addralign=0x00000001;	/* Section alignment */
    (shdr_set+pos)->sh_entsize=0x00000000;		/* Entry size if section holds table */
    pos++;

    //.shstrtab
    (shdr_set+pos)->sh_name=0x00000011;		/* Section name (string tbl index) */
    (shdr_set+pos)->sh_type=0x00000003;		/* Section type */
    (shdr_set+pos)->sh_flags=0x00000000;		/* Section flags */
    (shdr_set+pos)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+pos)->sh_offset=(shdr_set+pos-1)->sh_offset+(shdr_set+pos-1)->sh_size;		/* Section file offset */
    (shdr_set+pos)->sh_size=0x0000002c;		/* Section size in bytes */
    (shdr_set+pos)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+pos)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+pos)->sh_addralign=0x00000001;	/* Section alignment */
    (shdr_set+pos)->sh_entsize=0x00000000;		/* Entry size if section holds table */
    pos++;

    char* shdr_set_char=(char*)shdr_set;
    for(int i=0;i<sizeof(Elf32_Shdr)*sect_num;i++)
        fprintf(fp,"%c",shdr_set_char[i]);
    return 0;
}

// test_to_hex() is a test hex converter literally written by hand
// and it is ONLY a test for the file "00_main.s", which means it is just
// an example rather than some real method to do hex-conversion.
int test_to_hex(FILE *fp)
{
    test_elf_header(fp);
    test_text(fp);
    test_data(fp);
    test_bss(fp);
    test_symtab(fp);
    test_strtab(fp);
    test_shstrtab(fp);
    test_section_header_table(fp);
    return 0;
}
int test_elf_header(FILE *fp)
{
    Elf32_Ehdr* header= malloc(sizeof (Elf32_Ehdr));
    memcpy(header->e_ident,"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0",16);   /* Magic number and other info */
    header->e_type=0x0001;   /* Object file type */
    header->e_machine=0x0028;    /* Architecture */
    header->e_version=0x00000001;    /* Object file version */
    header->e_entry=0x00000000;  /* Entry point virtual address */
    header->e_phoff=0x00000000; 	/* Program header table file offset */
    header->e_shoff=0x000000cf;		/* Section header table file offset */
    header->e_flags=0x05000000;		/* Processor-specific flags */
    header->e_ehsize=0x0034;		/* ELF header size in bytes */
    header->e_phentsize=0x0000;		/* Program header table entry size */
    header->e_phnum=0x0000;		/* Program header table entry count */
    header->e_shentsize=0x0028;		/* Section header table entry size */
    header->e_shnum=0x0007;		/* Section header table entry count */
    header->e_shstrndx=0x0006;		/* Section header string table index */

    char* header_char=(char*)header;
    for(int i=0;i<sizeof(Elf32_Ehdr);i++)
        fprintf(fp,"%c",header_char[i]);
    return 0;
}
int test_text(FILE *fp)
{
    Elf32_Word* instruction_set=malloc(sizeof(Elf32_Word)*7);
    *instruction_set=0xe52db004;
    *(instruction_set+1)=0xe28db000;
    *(instruction_set+2)=0xe3a03000;
    *(instruction_set+3)=0xe1a00003;
    *(instruction_set+4)=0xe28bd000;
    *(instruction_set+5)=0xe49db004;
    *(instruction_set+6)=0xe12fff1e;
    char* text_char=(char*)instruction_set;
    for(int i=0;i<sizeof(Elf32_Word)*7;i++)
        fprintf(fp,"%c",text_char[i]);
    return 0;
}
int test_data(FILE *fp)
{
    return 0;
}
int test_bss(FILE *fp)
{
    return 0;
}
int test_symtab(FILE *fp)
{
    Elf32_Sym* sym_set=malloc(sizeof(Elf32_Sym)*4);

    sym_set->st_name=0x00000000;		/* Symbol name (string tbl index) */
    sym_set->st_value=0x00000000;		/* Symbol value */
    sym_set->st_size=0x00000000;		/* Symbol size */
    sym_set->st_info=0x00;		/* Symbol type and binding */
    sym_set->st_other=0x00;		/* Symbol visibility */
    sym_set->st_shndx=0x0000;		/* Section index */

    (sym_set+1)->st_name=0x00000001;		/* Symbol name (string tbl index) */
    (sym_set+1)->st_value=0x00000000;		/* Symbol value */
    (sym_set+1)->st_size=0x00000000;		/* Symbol size */
    (sym_set+1)->st_info=0x04;		/* Symbol type and binding */
    (sym_set+1)->st_other=0x00;		/* Symbol visibility */
    (sym_set+1)->st_shndx=0xfff1;		/* Section index */

    (sym_set+2)->st_name=0x0000000b;		/* Symbol name (string tbl index) */
    (sym_set+2)->st_value=0x00000000;		/* Symbol value */
    (sym_set+2)->st_size=0x00000000;		/* Symbol size */
    (sym_set+2)->st_info=0x00;		/* Symbol type and binding */
    (sym_set+2)->st_other=0x00;		/* Symbol visibility */
    (sym_set+2)->st_shndx=0x0001;		/* Section index */

    (sym_set+3)->st_name=0x0000000e;		/* Symbol name (string tbl index) */
    (sym_set+3)->st_value=0x00000000;		/* Symbol value */
    (sym_set+3)->st_size=0x0000001c;		/* Symbol size */
    (sym_set+3)->st_info=0x12;		/* Symbol type and binding */
    (sym_set+3)->st_other=0x00;		/* Symbol visibility */
    (sym_set+3)->st_shndx=0x0001;		/* Section index */

    char* sym_set_char=(char*)sym_set;
    for(int i=0;i<sizeof(Elf32_Sym)*4;i++)
        fprintf(fp,"%c",sym_set_char[i]);
    return 0;
}
int test_strtab(FILE *fp)
{
    char* str_set=malloc(sizeof(char)*19);
    memcpy(str_set,"\00000_main.c\000$a\000main\000",19);
    for(int i=0;i<sizeof(char)*19;i++)
        fprintf(fp,"%c",str_set[i]);
    return 0;
}
int test_shstrtab(FILE *fp)
{
    char* shstr_set=malloc(sizeof(char)*44);
    memcpy(shstr_set,"\000.symtab\000.strtab\000.shstrtab\000.text\000.data\000.bss\000",44);
    for(int i=0;i<sizeof(char)*44;i++)
        fprintf(fp,"%c",shstr_set[i]);
    return 0;
}
int test_section_header_table(FILE *fp)
{
    Elf32_Shdr* shdr_set=malloc(sizeof(Elf32_Shdr)*7);

    shdr_set->sh_name=0x00000000;		/* Section name (string tbl index) */
    shdr_set->sh_type=0x00000000;		/* Section type */
    shdr_set->sh_flags=0x00000000;		/* Section flags */
    shdr_set->sh_addr=0x00000000;		/* Section virtual addr at execution */
    shdr_set->sh_offset=0x00000000;		/* Section file offset */
    shdr_set->sh_size=0x00000000;		/* Section size in bytes */
    shdr_set->sh_link=0x00000000;		/* Link to another section */
    shdr_set->sh_info=0x00000000;		/* Additional section information */
    shdr_set->sh_addralign=0x00000000;	/* Section alignment */
    shdr_set->sh_entsize=0x00000000;		/* Entry size if section holds table */

    (shdr_set+1)->sh_name=0x0000001b;		/* Section name (string tbl index) */
    (shdr_set+1)->sh_type=0x00000001;		/* Section type */
    (shdr_set+1)->sh_flags=0x00000006;		/* Section flags */
    (shdr_set+1)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+1)->sh_offset=0x00000034;		/* Section file offset */
    (shdr_set+1)->sh_size=0x0000001c;		/* Section size in bytes */
    (shdr_set+1)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+1)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+1)->sh_addralign=0x00000004;	/* Section alignment */
    (shdr_set+1)->sh_entsize=0x00000000;		/* Entry size if section holds table */

    (shdr_set+2)->sh_name=0x00000021;		/* Section name (string tbl index) */
    (shdr_set+2)->sh_type=0x00000001;		/* Section type */
    (shdr_set+2)->sh_flags=0x00000003;		/* Section flags */
    (shdr_set+2)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+2)->sh_offset=0x00000050;		/* Section file offset */
    (shdr_set+2)->sh_size=0x00000000;		/* Section size in bytes */
    (shdr_set+2)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+2)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+2)->sh_addralign=0x00000001;	/* Section alignment */
    (shdr_set+2)->sh_entsize=0x00000000;		/* Entry size if section holds table */

    (shdr_set+3)->sh_name=0x00000027;		/* Section name (string tbl index) */
    (shdr_set+3)->sh_type=0x00000008;		/* Section type */
    (shdr_set+3)->sh_flags=0x00000003;		/* Section flags */
    (shdr_set+3)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+3)->sh_offset=0x00000050;		/* Section file offset */
    (shdr_set+3)->sh_size=0x00000000;		/* Section size in bytes */
    (shdr_set+3)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+3)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+3)->sh_addralign=0x00000001;	/* Section alignment */
    (shdr_set+3)->sh_entsize=0x00000000;		/* Entry size if section holds table */

    (shdr_set+4)->sh_name=0x00000001;		/* Section name (string tbl index) */
    (shdr_set+4)->sh_type=0x00000002;		/* Section type */
    (shdr_set+4)->sh_flags=0x00000000;		/* Section flags */
    (shdr_set+4)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+4)->sh_offset=0x00000050;		/* Section file offset */
    (shdr_set+4)->sh_size=0x00000040;		/* Section size in bytes */
    (shdr_set+4)->sh_link=0x00000005;		/* Link to another section */
    (shdr_set+4)->sh_info=0x00000003;		/* Additional section information */
    (shdr_set+4)->sh_addralign=0x00000004;	/* Section alignment */
    (shdr_set+4)->sh_entsize=0x00000010;		/* Entry size if section holds table */

    (shdr_set+5)->sh_name=0x00000009;		/* Section name (string tbl index) */
    (shdr_set+5)->sh_type=0x00000003;		/* Section type */
    (shdr_set+5)->sh_flags=0x00000000;		/* Section flags */
    (shdr_set+5)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+5)->sh_offset=0x00000090;		/* Section file offset */
    (shdr_set+5)->sh_size=0x00000013;		/* Section size in bytes */
    (shdr_set+5)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+5)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+5)->sh_addralign=0x00000001;	/* Section alignment */
    (shdr_set+5)->sh_entsize=0x00000000;		/* Entry size if section holds table */

    (shdr_set+6)->sh_name=0x00000011;		/* Section name (string tbl index) */
    (shdr_set+6)->sh_type=0x00000003;		/* Section type */
    (shdr_set+6)->sh_flags=0x00000000;		/* Section flags */
    (shdr_set+6)->sh_addr=0x00000000;		/* Section virtual addr at execution */
    (shdr_set+6)->sh_offset=0x000000a3;		/* Section file offset */
    (shdr_set+6)->sh_size=0x0000002c;		/* Section size in bytes */
    (shdr_set+6)->sh_link=0x00000000;		/* Link to another section */
    (shdr_set+6)->sh_info=0x00000000;		/* Additional section information */
    (shdr_set+6)->sh_addralign=0x00000001;	/* Section alignment */
    (shdr_set+6)->sh_entsize=0x00000000;		/* Entry size if section holds table */

    char* shdr_set_char=(char*)shdr_set;
    for(int i=0;i<sizeof(Elf32_Shdr)*7;i++)
        fprintf(fp,"%c",shdr_set_char[i]);
    return 0;
}