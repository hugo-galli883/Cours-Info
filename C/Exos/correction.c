//27
void two_way_sort(int a[], int n) {
    int g = 0;
    int d = n-1;
    while(g <= d) {
        if(a[g] == 1) {
            swap(a,g,d);
            d--;
        } else {
            g++;
        }
    }
}

//30
int binary_search(int v, int a[], int n) {
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

int dichotomie(int t[], int n, int x) {
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