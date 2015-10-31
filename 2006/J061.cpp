#include <cstdio>
#include <cstring>
char months[12][4] = {"Jan", "Feb", "Mar", "Apr", "May",
    "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
int main() {
  int d, m, y, n;
  char mm[4];
  scanf("%d %s %d", &d, &mm, &y);
  scanf("%d", &n);
  for (int i = 0; i < 12; i++)
    if (strcmp(months[i], mm)==0)
      m = i + 1;
  for (int i = 0; i < n; i++) {
    d++;
    if (d == 32 || d == 31 && (m == 4 || m == 6 || m == 9 || m == 11)) {
      m++;
      d = 1;
    }
    if (d == 30 && m == 2 || d == 29 && m == 2 && (y % 4 != 0 || y % 100 == 0 && y%400 != 0)) {
      m++;
      d = 1;
    }
    if (m == 13) {
      y++;
      m = 1;
    }
  }
  printf("%d %s %d\n", d, months[m - 1], y);
  return 0;
}
