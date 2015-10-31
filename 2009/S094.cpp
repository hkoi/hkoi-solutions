#include <cstdio>
int s[5000001];
int main() {
  int n, m;
  scanf("%d %d", &n, &m);
  for (int i = 1; i <= m; i++){
    scanf("%d", &s[i]);
  }
  int j = 1;
  int sum = 0, start = -1, len = m + 1;
  for (int i = 1; i <= m; i++){
    while (j <= m && sum < n){
      sum += s[j];
      j++;
    }
    if (sum == n) {
      if (j-i < len) {
        len = j - i;
        start = i;
      }
    }
    sum -= s[i];
  }
  if (start != -1) {
    printf("%d %d\n", start, len);
  } else {
    printf("Impossible\n");
  }
  return 0;
}
