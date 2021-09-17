/*
 * Author: Henry Liang
 * Created Date: 13/9/2021
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>
extern int yyparse(void);

int main(int argc, char* argv[])
{
    FILE* input;
    input = freopen("./arm_testcase/00_main.s","r",stdin);
    yyparse();
    return 0;
}
