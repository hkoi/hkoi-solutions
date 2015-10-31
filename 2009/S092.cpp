#include <cstdio>
int gifts[500000];
int last[1001];
int w[50000], v[50000];
int main() {
  int n, m;
  scanf("%d %d", &n, &m);
  for (int i = 0; i < n; i++) {
    scanf("%d", &gifts[i]);
  }
  for (int i = 0; i < m; i++) {
    scanf("%d %d", &w[i], &v[i]);
  }
  for (int i = 0; i < n; i++) {
    while (last[gifts[i]] < m && (w[last[gifts[i]]] < gifts[i] || v[last[gifts[i]]] < gifts[i])) {
      last[gifts[i]]++;
    }
    if (last[gifts[i]] == m) {
      printf("Impossible\n");
      return 0;
    }
    v[last[gifts[i]]] -= gifts[i];
    gifts[i] = last[gifts[i]] + 1;
  }
  for (int i = 0; i < n - 1; i++) {
    printf("%d ", gifts[i]);
  }
  printf("%d\n", gifts[n - 1]);
  return 0;
}
