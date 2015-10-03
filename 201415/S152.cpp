#include <cstdio>
int x[2000], y[2000], l[2000];
int main() {
  int n, m, k;
  scanf("%d %d %d", &n, &m, &k);
  for (int i = 0; i < k; i++) {
    scanf("%d %d", &x[i], &y[i]);
  }
  int ans = 1;
  for (int i = 0; i < k; i++) {
    int lc = 0;
    for (int j = 0; j < k; j++) {
      if (y[j] >= y[i] && y[j] < y[i] + m) {
        l[lc++] = x[j];
      }
    }
    int left = 0;
    for (int j = 1; j < lc; j++) {
      while (l[left] <= l[j] - m) {
        left++;
      }
      if (j - left + 1 > ans) {
        ans = j - left + 1;
      }
    }
  }
  printf("%d\n", ans);
  return 0;
}
