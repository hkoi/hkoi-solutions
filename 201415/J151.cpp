#include <cstdio>
int main() {
  int n, m;
  scanf("%d %d", &n, &m);
  if (m > 1000000 || m < -1000000) {
    for (int i = 1; i < (n + 1) / 2; i++) {
      printf("%d %d ", i, -i);
    }
  } else {
    for (int i = 1; i < (n + 1) / 2; i++) {
      printf("%d %d ", i + 2000000, -i - 2000000);
    }
  }
  if (n % 2 == 0) {
    if (m == 0) {
      printf("-99999999 99999999\n");
    } else {
      printf("0 %d\n", m);
    }
  } else {
    printf("%d\n", m);
  }
  return 0;
}
