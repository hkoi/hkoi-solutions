#include <cstdio>
char s[50001][51];
int ahead[20001], atail[20001];
int bhead[20001], btail[20001];
int aa[50001], bb[50001];
int main() {
  int l, n, m;
  scanf("%d %d", &n, &l);
  for (int i = 0; i < 20001; i++) {
    ahead[i] = -1;
    bhead[i] = -1;
  }
  for (int i = 0; i < n; i++) {
    scanf("%s", s[i]);
    int akey = s[i][0] * 26 * 26 + s[i][1] * 26 + s[i][2] - 67488;
    int bkey = s[i][l - 3] * 26 * 26 + s[i][l - 2] * 26 + s[i][l - 1] - 67488;
    if (ahead[akey] == -1)
      ahead[akey] = i;
    else
      aa[atail[akey]] = i;
    atail[akey] = i;
    if (bhead[bkey] == -1)
      bhead[bkey] = i;
    else 
      bb[btail[bkey]] = i;
    btail[bkey] = i;
    aa[i] = bb[i] = -1;
  }
  char q[51];
  scanf("%d", &m);  
  for (int i = 0; i < m; i++) {
    scanf(" %s", q);
    int akey = q[0] * 26 * 26 + q[1] * 26 + q[2] - 67488;
    int bkey = q[l - 3] * 26 * 26 + q[l - 2] * 26 + q[l - 1] - 67488;
    int search = ahead[akey];
    int diff = 0;
    while (search != -1) {
      diff = 0;
      for (int k = 0; k < l; k++) {
        if (q[k] != s[search][k])
          diff++;
        if (diff == 2)
          break;
      }
      if (diff == 1) {
        printf("%s\n", s[search]);
        break;
      }
      search = aa[search];
    }
    if (diff == 1)
      continue;
    search = bhead[bkey];
    while (search != -1) {
      diff = 0;
      for (int k = 0; k < l; k++) {
        if (q[k] != s[search][k])
          diff++;
        if (diff == 2)
          break;
      }
      if (diff == 1) {
        printf("%s\n", s[search]);
        break;
      }
      search = bb[search];
    }
  }
  return 0;
}
