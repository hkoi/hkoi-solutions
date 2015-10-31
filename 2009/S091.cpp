#include <cstdio>
int main() {
  long long r1, g1, b1, r2, g2, b2;
  scanf("%lld %lld %lld %lld %lld %lld", &r1, &g1, &b1, &r2, &g2, &b2);
  if ((g1 + b2 + 2 * (b1 + g2)) % 3 == 0)
    printf("R\n");
  else if ((g1 + b2 + 2 * (b1 + g2)) % 3 == 1)
    printf("G\n");
  else
    printf("B\n");
  return 0;
}

