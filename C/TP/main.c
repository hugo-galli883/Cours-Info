#include <stdio.h>
#include "TP1.h"

/*void incremente(int* n) {
    (*n)++ ;
}*/

int main() {
    int n = 6;
    incremente(&n);
    printf("%d\n",n);
}