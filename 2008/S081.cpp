#include <cstdio>
int maxyears[1000001];
int dows[1000001];
int main() {
  int months[101];
  int m, w, l, mleap, dleap;
  int yul, mul, dul, a, b, n, sum = 0;
  scanf("%d %d %d %d %d", &m, &w, &l, &mleap, &dleap);
  for (int i = 1; i <= m; i++) {
    scanf("%d", &months[i]);
    sum += months[i];
  }
  scanf("%d %d %d %d %d", &yul, &mul, &dul, &a, &b);
  
  // first we assume the day before 1st Jan, 1 is day 0
  int dow = 0;
  for (int i = 1; i <= 1000000; i++) {
    dows[i] = dow;
    dow += sum + (i % l == 0 ? dleap : 0);
    dow %= w;
  }

  // find dow of given date
  n = dows[yul];
  for (int i = 1; i < mul; i++) {
    n += months[i] + (yul % l == 0 && i == mleap ? dleap : 0);
  }
  n = (n + dul) % w;

  // then we simulate with all different day of week on day before 1st Jan
  int noleap[100], leap[100];
  for (int i = 0; i < w; i++) {
    noleap[i] = 0;
    dow = i;
    for (int j = 1; j <= m; j++) {
      if (months[j] >= 13 && (dow + 13) % w == n) {
        noleap[i]++;
      }
      dow += months[j];
    }
  }
  for (int i = 0; i < w; i++) {
    leap[i] = 0;
    dow = i;
    for (int j = 1; j <= m; j++) {
      if (months[j] + (j == mleap ? dleap : 0) >= 13 && (dow + 13) % w == n) {
        leap[i]++;
      }
      dow += months[j] + (j == mleap ? dleap : 0);
    }
  }
  
  // lastly scan through year a to b to find max
  int max = 0;
  int maxcount = 0;
  for (int i = a; i <= b; i++) {
    if (i % l == 0) {
      if (leap[dows[i]] > max) {
        max = leap[dows[i]];
        maxyears[0] = i;
        maxcount = 1;
      } else if (leap[dows[i]] == max) {
        maxyears[maxcount] = i;
        maxcount++;
      }
    } else if (noleap[dows[i]] > max) {
      max = noleap[dows[i]];
      maxyears[0] = i;
      maxcount = 1;
    } else if (noleap[dows[i]] == max) {
      maxyears[maxcount] = i;
      maxcount++;
    }
  }
  
  // output
  printf("%d\n", max);
  for (int i = 0; i < maxcount - 1; i++) {
    printf("%d ", maxyears[i]);
  }
  printf("%d\n", maxyears[maxcount - 1]);
  return 0;
}
