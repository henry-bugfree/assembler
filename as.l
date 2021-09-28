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
LABEL               ([._a-zA-Z][_a-zA-Z0-9]*":")
REG                 ([r][0-9]*)
PSEUDO              ([.][_a-zA-Z][_a-zA-Z0-9]*[^\n]*)
NUMBER              ("0"|[1-9][0-9]*)
STRING              (\042[^\042\n]*\042)
UNTERM_STRING       (\042[^\042\n]*)

%%

"add"               { count(); return(ADD);}
"mov"               { count(); return(MOV);}
"str"               { count(); return(STR);}
"ldr"               { count(); return(LDR);}
"bx"                { count(); return(BX);}
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
{STRING}            { count(); return STRING_LITERAL;          }
{REG}               { count(); yylval.v_string = save_id(yytext); return REG;      }
{LABEL}             { count(); yylval.v_string = save_id(yytext); return LABEL;      }
{PSEUDO}            { count(); yylval.v_string = save_id(yytext); return PSEUDO;      }
<<EOF>>             { return 0;                 }
{UNTERM_STRING}     { lex_error("Unterminated string constant", cur_line_num);  }
.                   { lex_error("Unrecognized character", cur_line_num);        }

%%
char* save_id(const char* source)
{
    char* des = (char*)malloc(sizeof(source));
    for(int i=0;i<sizeof(source);i++)
    {
        des[i] = source[i];
    }
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