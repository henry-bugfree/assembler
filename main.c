/*
 * Author: Henry Liang
 * Created Date: 13/9/2021
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "list.h"
#include "as.tab.h"
#include "to_hex.h"
extern list_node* list_root;

int main(int argc, char* argv[])
{
    FILE* input;
    input = freopen("./.s_testcase/00_main.s","r",stdin);
    //05_add
    yyparse();
//    printf("\nstructured data:\n");
//    show_list(list_root,0);
    fclose(input);

    FILE* fp;
    fp = fopen("./00_main.o", "wb");
    to_hex(fp,list_root);
//    test_to_hex(fp);
    fclose(fp);
    return 0;
}
