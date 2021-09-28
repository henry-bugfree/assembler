/*
 * Author: Henry Liang
 * Date: 11/20/2020
 */

#ifndef LIST_H
#define LIST_H

typedef struct _list_node list_node;
struct _list_node
{
    char* s;
    int i;
    list_node* next;
    list_node* child;
};

#endif