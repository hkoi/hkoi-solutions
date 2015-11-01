#include <cstdio>
int x[200001];
int main() {
  long long n, a, b;
  scanf("%lld %lld %lld", &n, &a, &b);
  for (int i = 1; i <= a; i++) {
    x[i] = 1;
  }
  long long s = n * (n + 1) / 2;
  long long sa = a * (a + 1) / 2;
  long long t = s / 2;
  for (int i = a, j = n; i > 0 && sa < t; i--, j--) {
    if (t - sa >= b) {
      sa += b;
      x[i] = 0;
      x[j] = 1;
    } else {
      x[i] = 0;
      x[i + t - sa] = 1;
      break;
    }
  }
  bool space = false;
  for (int i = 1; i <= n; i++) {
    if (x[i] == 0) {
      continue;
    }
    if (space) {
      printf(" ");
    }
    printf("%d", i);
    space = true;
  }
  printf("\n");
  space = false;
  for (int i = 1; i <= n; i++) {
    if (x[i] == 1) {
      continue;
    }
    if (space) {
      printf(" ");
    }
    printf("%d", i);
    space = true;
  }
  printf("\n");
  return 0;
}
