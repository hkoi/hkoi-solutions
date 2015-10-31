#include <cstdio>
int a[200000];
int main() {
  int n, k, m = 0, mi;
  scanf("%d", &n);
  for (int i = n - 1; i >= 0; i--) {
    scanf("%d", &k);
    a[k + i]++;
    if (a[k + i] > m) {
      m = a[k + i];
      mi = k + i;
    } else if (a[k + i] == m) {
      if (k + i > mi) {
        mi = k + i;
      }
    }
  }
  for (int i = 1; i < n; i++) {
    scanf("%d", &k);
    a[k + i]++;
    if (a[k + i] > m) {
      m = a[k + i];
      mi = k + i;
    } else if (a[k + i] == m) {
      if (k + i > mi) {
        mi = k + i;
      }
    }
  }
  printf("%d\n", 2 * n - m - 1);
  printf("%d\n", mi);
  return 0;
}
