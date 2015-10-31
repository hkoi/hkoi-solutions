#include <cstdio>
#include <algorithm>
using namespace std;
int a[1000], b[1000];
int main() {
  int n, c;
  scanf("%d %d", &n, &c);
  for (int i = 0; i < n; i++) {
    scanf("%d", &a[i]);
  }
  sort(a, a + n);
  if (n % 2) {
    for (int i = 0; i < n; i += 2) {
      b[i] = a[i];
    }
    for (int i = 1; i < n; i += 2) {
      b[i] = a[n - i - 1];
    }
  } else {
    for (int i = 0; i < n / 2; i++) {
      if (i % 2 == 0) {
        b[i] = a[i];
      } else {
        b[n - i - 1] = a[i];
      }
    }
    for (int i = n / 2; i < n; i++) {
      if (i % 2 == 0) {
        b[i + 1] = a[i];
      } else {
        b[n - i] = a[i];
      }
    }
  }
  for (int i = 0; i < n; i++) {
    printf("%d%c", b[i], i == n - 1 ? '\n' : ' ');
  }
  return 0;
}
