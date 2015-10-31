#include <cstdio>
int main() {
  int n;
  scanf("%d", &n);
  for (int i = n; i >= 1; i--) {
    for (int j = 0; j < n; j++) {
      printf("%d%c", i * (i + 1) / 2 * n - i * j, j == n - 1 ? '\n' : ' ');
    }
  }
  return 0;
}
