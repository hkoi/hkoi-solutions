#include <cstdio>
#include <algorithm>
using namespace std;
int x[10000], y[10000];
int main() {
  int n, w, h, s, xx, yy, t;
  scanf("%d %d %d %d", &n, &w, &h, &s);
  for (int i = 0; i < n; i++) {
    scanf("%d %d", &x[i], &y[i]);
  }
  scanf("%d %d %d", &xx, &yy, &t);
  long long sum = 0;
  for (int i = 0; i < n; i++) {
    int x1 = max(0, x[i] - t);
    int x2 = min(w, x[i] + t);
    int y1 = max(0, y[i] - t);
    int y2 = min(h, y[i] + t);
    sum += 1LL * (x2 - x1) * (y2 - y1);
    int d = min(1000000LL, 1LL * s * t);
    int x3 = max(0, xx - d);
    int x4 = min(w, xx + d);
    int y3 = max(0, yy - d);
    int y4 = min(h, yy + d);
    sum -= 1LL * max(0, x2 - x1 + x4 - x3 - max(x2, x4) + min(x1, x3))
               * max(0, y2 - y1 + y4 - y3 - max(y2, y4) + min(y1, y3));
  }
  printf("%lld\n", sum);
  return 0;
}
