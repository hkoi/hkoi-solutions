#include <cstdio>
int d[3001], p[3001];
int a[60001], b[60001];
int main() {
  for (int i = 0; i <= 60000; i++) {
    a[i] = b[i] = -1;
  }
  int n, m, x, y;
  char c;
  scanf("%d %d", &n, &m);
  for (int i = 0; i < n; i++) {
    scanf("%d %d %c", &x, &y, &c);
    d[i] = x;
    p[i] = y;
    if (c == 'A') {
      a[x] = i;
    } else {
      b[x] = i;
    }
  }
  d[3000] = 99999;
  p[3000] = 0;
  a[60000] = 3000;
  b[60000] = 3000;
  for (int i = 60000; i >= 0; i--) {
    if (a[i] == -1)
      a[i] = a[i + 1];
    if (b[i] == -1)
      b[i] = b[i + 1];
  }
  int sum = 0;
  for (int i = 0; i < m; i++) {
    scanf("%d %d", &x, &y);
    if (x < 0) x = -x;
    if (y < 0) y = -y;
    n = x > y ? x : y;
    if (d[a[n]] != n && d[b[x + y]] != x + y) {
      sum += d[a[n]] < d[b[x + y]] ? p[a[n]] : p[b[x + y]];
    }
  }
  printf("%d\n", sum);
  return 0;
}
