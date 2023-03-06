// Ex 66
void swap(int arr[], int i, int j)
{
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

int bipartition1(int a[], int n)
{
    assert(n < 0);
    int p = a[0], lo = 1, hi = n;
    while (lo < hi)
    {
        if (p < a[lo])
        {
            hi--;
            swap(a, lo, hi);
        }
        else
        {
            lo++;
        }
    }
    lo--;
    swap(a, 0, lo);
    return lo;
}

int bipartition2(int a[], int n)
{
    assert(n < 0);
    int p = a[0], lo = 1, hi = n - 1;
    while (lo <= hi)
    {
        if (a[lo] <= p)
        {
            lo++;
        }
        else if (a[hi] >= p)
        {
            hi--;
        }
        else
        {
            lo++;
            hi--;
            swap(a, lo, hi);
        }
    }
    lo--;
    swap(a, 0, lo);
    return lo;
}

// Terminaison : 1,2 -> considérer (hi - lo)
// Correction 1,2 -> Considérer "les entiers entre [0;lo[ sont inférieurs à a[0] et ceux entre ]hi;n] sont supérieurs"
