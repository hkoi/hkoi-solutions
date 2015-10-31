#include <cstdio>
bool valid[101][101];
int main() {
  int n, m, k;
  scanf("%d %d %d", &n, &m, &k);
  for (int i = 1; i <= m; i++)
    for (int j = 1; j <= n; j++)
      valid[i][j] = (i == 1);
  for (int i = 0; i < k; i++) {
    int from, to, pieces, a;
    scanf("%d %d %d", &from, &to, &pieces);
    for (int j = 0; j < pieces; j++) {
      scanf("%d", &a);
      valid[to][a] |= valid[from][a];
    }
  }
  for (int i = 1; i <= m; i++) {
    bool ok = true;
    for (int j = 1; j <= n; j++)
      ok &= valid[i][j];
    if (ok)
      printf("%d\n", i);
  }
  return 0;
}
