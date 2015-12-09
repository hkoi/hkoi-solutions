#include <cstdio>
int main() {
  int n, m, x, y, count = 1;
  int twos = 0, threes = 0;
  scanf("%d %d %d", &n, &m, &x);
  for (int i = 0; i < n - 1; i++) {
    scanf("%d %d", &x, &y);
    if (x == y) {
      count++;
    } else {
      count = 1;
    }
    if (count % 3 == 0) {
      twos--;
      threes++;
    }
    if (count % 3 == 2) {
      twos++;
    }
  }
  int ans;
  if (m >= threes + twos) {
    ans = threes * 2 + twos;
  } else if (m <= threes) {
    ans = m * 2;
  } else {
    ans = threes + m;
  }
  if (ans + m > n) {
    ans = n - m;
  }
  printf("%d\n", ans);
  return 0;
}
