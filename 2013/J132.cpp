#include <cstdio>
#include <cstring>
char a[50001][13];
char b[50001][13];
int main() {
  int n, m;
  scanf("%d",&n);
  for (int i = 1; i <= n; i++) {
    scanf("%s", a[i]);
  }
  // simulate
  int stalled = 0;
  for (int front = 1; front < n; front++) {
    if (strlen(a[front]) == 12 && strlen(a[front + 1]) == 8 && stalled < 2) {
      strcpy(b[front], a[front + 1]);
      strcpy(a[front + 1], a[front]);
      stalled++;
    } else if (strlen(a[front]) == 8 && strlen(a[front + 1]) == 8 && a[front][0] == '0' && a[front + 1][0] == '1' && stalled == 0) {
      strcpy(b[front], a[front + 1]);
      strcpy(a[front + 1], a[front]);
      stalled++;
    } else {
      strcpy(b[front], a[front]);
      stalled = 0;
    }
  }
  strcpy(b[n], a[n]);
  scanf("%d", &m);
  int k;
  for (int i = 1; i <= m; i++) {
    scanf("%d", &k);
    printf("%s%c", b[k], i == m ? '\n' : ' ');
  }
  return 0;
}
