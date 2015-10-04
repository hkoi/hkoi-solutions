#include <cstdio>
char s[100001];
int main() {
  int n;
  scanf("%d", &n);
  scanf("%s", s);
  s[n] = 'G';
  char mode = 0;
  int start_y, start_w;
  for (int i = 0; i <= n; i++) {
    if (mode == 0 && s[i] == 'Y') {
      mode = 11;
      start_y = i + 1;
    } else if (mode == 0 && s[i] == 'W') {
      mode = 22;
      start_w = i + 1;
    } else if (mode == 11 && s[i] == 'G') {
      mode = 0;
      printf("Grow %d %d\n", start_y, i);
    } else if (mode == 12 && s[i] == 'G') {
      mode = 0;
      printf("Grow %d %d\n", start_w, i);
      printf("Grow %d %d\n", start_y, i);
    } else if (mode == 21 && s[i] == 'G') {
      mode = 0;
      printf("Blow %d %d\n", start_y, i);
      printf("SuperGrow %d %d\n", start_w, i);
    } else if (mode == 22 && s[i] == 'G') {
      mode = 0;
      printf("SuperGrow %d %d\n", start_w, i);
    } else if (mode == 11 && s[i] == 'W') {
      mode = 12;
      start_w = i + 1;
    } else if (mode == 12 && s[i] == 'Y') {
      mode = 11;
      printf("Grow %d %d\n", start_w, i);
    } else if (mode == 22 && s[i] == 'Y') {
      mode = 21;
      start_y = i + 1;
    } else if (mode == 21 && s[i] == 'W') {
      mode = 22;
      printf("Blow %d %d\n", start_y, i);
    }
  }
  printf("Finish\n");
  return 0;
}
