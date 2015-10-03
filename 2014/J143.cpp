#include <cstdio>
int a[50000];
int i;
int serial(int x, int y) {
  return x * 50000 + y;
}
bool search(int x, int y) {
  int z = serial(x, y);
  int l = 0, r = i;
  while (r >= l) {
    int mid = (l + r) / 2;
    if (a[mid] == z) {
      return true;
    } else if (a[mid] > z) {
      r = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  return false;
}
int main() {
  int w, h, n, x, y;
  int count = 0;
  scanf("%d %d %d", &w, &h, &n);
  for (i = 0; i < n; i++) {
    scanf("%d %d", &x, &y);
    a[i] = serial(x, y);
    // upright
    if (search(x - 4, y) && search(x - 3, y) && search(x - 2, y + 3) && search(x - 2, y + 2) && search(x - 1, y))
      count++;
    // T
    if (search(x - 4, y) && search(x - 3, y) && search(x - 2, y - 3) && search(x - 2, y - 2) && search(x - 1, y))
      count++;
    // -|
    if (search(x - 3, y - 2) && search(x - 2, y - 2) && search(x, y - 4) && search(x, y - 3) && search(x, y - 1))
      count++;
    // |-
    if (search(x - 3, y - 2) && search(x - 3, y - 1) && search(x - 3, y + 1) && search(x - 3, y + 2) && search(x - 1, y))
      count++;
  }
  printf("%d\n", count);
  return 0;
}
