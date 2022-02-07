# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "main.c"

extern int R[1000];
long summer(int*A);
long x;
void main()
{
 int i;
 for(i = 0; i < 1000; i++)
 {
  R[i] = rand();
 }
 long sum = summer(R);
 printf("sum is %ld\n", sum);
}
