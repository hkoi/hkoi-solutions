#include <cstdio>
int sum[2000][4], u[2005][4];
char s[200005], t[2005];
int main() {
  int n, m;
  scanf("%d %s %d %s", &n, s, &m, t);
  for (int i = 0; i < n; i++) {
    sum[i % m][0] += s[i] == 'B';
    sum[i % m][1] += s[i] == 'G';
    sum[i % m][2] += s[i] == 'W';
  }
  int ans = 2147483647;
  for (int i = 0; i < m; i++) {
    int dist = 0;
    for (int j = 0; j < m; j++) {
      dist += sum[(i + j) % m][0] * (t[j] != 'B');
      dist += sum[(i + j) % m][1] * (t[j] != 'G');
      dist += sum[(i + j) % m][2] * (t[j] != 'W');
    }
    if (dist < ans) {
      ans = dist;
    }
  }
  printf("%d\n", ans);
  return 0;
}
