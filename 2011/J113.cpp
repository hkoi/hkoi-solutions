#include <cstdio>
int main() {
  int n;
  int twos = 0;
  scanf("%d", &n);
  while (n >= 4) {
    twos++;
    n /= 2;
  }
  if (n == 3) {
    printf("3");
  }
  if (n == 2) {
    twos++;
  }
  for (int i = 0; i < twos; i++) {
    printf("2");
  }
  printf("\n");
  return 0;
}
