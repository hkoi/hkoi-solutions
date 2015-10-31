#include <cstdio>
#include <cstring>
int freq[32], sorter[32];
char s[256];
int main() {
  int k;
  char c;
  scanf("%d %c ", &k, &c);
  gets(s);
  int len = strlen(s);
  for (int i = 0; i < len; i++) {
    if (s[i] >= 'A' && s[i] <= 'Z' ||
        s[i] >= 'a' && s[i] <= 'z')
        freq[s[i] % 32]++;
  }
  for (int i = 1; i <= 26; i++) {
    sorter[i] = i;
  }
  for (int i = 25; i >= 1; i--) {
    for (int j = 1; j <= i; j++) {
      if (freq[sorter[j]] < freq[sorter[j + 1]]) {
        int t = sorter[j];
        sorter[j] = sorter[j + 1];
        sorter[j + 1] = t;
      }
    }
  }
  int d = sorter[k] - c % 32;
  if (d < 0) {
    d += 26;
  }
  for (int i = 0; i < len; i++) {
    if (s[i] >= 'A' && s[i] <= 'Z') {
      printf("%c", 'A' + (s[i] - 'A' + 26 - d) % 26);
    } else if (s[i] >= 'a' && s[i] <= 'z') {
      printf("%c", 'a' + (s[i] - 'a' + 26 - d) % 26);
    } else {
      printf("%c", s[i]);
    }
  }
  printf("\n");
  return 0;
}
