/*
 * Author: Henry Liang
 * Created Date: 13/9/2021
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "list.h"
extern int yyparse(void);
extern list_node* list_root;

int main(int argc, char* argv[])
{
    FILE* input;
    input = freopen("./.s_testcase/00_main.s","r",stdin);
    yyparse();
    printf("\nstructured data:\n\n");
    show_list(list_root,0);
    return 0;
}
