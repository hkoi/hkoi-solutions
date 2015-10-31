#include <cstdio>
int main() {
  int n;
  scanf("%d", &n);
  for (int i = 1; i <= n; i++) {
    for (int j = 0; j < n; j++) {
      printf("%d%c", i * i + j * i, j == n - 1 ? '\n' : ' ');
    }
  }
  return 0;
}
