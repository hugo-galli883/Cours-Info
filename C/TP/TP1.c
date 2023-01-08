#include <stdio.h>

//Ex3
void extrema(int t[], int n, int *min, int *max){
    int M = 0;
    int m = 0;
    for(int i = 0 ; i < n ; i++ ) {
        if(t[i] > t[M]) {
            M = i;
        } else if(t[i] < t[m]) {
            m = i;
        }
    }
    *max = t[M];
    *min = t[m];
}

int ex3() {
    int max = 15;
    int min = 2;
    int t[] = {-1, 1, 3, 6, 9, 10, 13, 14, 17, 2, -5, 23};
    int n = 12;
    extrema(t, n, &min, &max);
    printf("min = %d\nmax = %d\n", min, max);
    return 0;
}

//Ex4
void mystere(int *x, int *y) {
    *x = *x - *y;
    *y = *x + *y;
    *x = *y - *x;
}

int ex4() {
    int x = 3;
    int y = 4;
    mystere(&x, &y);
    printf("x = %d\n", x);
    printf("y = %d\n", y);
    int x2 = 3;
    int y2 = 3;
    mystere(&x2, &y2);
    printf("x2 = %d\n", x2);
    printf("y2 = %d\n", y2);
    int x3 = 3;
    mystere(&x3, &x3);
    printf("x3 = %d\n", x3);
    return 0;
}

//Ex5
void f(int n, int *nmax) {
    printf("Début de l'appel de f(%d, _)\n", n); // debut
    printf("n     = %d\n", n);
    printf("&n    = %p\n", (void *)&n);
    printf("nmax  = %p\n", (void *)nmax);
    printf("*nmax = %d\n", *nmax);
    printf("&nmax = %p\n", (void *)&nmax);
    if (n < *nmax) f(n + 1, nmax);
    printf("Fin de l'appel de f(%d, _)\n", n);  // fin
}

int ex5() {
    int n = 2;
    f(0, &n);
    return 0;
}

//Ex6
void incremente(int* n) {
    (*n)++;
}