#include <cstdio>
#include <cstring>
int main() {
  // 0 = 0 left, 10 = 0 right
  char dist[11][12] = {"01232343451",
                       "10121232342",
                       "21012123231",
                       "32103214322",
                       "21230121233",
                       "32121012122",
                       "43212103213",
                       "32341230124",
                       "43232121013",
                       "54323212104",
                       "12123234340"};
  char s[32];
  scanf("%s", s);
  int location = 5, moves = 0;
  int len = strlen(s);
  for (int i = 0; i < len; i++) {
    if (s[i] == '0' && location != 0 && location != 1 && location != 4 && location != 7) {
      moves += dist[location][10] - '0';
      location = 10;
    } else if (s[i] == '0') {
      moves += dist[location][0] - '0';
      location = 0;
    } else {
      moves += dist[location][s[i] - '0'] - '0';
      location = s[i] - '0';
    }
  }
  printf("%d\n", moves);
  return 0;
}
