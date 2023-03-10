#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

//23
void swap1(int* x, int* y) {
    int c = *x;
    *x = *y;
    *y = c;
}

//24
bool is_sorted(int t[], int n) {
    int i = 0;
    while(i < n-1) {
        if(t[i] > t[i+1]) {
            return false;
        }
        i++;
    }
    return true;
}

//25
void swap(int a[], int i, int j) {
    int c = a[i];
    a[i] = a[j];
    a[j] = c;
}

//26
void knuth_shuffle(int a[], int n) {
    int i = 0;
    int j = 0;
    while(i < 5) {
        j = (rand() % n);
        printf("j = %d\n",j);
        swap(a, i, j);
        i++;
    }
}

//27

void two_way_sort(int a[], int n) {
    int nb1 = 0;
    for(int i = 0 ; i < n ; i++) {
        if(a[i] == 1) { nb1++; }
    }
    for(int i = 0; i < n-nb1 ; i++) { a[i] = 0; }
    for(int i = n-nb1 ; i < n ; i++) { a[i] = 1; }
}

//28
void dutch_flag(int a[], int n) {
    int nb_elements;
    int nb = 0;
    int g = 0;
    int d = n-1;
    for(int i = nb_elements; i > 0 ; i--) {
        while(g < d) {
            if(a[g] == i) {
                swap(a,g,d);
                nb ++;
                d --;
            } else {
                g ++;
            }
        }
        g = 0;
        d = n - 1 - nb;
        nb = 0;
    }
}

//29
void insertion_sort(int a[], int n) {
    int b[n];
    int min;
    for(int i = 0 ; i < n ; i++) {
        min = i;
        for(int j = i ; j < n ; j++) {
            if(a[j] < a[min]) {
                min = j;
            }
        }
        swap(a,i,min);
    }
}

//30
int binary_search(int v, int a[], int n) {
    int i = 0;
    int l = 0;
    int j = n;
    while(i != j) {
        l = i+(j-i)/2;
        if(a[l] == v) {
            return l;
        } else if(v < a[l]) {
            j = l;
        } else {
            i = l;
        }
    }
    return -1;
}

//32
int maximum_subarray(int a[], int n) {
    int max = a[0];
    int m = 0;
    for(int i = 0; i < n ; i++) {
        for(int j = i+1 ; j < n ; j++) {
            for(int l = i ; l <= j ; l++) {
                m += a[l];
            }
            if(m > max) {
                max = m;
            }
            m = 0;
        }
    }
    return max;
}

//34
void draw(int n) {
    int l = 0;
    for(int i = 1 ; i < n ; i++) {
        for(int j = 1 ; j < n ; j++) {
            //l = i&j;
            if(((i&j) == 0)) {
                printf("*");
            } else {
                printf(" ");
            }
        }
        printf("\n");
    }
}

void bubble_sort(int a[], int n) {
    bool sorted = false;
    while(!sorted) {
        sorted = true;
        for(int i = 0; i < n-1 ; i++) {
            if(a[i]>a[i+1]) {
                sorted = false;
                int c = a[i];
                a[i] = a[i+1];
                a[i+1] = c;
            }
        }
    }
}