#include <cstdio>
#include <cstring>
char s[20][21];
int v[20];
int main() {
  int n;
  scanf("%d", &n);
  for (int i = 0; i < n; i++) {
    scanf("%s", s[i]);
    v[i] = 0;
    for (int j = 0; j < strlen(s[i]); j++) {
      v[i] |= 1 << (s[i][j] - 'A');
    }
  }
  int mini, min = 21;
  for (int i = 0; i < 1 << n; i++) {
    int a = 0, count = 0;
    for (int j = 0; j < n; j++) {
      if (i & 1 << j) {
        a |= v[j];
        count++;
      }
    }
    if (a == (1 << 26) - 1 && count < min) {
      min = count;
      mini = i;
    }
  }
  if (min == 21) {
    printf("Impossible\n");
    return 0;
  }
  printf("%d\n", min);
  for (int j = 0; j < n; j++) {
    if (mini & 1 << j) {
      printf("%s\n", s[j]);
    }
  }
  return 0;
}
