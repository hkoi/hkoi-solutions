#include <cstdio>
int sum[202];
int main() {
  int n, m, dir, x, y, z, ss = 0;
  scanf("%d %d %d", &n, &m, &dir);
  for (int i = 0; i < m; i++) {
    scanf("%d %d %d", &x, &y, &z);
    if (dir == 0) {
      sum[x + 101] += z;
    } else {
      sum[x - y + 101] += z;
    }
    ss += z;
  }
  int s = 0;
  for (int i = -100; i <= 100; i++) {
    s += sum[i - 1 + 101];
    if (s * 2 == ss - sum[i + 101]) {
      printf("%d\n", i);
      return 0;
    }
  }
  printf("OH NO\n");
  return 0;
}
