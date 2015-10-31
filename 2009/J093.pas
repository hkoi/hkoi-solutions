var
  a: array[1..100000] of longint;
  freq: array[1..500] of longint;
  n, m, sum, max, ans, i, j, k: longint;
begin
  read(n, m);
  for i := 1 to m do
    freq[i] := 0;
  for i := 1 to n do
    read(a[i]);
  ans := n;
  for i := 1 to n - 1 do
  begin
    if (n mod i <> 0) then
      continue;
    sum := 0;
    for j := 1 to i do
    begin
      max := 0;
      k := j;
      while (k <= n) do
      begin
        inc(freq[a[k]]);
        if (freq[a[k]] > max) then
          max := freq[a[k]];
        k := k + i;
      end;
      k := j;
      while (k <= n) do
      begin
        dec(freq[a[k]]);
        k := k + i
      end;
      sum := sum + max
    end;
    if (n - sum < ans) then
      ans := n - sum
  end;
  writeln(ans)
end.
