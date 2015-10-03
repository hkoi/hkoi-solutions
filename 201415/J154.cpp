#include <cstdio>
long long h[100002];
int main() {
  int n;
  long long money;
  scanf("%d %lld", &n, &money);
  for (int i = 1; i <= n; i++) {
    scanf("%lld", &h[i]);
    if (i >= 2 && h[i - 1] == h[1] && money + h[1] < h[i]) {
      printf("Impossible\n");
      return 0;
    }
  }
  if (n <= 2) {
    printf("0\n");
    return 0;
  }
  money += h[1];
  h[n + 1] = 9999999999999999LL;
  int target = 2;
  long long years = 0;
  while (true) {
    // find best home
    while (h[target] <= money) {
      target++;
    }
    if (target == n + 1) {
      // check if can buy 1 year earlier....
      if (money + h[1] >= h[n] * 2 && years > 0) {
        years--;
      }
      printf("%lld\n", years);
      return 0;
    }
    long long missing = h[target] - money;
    // fast foward
    long long ffcycles = (missing - 1) / (h[target - 1] - h[1]) / 2 + 1;
    if (ffcycles < 0) {
      ffcycles = 0;
    }
    years += 4 * ffcycles;
    money += ffcycles * (h[target - 1]-h[1]) * 2;
  }
}
