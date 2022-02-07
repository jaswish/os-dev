#define MAX 1000
extern int R[MAX];
long summer(int*A);
long x;
void main()
{
	int i;
	for(i = 0; i < MAX; i++)
	{
		R[i] = rand();
	}
	long sum = summer(R);
	printf("sum is %ld\n", sum);
}
