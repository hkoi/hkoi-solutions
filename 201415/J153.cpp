#include <cstdio>
#include <cstring>
char a[100001], b[100001];
int main() {
  int x, y;
  scanf("%s %s", a, b);
  x = strlen(a);
  y = strlen(b);
  int overtype = 0;
  int deleted = 0;
  for (int i = 0; i < y; i++) {
    if (b[i] == 'D') {
      deleted++;
    } else if (b[i] == 'I') {
      overtype = 1 - overtype;
    } else {
      printf("%c", b[i]);
      deleted += overtype;
    }
  }
  if (deleted < x) {
    printf("%s", a + deleted);
  }
  printf("\n");
  return 0;
}
