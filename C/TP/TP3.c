#include "TP3.h"

// Ex1.1
int array_get(int_array *t, int i)
{
    assert(i < t->len);
    int *a = t->data;
    return a[i];
}
/* 
int array_get(int_array *t, int i) {
    assert( 0 ̼< i && i < t->len);
    return t->data[i];
}
*/

// Ex1.2
void array_set(int_array *t, int i, int x)
{
    assert(i < t->len);
    t->data[i] = x;
}

/*
void array_set(int array *t, int i, int x) {
    assert(0 <= i && i < t->len);
    t->data[i] = x;
}
*/

// Ex1.3
void array_delete(int_array *t)
{
    free(t->data);
    free(t);
}

/*
void array_delete(int_array *t) {

}
*/

// Ex2.1.1
int lenght(int_dynarray *t)
{
    return t->len;
}

// Ex2.1.2
/*
int_dynarray *make_empty(void)
{
    int_dynarray t = {.len = 0,
                      .capacity = 0,
                      .data = NULL};
    return &t;
}
*/

int_dynarray *make_empty(void) {
    int_dynarray *t = malloc(sizeof(int_dynarray));
    t->len = 0;
    t->capacity = 0;
    t->data = NULL;
    return t;
}


// Ex2.1.3
int get(int_dynarray *t, int i)
{
    assert(i < t->len);
    int *a = t->data;
    return a[i];
}

void set(int_dynarray *t, int i, int x)
{
    assert(i < t->len);
    t->data[i] = x;
}

// Ex2.1.4
int pop(int_dynarray *t)
{
    int a = t->data[t->len - 1];
    t->len--;
    return a;
}

// Ex2.1.5
/*
void resize(int_dynarray *t, int new_capacity)
{
    t->capacity = new_capacity;
}
*/

void resize(int_dynarray *t, int new_capacity) {
    assert(t->len <= new_capacity);
    int *new_data = malloc(new_capacity * sizeof(int));
    for(int i = 0 ; i < t->len ; i++) {
        new_data[i] = t->data[i];
    }
    free(t->data);
    t->data = new_data;
    t->capacity = new_capacity;
}


// Ex2.1.6
/*
void push(int_dynarray *t, int x)
{
    if (t->capacity == t->len)
    {
        t->capacity++;
        resize(&t, t->capacity);
        int a[11];
        for (int i = 0; i < t->len; i++)
        {
            a[i] = t->data[i];
            // printf("%d\n", (t->data)[0]);
        }
        a[t->len - 1] = x;
        t->len++;
        t->data = &a;
    }
    else
    {
        t->len++;
        t->data[t->len-1] = x;
    }
}
*/
void push(int_dynarray *t, int x) {
    if(t->len == t->capacity) {
        resize(t, 1 + t->capacity);
    }
    t->data[t->len] = x;
    t->len++;
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
void push2(int_dynarray *t, int x)
{
    if (t->capacity == t->len)
    {
        if(t->capacity != 0) {
            resize(t, 2 * t->capacity);
        } else {
            resize(t, 1);
        }
    }
    t->data[t->len] = x;
    t->len++;
}

// Ex2.5
int pop2(int_dynarray *t)
{
    int a = t->data[t->len - 1];
    t->len--;
    if (t->len < t->capacity / 2)
    {
        resize(t, t->capacity / 2);
    }
    return a;
}

// Ex2.6
int pop3(int_dynarray *t)
{
    int a = t->data[t->len- 1];
    t->len--;
    if (t->len < t->capacity / 4)
    {
        resize(t, t->capacity / 2);
    }
    return a;
}

// Ex2.7.1
void insert_at(int_dynarray *t, int i, int x)
{
    int l = t->len;
    int last = t->data[l - 1];
    push(t, last);
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
    pop(t);
    return a;
}

// Ex3.1
/*
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
} */

int main()
{
    int_dynarray *t = make_empty();
    int c1 = t->capacity;
    push2(t, 34);
    int c2 = t->capacity;
    int l2 = t->len;
    int a = t->data[l2-1];
    printf("%d\n%d\n%d\n%d\n",c1,c2,l2,a);
}
