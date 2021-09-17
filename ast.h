/*
 * Author: Henry Liang
 * Date: 11/20/2020
 */

#ifndef AST_H
#define AST_H

typedef struct _ast ast;
struct _ast
{
    int value_int;
    char* value_string;
	char* node_type;
    ast* left;
    ast* right;
};


#endif