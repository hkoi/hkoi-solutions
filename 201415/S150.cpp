#include <cstdio>
int main() {
  int n;
  scanf("%d", &n);
  for (int i = 0; i < n; i++) {
    for (int j = i * i; j > 0; j -= i) {
      printf("%d ", j + 1);
    }
    printf("1\n");
  }
  return 0;
}
