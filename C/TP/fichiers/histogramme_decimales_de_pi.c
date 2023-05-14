#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <assert.h>

int main()
{
    int *results = malloc(10 * sizeof(float));
    for (int i = 0; i < 10; i++)
    {
        results[i] = 0.;
    }
    char *c1 = malloc(2 * sizeof(char));
    FILE *f = fopen("data/pi.txt", "r");
    for (int i = 0; i < 10000000; i++)
    {
        fgets(c1, 2, f);
        results[atoi(c1)]++;
    }
    for (int i = 0; i < 10; i++)
    {
        printf("%d : %f\n", i, results[i] / 10000000.);
    }
    fclose(f);
    free(c1);
    free(results);
    return 0;
}