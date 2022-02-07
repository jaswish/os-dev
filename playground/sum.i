# 1 "sum.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "sum.c"


int R[1000];

long summer()
{
 int i;
 long sum = 0;
 for (i=0; i<1000; i++) sum += R[i];
 return sum;
}
