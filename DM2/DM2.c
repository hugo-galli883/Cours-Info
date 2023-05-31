#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#define n 8
#define d 5

void voisins_inferieurs(int g[n][d + 1], int x, bool voisins_inf[n])
{
    for (int i = 0; i < n; i++) // On commence par réinitialiser entièrement le tableau
    {
        voisins_inf[i] = false;
    }
    for (int i = 1; i < g[x][0] + 1; i++) // On parcourt les voisins de x, et on met "True" ssi leur indice est inférieur à x
    {
        voisins_inf[g[x][i]] = g[x][i] < x;
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
                    nb_a++;
                }
            }
        }
    }
    return (nb_a == nb_s * (nb_s - 1)); // On retourne "True" ssi le graphe est complet
}

bool est_ordre_parfait(int g[n][d + 1])
{
    bool b = true;
    bool soms[n] = {n * false};
    for (int i = 0; i < n; i++) // On parcourt tous les sommets du graphe, et pour chacun d'eux on vérifie que ses voisins antécédents forment bien une clique
    {
        voisins_inferieurs(g, i, soms);
        b = b && (est_clique(g, soms));
    }
    return b;
}

bool simplicial(int g[n][d + 1], bool sg[n], int k)
{
    bool voisins[] = {n * false};
    for (int i = 1; i < g[k][0]; i++)
    {
        voisins[g[k][i]] = sg[g[k][i]];
    }
    return (est_clique(g, voisins));
} // Complexite : O(d) + O(est_clique) = O(d) + O(S+A) = O(S+A) car O(d) = O(S)

int trouver_simplicial(int g[n][d + 1], bool sg[n])
{
    for (int i = 0; i < n; i++)
    {
        if (sg[i] && simplicial(g, sg, i))
        {
            return i;
        }
    }
    return -1;
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
        {2, 1, 2},
        {4, 0, 2, 3, 4},
        {5, 0, 1, 3, 4, 5},
        {5, 1, 2, 4, 6, 7},
        {5, 1, 2, 3, 5, 6},
        {2, 2, 4},
        {3, 3, 4, 7},
        {2, 3, 6}};
    // bool voisins_inf[] = {false, false, false, false, false};
    // voisins_inferieurs(g, x, voisins_inf);
    // for (int i = 0; i < n; i++)
    //{
    //     printf("Sommet %d : %d\n", i, voisins_inf[i]);
    // }
    // bool soms[] = {true, true, true, false, true, false, false, false};
    // printf("%d\n", est_clique(g, soms));
    bool sg[] = {n * true};
    printf("%d\n", trouver_simplicial(g, sg));
    // bool soms[n] = {n * false};
    /*for (int j = 0; j < n; j++)
    {
        printf("Sommet %d :\n", j);
        voisins_inferieurs(g, j, soms);
        for (int i = 0; i < n; i++)
        {
            printf("Sommet %d : %d\n", i, soms[i]);
        }
        printf("\n");
    } */
    // printf("%d\n", est_clique(g, soms));
    return 0;
}