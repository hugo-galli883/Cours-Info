#include <stdio.h>
#include <stdbool.h>
//#include "test2.h" 

int rec(int a) {
    if(a == 0) {
        return 0;
    } else {
        return a + rec(a-1);
    }
}

int g(int n) {
    /*int ans = n + 1;
    return ans; */
    return n+1 ;
}

int division(int a, int b, int *r) {
    if(a > 0) {
        *r = a%b;
        return a/b;
    } else {
        int rem = a%b;
        *r = (rem == 0) ? 0 : rem + b;
        int q = (rem == 0) ? a/b : a/b-1;
        return q;
    }
}

int main() {
    printf("Hello World\n");
    bool test = true;
    if( test & test ) {
        printf("test\n");
    }
    int a = 3;
    int b = ++a;
    printf("%d - %d\n",a,b);
    a = 0;
    if (a = 0){
        printf("a est nul");
    }
    printf("result de rec : %d\n",rec(4));
    printf("%d\n",g(42));
    int n = 32;
    printf("L'adresse memoire vers n est : %p\n",&n); // &n est un "pointeur" : il contient l'adresse memoire de n
    a = 32;
    b = 6;
    int q;
    printf("Le resultat de la division euclidienne de %d par %d est : %d\n",a,b,division(a,b,&q));
    int t[4];
    t[1] = 42;
    t[3] = 17;
    printf("t[1] = %d\n",t[1]);
    printf("t[2] = %d\n",t[2]);
    //t[10] = 32;
    //printf("carre de a = %d\n", carre(a))
    /*switch (a == 2) {
        default:
            printf("2\n");
            break;

        case (3) :
            printf("3\n");
            break;
    } */
    /* int i = 0;
    while(true) { //Sature la memoire
        int *p = malloc(sizeof(i));
        i++;
    } */
    return 0;
}
