#include <cstdio>
#include <algorithm>
using namespace std;
inline int divide(int a, int b) {
  if (a < 0) return 0;
  return b == 0 ? 9999999 : a / b;
}
int main() {
  int r, g, w, x, y, z, p, q;
  scanf("%d %d %d %d %d %d %d %d", &r, &g, &w, &x, &y, &z, &p, &q);
  int ans = 0;
  for (int red = 0; red <= r; red++) {
    int green = min((r - red * (w - 1)) / y,  divide(g - red * x - 1, z - 1));
    if (green < 1) {
      break;
    }
    ans = max(ans, red * p + green * q);
  }
  for (int green = 0; green <= g; green++) {
    int red = min(divide(r - green * y - 1, w - 1),  (g - green * (z - 1)) / x);
    if (red < 1) {
      break;
    }
    ans = max(ans, red * p + green * q);
  }
  printf("%d\n", ans + r * p + g * q);
  return 0;
}
