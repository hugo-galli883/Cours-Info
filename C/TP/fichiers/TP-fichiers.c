#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

int part2() // Gestion des fichiers
{
    FILE *f = fopen("new", "w"); // Ecriture dans le fichier
    fprintf(f, "%s", "Premiere ligne\nDeuxieme ligne\n");
    fclose(f);
    FILE *f2 = fopen("new", "r"); // Lecture du fichier
    char *arr = malloc(100 * sizeof(char));
    fgets(arr, 100, f2);
    fprintf(stdout, "%s", arr);
    fgets(arr, 100, f2);
    fprintf(stdout, "%s", arr);
    fclose(f2);
    free(arr);
    FILE *f3 = fopen("new", "a"); // Ecriture de la troisieme ligne
    fprintf(f3, "%s", "Troisieme ligne\n");
    fclose(f3);
    FILE *f4 = fopen("new", "r"); // Lecture 2 du fichier
    char *arr2 = malloc(100 * sizeof(char));
    fgets(arr2, 100, f4);
    fprintf(stdout, "%s", arr2);
    fgets(arr2, 100, f4);
    fprintf(stdout, "%s", arr2);
    fgets(arr2, 100, f4);
    fprintf(stdout, "%s", arr2);
    fclose(f4);
    free(arr2);

    FILE *f5 = fopen("plot.txt", "w");
    for (int i = 0; i < 10000; i++)
    {
        // int carre = i * i;
        // char num[5];
        // char num_c[10];

        // Convert 123 to string [buf]
        // itoa(i, num, 5);
        // itoa(carre, num_c, 10);
        fprintf(f5, "%i", i);
        fprintf(f5, "%s", " ");
        fprintf(f5, "%i", i * i);
        fprintf(f5, "%s", "\n");
    }
    fclose(f5);
    return 0;
}

int part3()
{
    FILE *f1 = fopen("data/prenoms.txt", "r");
    int i = 2;
    char *s1 = malloc(30 * sizeof(char));
    char *s2 = malloc(30 * sizeof(char));
    fgets(s1, 30, f1);
    fgets(s2, 30, f1);
    while (strcmp(s1, s2))
    {
        strcpy(s1, s2);
        fgets(s2, 30, f1);
        i++;
    }
    fclose(f1);
    free(s1);
    free(s2);
    printf("%i\n", i);

    FILE *f2 = fopen("data/prenoms.txt", "r");
    int j = 0;
    char *s3 = malloc(30 * sizeof(char));
    char *s4 = malloc(30 * sizeof(char));
    char *s5 = "e";
    char *s6 = "f";
    fgets(s3, 30, f2);
    fgets(s4, 30, f2);
    if (strcmp(s4, s5) > 0 && strcmp(s4, s6) < 0)
    {
        i++;
    }
    while (strcmp(s3, s4))
    {
        // printf("%d", *s3[0]);
        if (strcmp(s4, s5) > 0 && strcmp(s4, s6) < 0)
        {
            j++;
        }
        strcpy(s3, s4);
        fgets(s4, 30, f2);
    }
    fclose(f2);
    free(s3);
    free(s4);
    printf("%i\n", j);

    FILE *f3 = fopen("data/prenoms.txt", "r");
    char *s7 = malloc(40 * sizeof(char));
    char *s8 = malloc(40 * sizeof(char));
    char *s9 = "hugo\n";
    fgets(s7, 40, f3);
    fgets(s8, 40, f3);
    while (strcmp(s7, s8))
    {
        if (strcmp(s8, s9) == 0)
        {
            printf("Prenom trouve\n");
            break;
        }
        strcpy(s7, s8);
        fgets(s8, 40, f3);
    }
    fclose(f3);
    free(s7);
    free(s8);
    // free(s9);

    return 0;
}

int part5()
{
    FILE *f1 = fopen("data/prenoms.txt", "r");
    int i = 2;
    char *s1 = malloc(30 * sizeof(char));
    char *s2 = malloc(30 * sizeof(char));
    fgets(s1, 30, f1);
    fgets(s2, 30, f1);
    while (strcmp(s1, s2))
    {
        strcpy(s1, s2);
        fgets(s2, 30, f1);
        i++;
    }
    fclose(f1);
    free(s1);
    free(s2);
    printf("%i\n", i);
    return 0;
}

int main()
{
    part3();
    return 0;
}