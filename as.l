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
char* save_string(const char* source);
void lex_error(char* msg, int line);
void count();
yytoken_kind_t process_label(char* lab);
%}

SINGLE_COMMENT      ("@"[^\n]*)
REG                 ([r][0-9]*)
LABEL               ([._%a-zA-Z][-_a-zA-Z0-9]*)
NUMBER              ("0"|[1-9][0-9]*)
STRING              (\042[^\042\n]*\042)
UNTERM_STRING       (\042[^\042\n]*)

%%
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
{STRING}            { count(); yylval.v_string = save_string(yytext); return STRING;          }
{REG}               { count(); yylval.v_string = save_id(yytext); return REG;      }
{LABEL}             { count(); yylval.v_string = save_id(yytext); return process_label(yylval.v_string);      }
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

char* save_string(const char* source)
{
    int len=1;
    while(source[len]!='"')
        len++;
    char* des = (char*)malloc(len);
    for(int i=0;i<len-1;i++)
    {
        des[i] = source[i+1];
    }
    des[len-1]='\0';
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

	//ECHO;
}

yytoken_kind_t process_label(char* lab)
{
    if(strcmp(lab,".cpu")==0) return PSEUDO_CPU;
    else if(strcmp(lab,".eabi_attribute")==0)   return PSEUDO_EABI_ATTR;
    else if(strcmp(lab,".file"          )==0)   return PSEUDO_FILE;
    else if(strcmp(lab,".text"          )==0)   return PSEUDO_TEXT;
    else if(strcmp(lab,".align"         )==0)   return PSEUDO_ALIGN;
    else if(strcmp(lab,".global"        )==0)   return PSEUDO_GLOBAL;
    else if(strcmp(lab,".arch"          )==0)   return PSEUDO_ARCH;
    else if(strcmp(lab,".syntax"        )==0)   return PSEUDO_SYNTAX;
    else if(strcmp(lab,".arm"           )==0)   return PSEUDO_ARM;
    else if(strcmp(lab,".fpu"           )==0)   return PSEUDO_FPU;
    else if(strcmp(lab,".type"          )==0)   return PSEUDO_TYPE;
    else if(strcmp(lab,".size"          )==0)   return PSEUDO_SIZE;
    else if(strcmp(lab,".ident"         )==0)   return PSEUDO_IDENT;
    else if(strcmp(lab,".comm"          )==0)   return PSEUDO_COMM;
    else if(strcmp(lab,".word"          )==0)   return PSEUDO_WORD;
    else if(strcmp(lab,"add"            )==0)   return ADD;
    else if(strcmp(lab,"sub"            )==0)   return SUB;
    else if(strcmp(lab,"and"            )==0)   return AND;
    else if(strcmp(lab,"bx"             )==0)   return BX;
    else if(strcmp(lab,"mov"            )==0)   return MOV;
    else if(strcmp(lab,"str"            )==0)   return STR;
    else if(strcmp(lab,"ldr"            )==0)   return LDR;
    else if(strcmp(lab,"fp"             )==0)   return FP;
    else if(strcmp(lab,"sp"             )==0)   return SP;
    else if(strcmp(lab,"lr"             )==0)   return LR;
    else if(strcmp(lab,"ip"             )==0)   return IP;
    return LABEL;
}