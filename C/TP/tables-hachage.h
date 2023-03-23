#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

typedef u_int32_t T;

const u_int8_t empty = 0;
const u_int8_t occupied = 1;

struct bucket
{
    // u_int8_t status;
    int status;
    T element;
};
typedef struct bucket bucket;

struct set
{
    int p;
    bucket *a;
    u_int64_t nb_empty;
};
typedef struct set set;

int puissance(int p)
{
    int s = 1;
    for (int i = 0; i < p; i++)
    {
        s = s * 2;
    }
    return s;
}

//Part I
u_int64_t hash(T x, int p);
set *set_new(void);
void set_delete(set *s);
bool set_is_member(set *s, T x);

//Part II
T set_get(set *s, u_int64_t i);
u_int64_t set_begin(set *s);
u_int64_t set_end(set *s);
u_int64_t set_next(set *s, u_int64_t i);

//Part III
u_int64_t set_search(set *s, T x, bool *found);
bool set_is_member_v2(set *s, u_int32_t x);
void set_resize(set *s, int p);
void set_add(set *s, T x);