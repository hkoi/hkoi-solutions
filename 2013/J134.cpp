#include <cstdio>
#include <cstring>
#include <cmath>
char a[1001][1001];
int c[1001][1001];
int t[100];
int main() {
  int w, h, p, r, l;
  scanf("%d %d %d %d %d", &w, &h, &p, &r, &l);  
  for (int i = 0; i < p; i++) {
    scanf("%d", &t['A' + i]);
  }
  for (int i = h - 1; i >= 0; i--) {
    scanf("%s", a[i]);
  }
  // compute
  for (int i = 0; i < h; i++) {
    c[i][w - 1] = 1;
    for (int j = w - 2; j >= 0; j--) {
      if (a[i][j] == a[i][j + 1]) {
        c[i][j] = c[i][j + 1] + 1;
      } else {
        c[i][j] = 1;
      }
    }
  }
  int ans = 0;
  for (int i = 0; i < r; i++) {
    int x, y, ww, hh;
    double tx, ty;
    scanf("%lf %lf", &tx, &ty);
    x = floor(tx);
    y = floor(ty);
    if (x == tx) {
      ww = l;
    } else {
      ww = l + 1;
    }
    if (y == ty) {
      hh = l;
    } else {
      hh = l + 1;
    }            
    if (tx < 0 || ty < 0 || x + ww > w || y + hh > h) {
      continue;
    }
    bool ok = true;
    for (int j = 0; j < hh; j++) {
      if (a[y + j][x] != a[y][x] || c[y + j][x] < ww) {
        ok = false;
        break;
      }
    }
    if (ok) {
      ans += t[a[y][x]];
    }
  }
  printf("%d\n", ans);
  return 0;
}
