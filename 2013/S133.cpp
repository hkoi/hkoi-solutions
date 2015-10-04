#include <cstdio>
#include <cstring>
int a[2000][10001];
int b[2000];
int main() {
  memset(a, 0, 2000 * 10001 * 4);
  memset(b, 0, 2000 * 4);
  int n,m;
  double ans = 999999.0;
  scanf("%d %d", &n, &m);
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      int x, y;
      scanf("%d %d", &x, &y);
      if (x > a[i][y])
        a[i][y] = x;
    }
  }
  for (int i = 1; i <= 10000; i++) {
    double sum = 0.0;
    bool ok = true;
    for (int j = 0; j < n; j++) {
      if (a[j][i] > b[j])
        b[j] = a[j][i];
      if (a[j][i] + b[j] == 0)
        ok = false;
      else
        sum += b[j];
    }
    if (ok && i / sum < ans) 
      ans = i / sum;
  }
  printf("%lf\n", ans);
  return 0;
}
