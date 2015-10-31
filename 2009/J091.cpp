#include <cstdio>
int a[200001], b[200001], c[400001];
int ds[200001], de[200001];
int main() {
  int n, m;
  scanf("%d", &n);
  for (int i = 0; i < n; i++) {
    scanf("%d %d", &a[i * 2], &a[i * 2 + 1]);
    a[i * 2 + 1]++;
  }
  a[2 * n] = 999999999;
  scanf("%d", &m);
  for (int i = 0; i < m; i++) {
    scanf("%d %d", &b[i * 2], &b[i * 2 + 1]);
    b[i * 2 + 1]++;
  }
  b[2 * m] = 999999999;
  int aa = 0, bb = 0;
  for (int i = 0; i < 2 * (m + n); i++) {
    if (a[aa] < b[bb]) {
      if (aa % 2 == 0)
        c[i] = a[aa];
      else
        c[i] = -a[aa];
      aa++;
    } else {
      if (bb % 2 == 0)
        c[i] = b[bb];
      else
        c[i] = -b[bb];
      bb++;
    }
  }
  c[2 * (m + n)] = 999999999;
  int sum = 0;
  int count = 0;
  for (int i = 0; i < 2 * (m + n); i++) {
    if (c[i] == -c[i + 1]) {
      i++;
      continue;
    }
    if (c[i] > 0) {
      if (sum == 0) {
        ds[count] = c[i];
      }
      sum++;
    } else {
      sum--;
      if (sum == 0) {
        de[count] = -c[i]-1;
        count++;
      }
    }
  }
  printf("%d\n", count);
  for (int i = 0; i < count; i++) {
    printf("%d %d\n", ds[i], de[i]);
  }
  return 0;
}
