/*
 * Author: Henry Liang
 * Date: 11/20/2020
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "list.h"

list_node* new_node()
{
    list_node* new_node = (list_node *)malloc(sizeof(list_node));
    if(new_node == NULL)
    {
        printf("run out of memory.\n");
        exit(0);
    }
    memset(new_node, 0, sizeof(list_node));
    return new_node;
}

int show_list(list_node* root, int nest)
{
    list_node* cur=root;
    while(cur!=NULL)
    {
        switch(nest) {
            case 0:
                printf("%s\n", cur->s);
                break;
            case 1:
                printf("\t%s\n", cur->s);
                break;
            case 2:
                cur->s==NULL ? printf("\t\t%d\n", cur->i) : printf("\t\t%s\n", cur->s);
                break;
            default:
                break;
        }
        if(cur->child!=NULL) show_list(cur->child,nest+1);
        cur=cur->next;
    }
    return 0;
}

