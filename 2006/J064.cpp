#include <cstdio>
int a[501][501];
bool covered[501], b[501];
int main() {
  int n;
  scanf("%d", &n);
  for (int i = 1; i <= n; i++) {
    scanf("%d", &a[i][0]);
    for (int j = 1; j <= a[i][0]; j++) {
      scanf("%d", &a[i][j]);
    }
  }
  for (int i = n; i >= 1; i--) {
    if (!covered[i]) {
      b[i] = true;
      for (int j = 1; j <= a[i][0]; j++) {
        if (covered[a[i][j]]) {
          printf("-1\n");
          return 0;
        }
        covered[a[i][j]] = true;
      }
    }
  }
  for (int i = 1; i <= n; i++) {
    if (b[i])
      printf("%d\n", i);
  }
  return 0;
}
