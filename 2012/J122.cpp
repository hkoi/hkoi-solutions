#include <cstdio>

int main() {
  int R,C,r,c;
  scanf("%d %d %d %d", &R, &C, &r, &c);
  if ((R * C % 2 == 0) || ((r - c) % 2 != 0)) {
    printf("Impossible\n");
    return 0;
  }
  for (int i=1; i<r; i++) {
    for (int j=0; j<C-1; j++)
      printf("%c", 'a' + (i % 2) + (j & 2));
    printf("%c\n", 'm' + ((i-1) & 2));
  }
  if (r % 2 == 1) {
    for (int j=0; j<c-1; j++)
      printf("%c", 'e' + (j & 2));
    printf("*");
    for (int j=c; j<C; j++)
      printf("%c", 'e' + ((j+1) & 2));
    printf("\n");
  } else {
    printf("%c", 'p' + (r & 2));
    for (int j=0; j<c-2; j++)
      printf("%c", 'e' + (j & 2));
    printf("*");
    for (int j=c; j<C-1; j++)
      printf("%c", 'e' + (j & 2));
    printf("%c\n", 'm' + ((r-1) & 2));
  }
  for (int i=r+1; i<=R; i++) {
    printf("%c", 'p' + (i & 2));
    for (int j=0; j<C-1; j++)
      printf("%c", 'a' + (i % 2) + (j & 2));
    printf("\n");
  }
  return 0;
}