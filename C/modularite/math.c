#include "math.h"

int power(int x, int n) {
    int ans = 1;
    for (int i = 0; i < n; i++) {
        ans *= x;
    }
    return ans;
}