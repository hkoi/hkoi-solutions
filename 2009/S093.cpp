#include <cstdio>
long long right[3000];
int main() {
  int n, m, a, b;
  for (int i = 0; i < 3000; i++) {
    right[i] = 0;
  }
  scanf("%d %d", &n, &m);
  for (int i = 0; i < n; i++) {
    scanf("%d %d", &a, &b);
    long long max = 0;
    int j;
    for (j = m - 1; j >= 0; j--) {
      if (right[j] > max) {
        if (m - j - 1 >= b)  {
          break;
        }
        max = right[j];
      }
    }
    right[j + b] = max + a;
    printf("%lld %d\n", max, j + 1);
  }
  return 0;
}
