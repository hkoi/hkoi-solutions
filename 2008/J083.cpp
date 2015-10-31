#include <cstdio>
int main() {
  long long n;
  long long sum = 0, k = 1;
  scanf("%lld", &n);
  for (int i = 0; i <= 58; i++) {
    sum += n / (k * 2) * k;
    if (n % (k * 2) >= k) {
      sum += n % k + 1;
    }
    k *= 2;
  }
  printf("%lld\n", sum);
  return 0;
}
