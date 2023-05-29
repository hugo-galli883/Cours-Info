#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#define n 8
#define d 5

void voisins_inferieurs(int g[n][d + 1], int x, bool voisins_inf[n])
{
    for (int i = 1; i < g[x][0] + 1; i++)
    {
        voisins_inf[g[x][i]] = i < x;
    }
}

bool est_clique(int g[n][d + 1], bool sommets[n])
{
    int nb_s = 0;
    int nb_a = 0;
    for (int i = 0; i < n; i++)
    {
        if (sommets[i])
        {
            nb_s++;
            for (int j = 1; j < g[i][0] + 1; j++)
            {
                if (sommets[g[i][j]])
                {
                    // printf("Ajout de l'arete [%d %d]\n", i, g[i][j]);
                    nb_a++;
                }
            }
        }
    }
    // printf("%d %d\n", nb_a, nb_s);
    return (nb_a == nb_s * (nb_s - 1));
}

bool est_ordre_parfait(int g[n][d + 1])
{
    bool b = true;
    bool soms[n] = {n * false};
    for (int i = 0; i < n; i++)
    {
        voisins_inferieurs(g, i, soms);
        printf("Tour %d : %d\n", i, b);
        for (int i = 0; i < n; i++)
        {
            printf("\tSommet %d : %d\n", i, soms[i]);
        }
        b = b && (est_clique(g, soms));
        printf("Tour %d' : %d\n", i, b);
    }
    // free(soms);
    return b;
}

int main()
{
    // int x = 2;
    /*int g[n][d + 1] = {
        {3, 1, 2, 3},
        {3, 0, 3, 2},
        {4, 0, 1, 3, 4},
        {3, 0, 1, 2},
        {1, 2}};*/
    int g[n][d + 1] = {
        {2, 1, 4},
        {4, 0, 2, 4, 5},
        {5, 0, 1, 2, 5, 7},
        {5, 1, 3, 4, 5, 6},
        {4, 0, 1, 2, 6},
        {2, 4, 5},
        {3, 2, 3, 5},
        {2, 2, 6}};
    // bool voisins_inf[] = {false, false, false, false, false};
    // voisins_inferieurs(g, x, voisins_inf);
    // for (int i = 0; i < n; i++)
    //{
    //     printf("Sommet %d : %d\n", i, voisins_inf[i]);
    // }
    // bool soms[] = {true, true, true, false, true, false, false, false};
    // printf("%d\n", est_clique(g, soms));
    printf("%d\n", est_ordre_parfait(g));
    bool soms[n] = {n * false};
    voisins_inferieurs(g, 5, soms);
    for (int i = 0; i < n; i++)
    {
        printf("Sommet %d : %d\n", i, soms[i]);
    }
    printf("%d\n", est_clique(g, soms));
    return 0;
}