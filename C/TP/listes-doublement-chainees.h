#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

struct node
{
  int value;
  struct node *prev;
  struct node *next;
};
typedef struct node node;

struct dll_1
{
  node *start;
  node *end;
};
typedef struct dll_1 dll_1;

node *new_node(int x)
{
  node *n = malloc(sizeof(node));
  n->value = x;
  n->next = NULL;
  n->prev = NULL;
  return n;
};

dll_1 *new_dll_1(void)
{
  dll_1 *d = malloc(sizeof(dll_1));
  d->start = NULL;
  d->end = NULL;
  return d;
};

int delete_node_1(node *n);
int insert_before_1(node *n, int x);
int insert_after_1(node *n, int x);

struct DLL
{
  struct Node *sentinel;
};
typedef struct DLL dll;

dll *new_dll(void);
int delete_node(node *n);
node *insert_before(node *n, int x);
node *insert_after(node *n, int x);
int free_dll(dll *d);

void push_left(dll *d, int x);
void push_right(dll *d, int x);
int pop_left(dll *d);
int pop_right(dll *d);
dll *from_array(int t[], int len);