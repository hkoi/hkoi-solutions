#include <cstdio>
#include <cmath>
#include <algorithm>
using namespace std;
pair<double, double> plans[6001];
double cost[6000001];
int main() {
  int n;
  scanf("%d", &n);
  for (int i = 0; i < n; i++) {
    scanf("%lf %lf", &plans[i].first, &plans[i].second);
  }
  sort(plans, plans + n);
  plans[n].first = 99999.0;
  plans[n].second = 99999.0;
  int plan = 0;
  for (int i = 0; i <= 6000000; i++) {
    while (plans[plan].first + plans[plan].second * i / 1000.0 >
      plans[plan + 1].first + plans[plan+1].second * i / 1000.0) {
      plan++;
    }
    cost[i] = plans[plan].first + plans[plan].second * i / 1000.0;
  }
  int m;
  double d;
  scanf("%d", &m);
  for (int i = 0; i < m; i++) {
    scanf("%lf", &d);
    printf("%.3lf\n", cost[(int)round(d * 1000.0)] + 0.0000001);
  }
  return 0;
}
