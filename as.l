/*
 * Author: Henry Liang
 * Date: 6/9/2021
 */

%{
#include "list.h"
#include "as.tab.h"
#include <math.h>
#include <string.h>
int cur_line_num = 1;
char* save_id(const char* source);
void lex_error(char* msg, int line);
void count();
%}

SINGLE_COMMENT      ("@"[^\n]*)
REG                 ([r][0-9]*)
LABEL               ([._%a-zA-Z][-_a-zA-Z0-9]*)
NUMBER              ("0"|[1-9][0-9]*)
STRING              (\042[^\042\n]*\042)
UNTERM_STRING       (\042[^\042\n]*)

%%
".cpu"              { count(); return(PSEUDO_CPU);}
".eabi_attribute"   { count(); return(PSEUDO_EABI_ATTR);}
".file"             { count(); return(PSEUDO_FILE);}
".text"             { count(); return(PSEUDO_TEXT);}
".align"           { count(); return(PSEUDO_ALIGN);}
".global"         { count(); return(PSEUDO_GLOBAL);}
".arch"             { count(); return(PSEUDO_ARCH);}
".syntax"         { count(); return(PSEUDO_SYNTAX);}
".arm"               { count(); return(PSEUDO_ARM);}
".fpu"               { count(); return(PSEUDO_FPU);}
".type"             { count(); return(PSEUDO_TYPE);}
".size"             { count(); return(PSEUDO_SIZE);}
".ident"           { count(); return(PSEUDO_IDENT);}
"add"               { count(); return(ADD);}
"and"               { count(); return(AND);}
"asr"               { count(); return(ASR);}
"b"       { count(); return(B);}
"beq"     { count(); return(BEQ);}
"bge"     { count(); return(BGE);}
"bgt"     { count(); return(BGT);}
"ble"     { count(); return(BLE);}
"blt"     { count(); return(BLT);}
"bne"     { count(); return(BNE);}
"bx"                { count(); return(BX);}
"mov"               { count(); return(MOV);}
"str"               { count(); return(STR);}
"ldr"               { count(); return(LDR);}
"fp"                { count(); return(FP);}
"sp"                { count(); return(SP);}
"lr"                { count(); return(LR);}
"ip"                { count(); return(IP);}
","			{ count(); return(','); }
"#"			{ count(); return('#'); }
":"			{ count(); return(':'); }
"="			{ count(); return('='); }
"("			{ count(); return('('); }
")"			{ count(); return(')'); }
"["	        { count(); return('['); }
"]"		    { count(); return(']'); }
"&"			{ count(); return('&'); }
"!"			{ count(); return('!'); }
"~"			{ count(); return('~'); }
"-"			{ count(); return('-'); }
"+"			{ count(); return('+'); }
"*"			{ count(); return('*'); }
"/"			{ count(); return('/'); }
"%"			{ count(); return('%'); }
"<"			{ count(); return('<'); }
">"			{ count(); return('>'); }
"^"			{ count(); return('^'); }
"|"			{ count(); return('|'); }
"?"			{ count(); return('?'); }
[ \t\v\f]		{ count(); }
[\n]                { count(); cur_line_num++;                       }
{SINGLE_COMMENT}    { /* skip for single line comment */    }
{NUMBER}            { count(); yylval.v_int = atoi(yytext); return NUMBER;        }
{STRING}            { count(); yylval.v_string = save_id(yytext); return STRING;          }
{REG}               { count(); yylval.v_string = save_id(yytext); return REG;      }
{LABEL}             { count(); yylval.v_string = save_id(yytext); return LABEL;      }
<<EOF>>             { return 0;                 }
{UNTERM_STRING}     { lex_error("Unterminated string constant", cur_line_num);  }
.                   { lex_error("Unrecognized character", cur_line_num);        }

%%
char* save_id(const char* source)
{
    int len=0;
    while(source[len]!='\0')
        len++;
    char* des = (char*)malloc(len+1);
    for(int i=0;i<len;i++)
    {
        des[i] = source[i];
    }
    des[len]='\0';
    return des;
}

void lex_error(char* msg, int line) {
    printf("\nError at line %-3d: %s\n\n", line, msg);
}

int yywrap(void) {
    return 1;
}

int column = 0;

void count()
{
	int i;

	for (i = 0; yytext[i] != '\0'; i++)
		if (yytext[i] == '\n')
			column = 0;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;

	ECHO;
}