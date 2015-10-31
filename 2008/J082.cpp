#include <cstdio>
int main() {
  int n, k, sum = 0;
  scanf("%d", &n);
  for (int i = 1; i <= n; i++) {
    scanf("%d", &k);
    sum += k;
    if (sum == n - i - 1) {
      printf("%d\n", n - i - 1);
      break;
    } else if (sum >= n - i) {
      printf("%d\n", n - i);
      break;
    }
  }
  return 0;
}
