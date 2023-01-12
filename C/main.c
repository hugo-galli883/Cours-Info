#include <stdio.h>
#include <stdbool.h>

int rec(int a) {
    if(a == 0) {
        return 0;
    } else {
        return a + rec(a-1);
    }
}

int g(int n) {
    /*int ans = n + 1;
    return ans;*/
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

int main(int agrc, char **t) {
    //char* s = "Salut !";
    printf("%s\n",t[1]);
    return 0;
}
