#include "TP3.h"

// Ex1.1
int array_get(int_array *t, int i)
{
    int l = t->len;
    assert(i < l);
    int *a = t->data;
    return a[i];
}

// Ex1.2
void array_set(int_array *t, int i, int x)
{
    int l = t->len;
    assert(i < l);
    t->data[i] = x;
}

// Ex1.3
void array_delete(int_array *t)
{
    free(t->data);
}

// Ex2.1.1
int lenght(int_dynarray *t)
{
    int l = t->len;
    return l;
}

// Ex2.1.2
int_dynarray *make_empty(void)
{
    int_dynarray t = {.len = 0,
                      .capacity = 0,
                      .data = NULL};
    return &t;
}

// Ex2.1.3
int get(int_dynarray *t, int i)
{
    int l = t->len;
    assert(i < l);
    int *a = t->data;
    return a[i];
}

void set(int_dynarray *t, int i, int x)
{
    int l = t->len;
    assert(i < l);
    t->data[i] = x;
}

// Ex2.1.4
int pop(int_dynarray *t)
{
    int l = t->len;
    int a = t->data[l - 1];
    t->len = l - 1;
    return a;
}

// Ex2.1.5
void resize(int_dynarray *t, int new_capacity)
{
    t->capacity = new_capacity;
}

// Ex2.1.6
void push(int_dynarray *t, int x)
{
    int l = t->len;
    int c = t->capacity;
    if (c == l)
    {
        c++;
        resize(&t, c);
        int a[11];
        for (int i = 0; i < l; i++)
        {
            a[i] = t->data[i];
            // printf("%d\n", (t->data)[0]);
        }
        a[l - 1] = x;
        l++;
        t->len = l;
        t->data = &a;
    }
    else
    {
        t->len = l + 1;
        t->data[l] = x;
    }
}

// Ex2.1.7
void delete(int_dynarray *t)
{
    free(t->data);
    t->len = 0;
    t->capacity = 0;
}

// Ex2.2
/*
Initialisation du tableau : 4 opérations (1 par élément + retour du pointeur)
Opération push : 3 (initialisation des variables + comparaison) + 8 (opérations dans la condition sans la boucle) + 3n (opérations dans la boucle + indentation + comparaison)
Total : 3n + 15 -> O(n)
*/

// Ex2.3
void push(int_dynarray *t, int x)
{
    int l = t->len;
    int c = t->capacity;
    if (c == l)
    {
        resize(&t, 2 * c);
        int a[11];
        for (int i = 0; i < l; i++)
        {
            a[i] = t->data[i];
            // printf("%d\n", (t->data)[0]);
        }
        a[l - 1] = x;
        l++;
        t->len = l;
        t->data = &a;
    }
    else
    {
        t->len = l + 1;
        t->data[l] = x;
    }
}

// Ex2.5
int pop2(int_dynarray *t)
{
    int l = t->len;
    int c = t->capacity;
    int a = t->data[l - 1];
    t->len = l - 1;
    if (l < c / 2)
    {
        resize(&t, c / 2);
    }
    return a;
}

// Ex2.6
int pop3(int_dynarray *t)
{
    int l = t->len;
    int c = t->capacity;
    int a = t->data[l - 1];
    t->len = l - 1;
    if (l < c / 4)
    {
        resize(&t, c / 2);
    }
    return a;
}

// Ex2.7.1
void insert_at(int_dynarray *t, int i, int x)
{
    int l = t->len;
    int last = t->data[l - 1];
    push(&t, last);
    for (int j = l - 1; j > i; j++)
    {
        t->data[j] = t->data[j - 1];
    }
    t->data[i] = x;
}

// Ex2.7.3
int extract_at(int_dynarray *t, int i)
{
    int a = t->data[i];
    for (int j = i; j < (t->len) - 2; j++)
    {
        t->data[j] = t->data[j + 1];
    }
    pop(&t);
    return a;
}

// Ex3.1
int position(int_dynarray *t, int x)
{
    int l = t->len;
    int in[] = t->data;
    for (int i = 0; i < l; i++)
    {
        if (in[i] > x)
        {
            return i;
        }
    }
    return l;
}

int main()
{
    int a[] = {1, 4, 9, 21, 0, 3, 1, 8, 3, 9};
    int_dynarray t = {.len = 10,
                      .capacity = 13,
                      .data = &a};
    int l1 = lenght(&t);

    push(&t, 12);
    int l = t.data[10];
    int l2 = lenght(&t);
    printf("%d\n%d\n%d\n", l, l1, l2);
    return 0;
}
