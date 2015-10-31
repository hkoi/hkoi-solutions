#include <cstdio>
int a[1000][1000];
int r[1000], c[1000];
char o1[2000000];
int o2[2000000];
int main() {
  int n;
  scanf("%d", &n);
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      scanf("%d", &a[i][j]);
    }
    r[i] = c[i] = i;
  }
  int t, o = 0;
  for (int i = n - 1; i >= 0; i--) {
    for (int j = 0; j < i; j++) {
      if (a[r[j]][0] > a[r[j+1]][0]) {
        o1[o] = 'R';
        o2[o++] = j + 1;
        t = r[j];
        r[j] = r[j + 1];
        r[j + 1] = t;
      }
      if (a[0][c[j]] > a[0][c[j + 1]]) {
        o1[o] = 'C';
        o2[o++] = j + 1;
        t = c[j];
        c[j] = c[j + 1];
        c[j + 1] = t;
      }
    }
  }
  t = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (a[r[i]][c[j]] < t) {
        printf("No solution\n");
        return 0;
      }
      t = a[r[i]][c[j]];
    }
  }
  for (int i = 0; i < o; i++) {
    printf("%c %d\n", o1[i], o2[i]);
  }
  printf("Z\n");
  return 0;
}
