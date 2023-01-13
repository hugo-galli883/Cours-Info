#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include "exos.h"
#include "correction.h"

int main() {
    int a[] = {1,8,2,3,9,1,0,12,7,34,2,0,18};
    int n = 13;
    //int a[] = {-2,1,-3,4,-1,2,1,-5,4};
    //int n = 9;
    bubble_sort(a,n);
    for(int i = 0 ; i < n ; i++) {
        printf("a[%d] = %d\n",i,a[i]);
    }
    //printf("max = %d\n",maximum_subarray(a,n));
    return 0;
}