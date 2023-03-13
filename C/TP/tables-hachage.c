#include "tables-hachage.h"

/*u_int64_t hash(T x, int p)
{
    u_int64_t r = x / puissance(p);
    return r;
}*/

//Correction:
u_int64_t hash(T x, int p) {
    int n = 1;
    for(int i = 0; i < p ; i++) {
        n = 2 * n;
    }
    int f = x % n;
    return f;
}


set *set_new(void)
{
    set *s = malloc(sizeof(set));
    bucket *t = malloc(2 * sizeof(bucket));
    s->p = 1;
    s->a = t;
    s->nb_empty = 2;
}

set *set_example(void)
{
    set *s = malloc(sizeof(set));
    bucket *t = malloc(4 * sizeof(bucket));
    int *a = malloc(4 * sizeof(int));
    a[0] = 4;
    s->p = 2;
    bucket b1 = {status : 1,
                 element : 1492};
    bucket b2 = {status : 1,
                 element : 1939};
    bucket b3 = {status : 1,
                 element : 1515};
    t[0] = b1;
    t[1] = b2;
    t[3] = b3;
    s->a = t;
    s->nb_empty = 1;
    return s;
}

void set_delete(set *s)
{
    free(s->a);
    free(s);
}

bool set_is_member(set *s, T x)
{
    int i = 0;
    u_int8_t k = 1;
    while (k != 0 && i < puissance(s->p))
    {
        if ((s->a[i]).element = x)
        {
            return true;
        }
    }
    return false;
}

T set_get(set *s, u_int64_t i) {
    bucket b = (s->a)[i];
    return b.element;
}

int main(void)
{
    set *s = set_example();
    bucket *k = s->a;
    bucket m = k[3];
    bucket b1 = {status : 1,
                 element : 1492};
    u_int8_t n = b1.status;
    printf("%d\n", set_get(s, 1));
    return 1;
}