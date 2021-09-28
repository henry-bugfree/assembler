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