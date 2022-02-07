#define MAX 1000

int R[MAX];

long summer()
{
	int i;
	long sum = 0;
	for (i=0; i<MAX; i++) sum += R[i];
	return sum;
}
