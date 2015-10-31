#include <cstdio>
char s[50];
int vars[26];
int main() {
  for (int i = 0; i < 26; i++)
    vars[i] = -1000001;
  int n;
  scanf("%d", &n);
  for (int i = 0; i < n; i++) {
    int first, second, pos;
    bool add;
    scanf("%s", s);
    if (s[2] >= 'A') {
      first = vars[s[2] - 'A'];
      pos = 3;
    } else {
      first = 0;
      pos = 2;
      if (s[2] == '-')
        pos++;
      while (s[pos] >= '0' && s[pos] <= '9')
        first = first * 10 + (s[pos++] - '0');
      if (s[2] == '-')
        first *= -1;
    }
    if (s[pos] == 0) {
      vars[s[0] - 'A'] = first;
      continue;
    }
    add = s[pos++] == '+';
    if (s[pos] >= 'A') {
      second = vars[s[pos] - 'A'];
    } else {
      second = 0;
      if (s[pos] == '-') {
        add = !add;
        pos++;
      }
      while (s[pos] >= '0' && s[pos] <= '9')
        second = second * 10 + (s[pos++] - '0');
    }
    vars[s[0] - 'A'] = first + (add ? second : -second);
  }
  for (int i = 0; i < 26; i++)
    if (vars[i] != -1000001)
      printf("%c=%d\n", 'A' + i, vars[i]);
  return 0;
}
