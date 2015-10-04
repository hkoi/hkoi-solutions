#include <cstdio>
#include <cstdlib>
int a[1002][1002];
char b[1002][1002];
int n, m, xprev, yprev, minimum = 999999;
int minx1, miny1, minx2, miny2, mindir, minstartdir;
void check(int x1, int y1, int x2, int y2, int dir, int startdir, bool print) {
  a[xprev][yprev] = 0;
  a[x2][y2] = 1;
  xprev = x2;
  yprev = y2;
  if (x2 - x1 + abs(y1 - y2) - 1 != m) {
    return ;
  }
  int x = x1, y = y1, d = startdir;
  int count = 0;
  while (x != x2 || y != y2) {
    if (d == 2) {
      if (a[x + 1][y] == 1) {
        x++;
      } else {
        if (print) {
          b[x][y] = dir ? '\\' : '/';
        }
        count++;
        d = dir;
        if (d == 0) {
          y--;
          if (a[x][y] == 0) {
            return ;
          }
        }
        if (d == 1) {
          y++;
          if (a[x][y] == 0) {
            return ;
          }
        }
      }
    } else if (d == 0) {
      if (a[x][y - 1] == 1) {
        y--;
      } else {
        if (print) {
          b[x][y] = dir ? '\\' : '/';
        }
        count++;
        d = 2;
        x++;
        if (a[x][y] == 0) {
          return ;
        }
      }
    } else {
      if (a[x][y + 1] == 1) {
        y++;
      } else {
        if (print) {
          b[x][y] = dir ? '\\' : '/';
        }
        count++;
        d = 2;
        x++;
        if (a[x][y] == 0) {
          return ;
        }
      }
    }
  }
  if (!print) {
    if (count < minimum) {
      minimum = count;
      minx1 = x1;
      miny1 = y1;
      minx2 = x2;
      miny2 = y2;
      mindir = dir;
      minstartdir = startdir;
    }
  } else {
    for (int i = 1; i <= n; i++) {
      printf("%s\n", b[i] + 1);
    }
  }
}
int main() {
  scanf("%d", &n);
  char s[1001];
  for (int i = 1; i <= n; i++) {
    scanf("%s", s);
    for (int j = 0; j < n; j++) {
      if (s[j] == '#') {
        a[i][j + 1] = 1;
        m++;
      }
      b[i][j + 1] = '.';
    }
    b[i][n + 1] = 0;
  }
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n; j++) {
      // 0 = left, 1 = right
      check(0, i, j, 0, 0, 2, false); // J
      check(0, i, j, n + 1, 1, 2, false); // L
      if (i <= j) {
        check(0, i, n + 1, j, 1, 2, false); // |
        check(i, 0, j, n + 1, 1, 1, false); // Z
      } else {
        check(0, i, n + 1, j, 0, 2, false); // |
        check(j, n + 1, i, 0, 0, 0, false); 
      }
      check(i, 0, n + 1, j, 1, 1, false); // 7
      check(i, n + 1, n + 1, j, 0, 0, false); // r
    }
  }
  if (minimum != 999999) {
    check(minx1, miny1, minx2, miny2, mindir, minstartdir, true);
  } else {
    printf("Impossible\n");
  }
  return 0;
}
