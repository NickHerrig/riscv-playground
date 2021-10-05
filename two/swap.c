// the c procedure for swapping two memory locations
void swap(long long in v[], size_t k)
{
	long long int temp;
	temp = v[k];
	v[k] = v[k+1];
	v[k+1] = temp;
}
