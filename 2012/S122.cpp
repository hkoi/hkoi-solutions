#include <cstdio>
#include <algorithm>
using namespace std;
int a[1000], b[1000], c[1000], d[1000];
int main() {
  int n;
  scanf("%d", &n);
  long long sum = 0;
  for (int i = 0; i < n; i++) {
    scanf("%d %d %d %d", &a[i], &b[i], &c[i], &d[i]);
    sum += 1LL * (c[i] - a[i]) * (d[i] - b[i] + 1)
    sum += 1LL * (c[i] - a[i] + 1) * (d[i] - b[i]);
    for (int j = 0; j < i; j++) {
      if (a[i] == c[j] || c[i] == a[j]) {
        sum -= max(0, d[i] - b[i] + d[j] - b[j] - max(d[i], d[j]) + min(b[i], b[j]));
      } 
      if (b[i] == d[j] || d[i] == b[j]) {
        sum -= max(0, c[i] - a[i] + c[j] - a[j] - max(c[i], c[j]) + min(a[i], a[j]));
      }
    }
  }
  printf("%lld\n", sum);
  return 0;
}
