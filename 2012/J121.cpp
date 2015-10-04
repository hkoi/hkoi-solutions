#include <cstdio>
#include <cstring>

char s[90][100];

int main() {
  for (int i = 10; i <= 99; i++) {
    s[i - 10][0] = i / 10 + '0';
    s[i - 10][1] = i % 10 + '0';
    for (int k = 2; k < 100; k++) {
      s[i - 10][k] = (s[i - 10][k - 2] - '0') * (s[i - 10][k - 1] - '0');
      s[i - 10][k] = (s[i - 10][k] % 10) + '0';
    }
  }
  char a[101];
  char b[101];
  scanf("%s", a);
  scanf("%s", b);
  int counta, countb;
  int len = strlen(a);
  if (len == 1) {
    counta = (a[0] - '0') - 1;
  } else if (len == 2) {
    counta = (a[0] - '0') * 10 + (a[1] - '0') - 1;
  } else {
    int i;
    for (i = 0; i < 90; i++) {
      if (strncmp(s[i], a, len) >= 0) break;
    }
    counta = 90 * (len - 2) + i + 9;
  }
  len = strlen(b);
  if (len == 1) {
    countb = b[0] - '0';
  } else if (len == 2) {
    countb = (b[0] - '0') * 10 + (b[1] - '0');
  } else {
    int i;
    for (i = 0; i < 90; i++) {
      if (strncmp(s[i], b, len) > 0) break;
    }
    countb = 90 * (len - 2) + i + 9;
  }
  printf("%d\n", countb - counta);
  return 0;
}
