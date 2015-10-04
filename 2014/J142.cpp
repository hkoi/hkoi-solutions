#include <cstdio>
int main() {
  int n, a = 0, b = 0, c = 0, d = 0, x, y;
  scanf("%d", &n);
  for (int i = 0; i < n; i++) {
    scanf("%d", &x);
    if (x <= 3) {
      scanf("%d", &y);
    }
    if (x == 1) {
      a += y;
      b += y;
    }
    if (x == 2) {
      c += y;
      d += y;
    }
    if (x == 3) {
      if (b < y) {
        c -= y - b;
        b = 0;
      } else {
        b -= y;
      }
      if (d < y) {
        a -= y - d;
        d = 0;
      } else {
        d -= y;
      }
    }
    if (x == 4) {
      printf("%d %d\n", a, b);
    }
  }
  return 0;
}
