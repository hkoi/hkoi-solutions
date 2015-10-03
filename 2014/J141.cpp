#include <cstdio>
#include <algorithm>
 
using namespace std;
 
int main() {
  int n, m, k;
  long long tm, ts;
  scanf("%d %d %d %lld %lld", &n, &m, &k, &tm, &ts);
  int batch = (k - 1) / m + 1;
  int last_batch = (n - 1) / m + 1;
  int page_of_batch = k - (batch - 1) * m;
  long long method0 = ts * (k - 1);
  long long pred_batch = tm * (batch - 2) + max(tm, ts);
  long long method1 = pred_batch + ts * page_of_batch;
  long long batch_end = tm * (batch - 1) + ts;
  long long method2 = batch_end + ts * (last_batch == batch ? n - k : m - page_of_batch);
  if (tm > ts * m)
    method0 = 2147483647;
  if (batch == 1)
    method1 = 2147483647;
  printf("%lld\n", min(method0, min(method1, method2)));
  return 0;
}
