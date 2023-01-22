#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

struct int_array
{
    int *data;
    int len;
};

typedef struct int_array int_array;

int_array *array_create(int len, int x)
{
    // On alloue le stockage pour la struct
    int_array *t = malloc(sizeof(int_array));
    // Et le stockage pour les données
    int *data = malloc(len * sizeof(int));
    for (int i = 0; i < len; i++)
    {
        data[i] = x;
    }
    t->len = len;
    t->data = data;
    return t;
}

struct int_dynarray
{
    int len;
    int capacity;
    int *data;
};

typedef struct int_dynarray int_dynarray;

// Ex1
int array_get(int_array *t, int i);
void array_set(int_array *t, int i, int x);
void array_delete(int_array *t);

// Ex2.1
int lenght(int_dynarray *t);
int_dynarray *make_empty(void);
int get(int_dynarray *t, int i);
void set(int_dynarray *t, int i, int x);
int pop(int_dynarray *t);
void resize(int_dynarray *t, int new_capacity);
void push(int_dynarray *t, int x);
void delete(int_dynarray *t);

// Ex2.3
void push(int_dynarray *t, int x);

// Ex2.5
int pop2(int_dynarray *t);

// Ex2.6
int pop3(int_dynarray *t);

// Ex2.7
void insert_at(int_dynarray *t, int i, int x);
int extract_at(int_dynarray *t, int i);

// Ex3
int position(int_dynarray *t, int x);