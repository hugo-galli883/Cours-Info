#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <assert.h>

int main(int argc, char *argv[])
{
    int d = atoi(argv[1]);
    assert(d < 10000000);
    char *c1 = malloc(2 * sizeof(char));
    FILE *f = fopen("data/pi.txt", "r");
    for (int i = 0; i < d; i++)
    {
        fgets(c1, 2, f);
    }
    printf("%s\n", c1);
    fclose(f);
    free(c1);
    return 0;
}