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

/*
set *set_new(void)
{
    set *s = malloc(sizeof(set));
    bucket *t = malloc(2 * sizeof(bucket));
    s->p = 1;
    s->a = t;
    s->nb_empty = 2;
}
*/
//Correction
set *set_new(void)
{
    set *s = malloc(sizeof(set));
    s->p = 1; 
    s->a = malloc(2 * sizeof(bucket));
    s->a[0].status = empty;
    s->a[1].status = empty;
    s->nb_empty = 2;
    return s;
}
/*
set *set_example(void)
{
    set *s = malloc(sizeof(set));
    bucket *t = malloc(4 * sizeof(bucket));
    int *a = malloc(4 * sizeof(int));
    a[0] = 4;
    s->p = 2;
    bucket b1 = {status : 1,
                 element : 1492};
    bucket b2 = {status : ,
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
*/
//Correction
set *set_example(void)
{
    set *s = malloc(sizeof(set));
    s->p = 2;
    s->a = malloc(4 * sizeof(bucket));
    s->a[0].status = occupied;
    s->a[0].element = 1492;
    s->a[1].status = occupied;
    s->a[1].element = 1939;
    s->a[2].status = empty;
    s->a[3].status = occupied;
    s->a[3].element = 1515;
    s->nb_empty = 1;
    return s;
}

void set_delete(set *s)
{
    free(s->a);
    free(s);
}
/*
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
*/
//Correction
bool set_is_member(set *s, u_int32_t x)
{
    u_int64_t i = hash(x, s->p);
    u_int64_t one = 1;
    u_int64_t mask = (one << s->p) - one;
    while(true) {
        if(s->a[i].status == empty) {
            return false;
        } else if (s->a[i].element == x) {
            return true;
        }
        i += 1;
        i = i & mask;
    }
}


T set_get(set *s, u_int64_t i) {
    bucket b = (s->a)[i];
    return b.element;
}

u_int64_t set_begin(set *s) {
    int i = 0;
    while(s->a[i].status == empty && i < puissance(s->p)) {
        i ++;
    }
    return i;
}

u_int64_t set_end(set *s) {
    return puissance(s->p);
}

u_int64_t set_next(set *s, u_int64_t i) {
    int j = ++i ;
    while(s->a[j].status == empty && j < puissance(s->p)) {
        j ++;
    }
    return j;
}

u_int64_t set_search(set *s, T x, bool *found) {
    int i = hash(x, s->p);
    while(i < puissance(s->p)) {
        if(s->a[i].status == empty) {
            *found = false;
            return i;
        } else if (s->a[i].element == x) {
            *found = true;
            return i;
        }
        i += 1;
    }
    return puissance(s->p);
}

bool set_is_member_v2(set *s, u_int32_t x) {
    bool b = false;
    set_search(s, x, &b);
    return b;
}

void set_resize(set *s, int p) {
    bucket* b = malloc(puissance(p) * sizeof(bucket));
    for(int i = 0 ; i < puissance(p) ; i++) {
        b[i].status = empty;
        b[i].element = 0;
    }
    for(int i = 0 ; i < (s->p)+2 ; i++) {
        if(s->a[i].status == occupied) {
            u_int64_t j = hash(s->a[i].element, p);
            b[j].element = s->a[i].element;
            b[j].status = occupied;
            printf("%d\n", j);
        }
    }
    free(s->a);
    s->p = p;
    s->a = b;
}

void set_add(set *s, T x) {
    u_int64_t i = hash(x, s->p);
    while(s->a[i].status == occupied) {
        i ++;
    }
    s->a[i].status = occupied;
    s->a[i].element = x;
}

int main(void)
{
    set *s = set_example();
    for(int i = 0 ; i < puissance(s->p) ; i++) {
        printf(":%d\n", s->a[i].element);
    }
    printf("%d\n", set_is_member_v2(s, 1615));
    set_resize(s, 3);
    set_add(s, 1615);
    for(int i = 0 ; i < puissance(s->p) ; i++) {
        printf(":%d\n", s->a[i].element);
    }
    set_delete(s);
    return 1;
}