// the c procedure for swapping two memory locations
void swap(long long in v[], size_t k)
{
	long long int temp;
	temp = v[k];
	v[k] = v[k+1];
	v[k+1] = temp;
}

// the c procedure for bubble sort
void sort (long long in v[], size_t int n)
{
	size_t i, j;
	for (i = 0; i < n; i += 1) {
		for (j = i - 1; j >= 0 && v[j] > v[j + 1]; j -= 1) {
			swap(v, j);
		}
	}
}
