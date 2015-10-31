#include <cstdio>
int a[10001], b[10001], c[10001], d[10001];
int main() {
  int n, m, k, x;
  scanf("%d %d %d", &n, &m, &a[1]);
  for (int i = 2; i <= n - 1; i++) {
    scanf("%d", &a[i]);
  }
  for (int i = 2; i <= n - 1; i++) {
    scanf("%d", &b[i]);
  }
  c[n] = m;
  for (int i = n - 1; i >= 1; i--) {
    c[i] = c[i + 1] - (a[i + 1] > 0) + b[i + 1];
    if (m < c[i]) {
      c[i] = m;
    }
  }
  int ans = 0, last = 0;
  for (int i = 1; i <= n - 1; i++) {
    last -= b[i];
    if (a[i] < c[i] - last) {
      d[i] = a[i];
    } else {
      d[i] = c[i] - last;
    }
    ans += d[i] * (n - i);
    last += d[i];
  }
  printf("%d\n", ans);
  for (int i = 1; i <= n - 1; i++) {
    printf("%d%c", d[i], i == n - 1 ? '\n' : ' ');
  }
  return 0;
}
