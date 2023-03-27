#include "listes-doublement-chainees.h"

// Partie I

int delete_node_1(node *n)
{
    (n->prev)->next = n->next;
    (n->next)->prev = n->prev;
    return 1;
}

int insert_before_1(node *p, int x)
{
    node *n = new_node(x);
    (p->prev)->next = n;
    p->prev = n;
    return 1;
}

int insert_after_1(node *p, int x)
{
    node *n = new_node(x);
    (p->next)->prev = n;
    p->next = n;
    return 1;
}

// 4 ?

// Partie II

dll *new_dll(void)
{
    dll *d = malloc(sizeof(dll));
    return d;
}

int delete_node(node *n)
{
    (n->prev)->next = n->next;
    (n->next)->prev = n->prev;
    return 1;
}

node *insert_before(node *p, int x)
{
    node *n = new_node(x);
    (p->prev)->next = n;
    p->prev = n;
    return n;
}

node *insert_after(node *p, int x)
{
    node *n = new_node(x);
    (p->next)->prev = n;
    p->next = n;
    return n;
}

int free_dll(dll *d)
{
    node *first = d->sentinelle;
    node *next = first->next;
    while (next != first)
    {
        next = next->next;
        free(next(prev));
    }
    free(d);
    free(first) return 1;
}

void push_left(dll *d, int x)
{
    node *n = new_node(x);
    (d->prev)->next = n;
    d->prev = n;
    d = n;
}

void push_right(dll *d, int x)
{
    node *n = new_node(x);
    (d->prev)->next = n;
    d->prev = n;
}

int pop_left(dll *d)
{
    int x = d->value;
    node *end = d->prev;
    end->next = d->next;
    d = d->next;
    free(d->prev);
    d->prev = end;
    return x;
}

int pop_right(dll *d)
{
    int x = (d->prev)->value;
    node *end = (d->prev)->prev;
    free(d->prev);
    d->prev = end;
    end->next = d;
    return x;
}

dll *from_array(int t[], int len)
{
    dll *d = new_dll();
    for (int i = 0; i < len; i++)
    {
        push_right(d, t[i]);
    }
    return d;
}

int main()
{
    return 1;
}