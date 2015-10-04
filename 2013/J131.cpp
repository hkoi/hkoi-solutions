#include <cstdio>

int main() {
  int n, m;
  int a[10001];
  int count[6];
  int last[6];
  scanf("%d %d", &n, &m);
  for (int i = 1; i <= m; i++) {
    a[i] = 0;
  }
  for (int i = 1; i <= 100; i++) {
    count[1] = count[3] = count[5] = 0;
    for (int j = 1; j <= m; j++) {
      int k;
      scanf("%d", &k);
      count[k]++;
      last[k] = j;
    }
    if (count[1] == 1) {
      a[last[1]] += 1;
      gameover = a[last[1]] >= n;
    }
    if (count[3] == 1) {
      a[last[3]] += 3;
      gameover |= a[last[3]] >= n;
    }
    if (count[5] == 1) {
      a[last[5]] += 5;
      gameover |= a[last[5]] >= n;
    }
    if (gameover) {
      printf("%d\n", i);
      for (int j = 1; j < m; j++) {
        printf("%d ", a[j] > n ? n : a[j]);
      }   
      printf("%d\n", a[m] > n ? n : a[m]);
      return 0;
    }
  }
  return 0;
}
