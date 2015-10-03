#include <cstdio>
int main() {
  int n, k = 1;
  scanf("%d", &n);
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      printf("%d", k);
      if (j == n - 1) {
        printf("\n");
      } else {
        printf(" ");
        k += 4;
      }
    }
  }
  return 0;
}
