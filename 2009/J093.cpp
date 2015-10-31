#include <cstdio>
int a[100000];
int freq[501];
int main() {
  int n, m;
  scanf("%d %d", &n, &m);
  for (int i = 0; i < n; i++) {
    scanf("%d", &a[i]);
  }
  int ans = n;
  for (int i = 1; i < n; i++) {
    if (n % i != 0) {
        continue;
    }
    int sum = 0;
    for (int j = 0; j < i; j++) {
      int max = 0;
      for (int k = j; k < n; k += i) {
        freq[a[k]]++;
        if (freq[a[k]] > max) {
          max = freq[a[k]];
        }
      }
      for (int k = j; k < n; k += i) {
        freq[a[k]]--;
      }
      sum += max;
    }
    if (n - sum < ans) {
      ans = n - sum;
    }
  }
  printf("%d\n", ans);
  return 0;
}
