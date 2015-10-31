#include <cstdio>
#include <cstring>
char a[1002][1002];
int up[1002][1002], down[1002][1002], left[1002][1002], right[1002][1002];
char s[4000001];
int main() {
  int n, m, c;
  scanf("%d %d %d", &n, &m, &c);
  for (int i = 1; i <= n; i++) {
    scanf("%s", a[i] + 1);
    a[i][0] = a[i][m + 1] = '#';
  }
  for (int j = 1; j <= m; j++) {
    a[0][j] = a[n + 1][j] = '#';
  }
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= m; j++) {
      left[i][j] = a[i][j - 1] == '#' ? 0 : left[i][j - 1] + 1;
    }
    for (int j = m; j >= 1; j--) {
      right[i][j] = a[i][j + 1] == '#' ? 0 : right[i][j + 1] + 1;
    }
  }
  for (int j = 1; j <= m; j++) {
    for (int i = 1; i <= n; i++) {
      up[i][j] = a[i - 1][j] == '#' ? 0 : up[i - 1][j] + 1;
    }
    for (int i = n; i >= 1; i--) {
      down[i][j] = a[i + 1][j] == '#' ? 0 : down[i + 1][j] + 1;
    }
  }
  long long sum = 0;
  int x, y;
  scanf("%d %d %s", &x, &y, s);
  for (int i = 0; i < c; i++) {
    if (s[i] == 'N') {
      sum += up[x][y];
      x -= up[x][y];
    } else if (s[i] == 'E') {
      sum += right[x][y];
      y += right[x][y];
    } else if (s[i] == 'S') {
      sum += down[x][y];
      x += down[x][y];
    } else {
      sum += left[x][y];
      y -= left[x][y];
    }
  }
  printf("%lld\n", sum);
  return 0;
}
