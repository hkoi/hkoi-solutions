var
  x, y, l: array[1..2000] of longint;
  n, m, k, ans, i, j, lc, left: longint;
begin
  read(n, m, k);
  for i := 1 to k do
    read(x[i], y[i]);
  ans := 1;
  for i := 1 to k do
  begin
    lc := 0;
    for j := 1 to k do
      if ((y[j] >= y[i]) and (y[j] < y[i] + m)) then
      begin
        inc(lc);
        l[lc] := x[j]
      end;
    left := 1;
    for j := 2 to lc do
    begin
      while (l[left] <= l[j] - m) do
        inc(left);
      if (j - left + 1 > ans) then
        ans := j - left + 1
    end
  end;
  writeln(ans)
end.
