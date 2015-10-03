#include <cstdio>
int ones[20][2], zeros[20][2];
bool done[20];
int r[1048576];
char s[1048576][21];
int o1[20], o2[20], o3[20];
int main() {
  int n;
  scanf("%d", &n);
  int m = 1 << n;
  for (int i = 0; i < m; i++) {
    scanf("%s %d", s[i], &r[i]);
    for (int j = 0; j < n; j++) {
      if (r[i] == 1) {
        ones[j][s[i][j] - '0']++;
      } else {
        zeros[j][s[i][j] - '0']++;
      }
    }
  }
  int req = m / 2;
  for (int i = 0; i < n - 1; i++) {
    bool found = false;
    for (int j = 0; j < n; j++) {
      if (done[j]) {
        continue;
      }
      for (int k = 0; k <= 1; k++) {
        if (ones[j][k] == req || zeros[j][k] == req) {
          o1[i] = j + 1;
          o2[i] = k;
          o3[i] = ones[j][k] == req ? 1 : 0;
          for (int p = 0; p < m; p++) {
            if (r[p] != -1 && s[p][j] - '0' == k) {
              for (int q = 0; q < n; q++) {
                if (r[p] == 1) {
                  ones[q][s[p][q] - '0']--;
                } else {
                  zeros[q][s[p][q] - '0']--;
                }
              }
              r[p] = -1;
            }
          }
          done[j] = true;
          found = true;
          break;
        }
      }
    }
    if (!found) {
      printf("Impossible\n");
      return 0;
    }
    req /= 2;
  }
  for (int j = 0; j < n; j++) {
    if (!done[j]) {
      if (ones[j][0] + ones[j][1] != 1) {
        printf("Impossible\n");
        return 0;
      }
      for (int i = 0; i < n - 1; i++) {
        printf("%d %d %d\n", o1[i], o2[i], o3[i]);
      }
      printf("%d %d\n", j + 1, ones[j][0] > ones[j][1] ? 0 : 1);
      return 0;
    }
  }
}
