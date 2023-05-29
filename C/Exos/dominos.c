#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

struct maillon
{
    int i;
    int j;
    struct maillon *suivant;
};
typedef struct maillon maillon;

// 1
maillon *m_cree(int i, int j)
{
    maillon *m = malloc(sizeof(maillon));
    m->i = i;
    m->j = j;
    m->suivant = NULL;
    return m;
}

// 2
void m_retourne(maillon *m)
{
    int t = m->i;
    m->i = m->j;
    m->j = t;
}

maillon *lst_cree(void)
{
    maillon *m = malloc(sizeof(maillon));
    m->i = -1;
    m->j = -1;
    m->suivant = NULL;
    return m;
}

void lst_libere(maillon *lst)
{
    maillon *m1 = lst;
    maillon *m2 = m1->suivant;
    while (m2 != NULL)
    {
        free(m1);
        m1 = m2;
        m2 = m1->suivant;
    }
    free(m1);
}

// 4
bool lst_estVide(maillon *lst)
{
    return (lst->suivant == NULL);
}

// 5
void lst_insere(maillon *p, maillon *m)
{
    m->suivant = p->suivant;
    p->suivant = m;
}

// 6
maillon *lst_extrait(maillon *p)
{
    if (p->suivant == NULL)
    {
        return NULL;
    }
    maillon *m = p->suivant;
    p->suivant = m->suivant;
    return m;
}

// Existence d'une chaine de taille n
// 1
bool lst_estValide(maillon *lst)
{
    if (lst->suivant->suivant == NULL || (lst->suivant->j == lst->suivant->suivant->i))
    {
        return true;
    }
    return false;
}

// 2
bool solution(maillon *sac, maillon *chaine)
{
    if (lst_estVide(sac))
    {
        return true;
    }
    else
    {
        // maillon *m = sac;
        // while (m != NULL && m->suivant != NULL)
        for (maillon *m = sac; m->suivant != NULL; m = m->suivant)
        {
            maillon *v = lst_extrait(m);
            if (lst_estVide(chaine) || v->j == chaine->suivant->i)
            {
                lst_insere(chaine, v);
                solution(sac, chaine);
            }
            if (v != NULL)
            {
                lst_insere(sac, v);
            }
            // m = m->suivant;
        }
        if (!lst_estVide(chaine))
        {
            lst_insere(sac, lst_extrait(chaine));
        }
        return false;
    }
}

int main()
{
    maillon *sac = lst_cree();
    lst_insere(sac, m_cree(5, 4));
    lst_insere(sac, m_cree(4, 0));
    lst_insere(sac, m_cree(0, 1));
    maillon *chaine = lst_cree();
    if (solution(sac, chaine))
    {
        printf("OK\n");
    }
    else
    {
        printf("Error\n");
    }
    lst_libere(sac);
    lst_libere(chaine);
    return 0;
}
