
void swap(int a[], int i, int j) {
    int c = a[i];
    a[i] = a[j];
    a[j] = c;
}
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
void cor_two_way_sort(int a[], int n) {
    int g = 0;
    int d = n-1;
    while(g <= d) {
        if(a[g] == 1) {
            //swap(a,g,d);
            d--;
        } else {
            g++;
        }
    }
}

//29
void cor_insertion_sort(int a[], int n) {
    for(int i = 0 ; i < n ; i++) {
        for(int j = i ; j > 0 ; j--) {
            if(a[j] < a[j-1]) {
                swap(a,j,j-1);
            } else {
                break;
            }
        }
    }
}

void cor_insertion_sort2(int a[], int n) { //Invariant : Le tableau t[0...i[ est trié dans l'ordre croissant
    for(int i = 0 ; i < n ; i++) {
        int v = a[i];
        int j = i;
        while(j > 0 && v < a[j]) {
            a[j] = a[j - 1];
            j--;
        }
        a[j] = v;
    }
}

//30
int cor_binary_search(int v, int a[], int n) {
    int g = 0;
    int d = n-1;
    while (g < d) {
        int milieu = (g+d)/2;
        if (v > a[milieu]) {
            g = milieu + 1;
        } else {
            d = milieu;
        }
        
    }
    if(v == a[g]) {
        return g;
    } else {
        return -1;
    }
    
}

int cor_dichotomie(int t[], int n, int x) {
    int g = 0;
    int d = n;
    while(d - g > 0) {
        int m = (g + d)/2;
        if(t[m] == x) {
            return m;
        } else if(t[m] < x) {
            g = m + 1;
        } else {
            d = m;
        }
    }
    return -1;
}

//31
void cor_quickrec(int a[], int l, int r) {
    if(r - l <= 0) {
        return;
    }
    int pivot = 0;
    int lo = l;
    int hi = r;
    int m = lo;
    while( m <= hi) {
        if(a[m] > pivot) {
            swap(a,m,hi);
            hi --;
        } else if(a[m] < pivot) {
            swap(a,m,lo);
            lo++;
            m++;
        } else {
            m++;
        }
    }
    cor_quickrec(a,l,lo);
    cor_quickrec(a,hi++,r);
    
}

void cor_quicksort(int a[], int n) {
    knuth_shuffle(a,n);
    cor_quickrec(a,0,n);
}