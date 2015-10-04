#include <cstdio>
#include <cstring>
#include <vector>
using namespace std;
char s[300001], t[300001];
int u[300001];
vector<int> l[100];
int freq[100];
int main() {
  scanf("%s", s);
  int n = strlen(s);
  int cur;
  for (int i = 0; i < n; i++) {
    if (s[i] == '.') {
      cur = i;
    } else {
      freq[s[i]]++;
      l[s[i]].push_back(i);
    }
  }
  int m = 1;
  for (int i = 'A'; i <= 'Z'; i++) {
    for (int j = 0; j < freq[i]; j++) {
      t[m] = i;
      u[m] = j;
      m++;
    }
  }
  for (int i = 0; i < n - 1; i++) {
    printf("%c", t[cur]);
    cur = l[t[cur]][u[cur]];
  }
  printf(".\n");
  return 0;
}
