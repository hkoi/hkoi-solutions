var
  a, b, c, d: array[1..10000] of longint;
  n, m, k, x, ans, last, i: longint;
begin
  read(n, m, a[1]);
  for i := 2 to n - 1 do
    read(a[i]);
  for i := 2 to n - 1 do
    read(b[i]);
  b[1] := 0;
  a[n] := 0;
  b[n] := 0;
  c[n] := m;
  for i := n - 1 downto 1 do
  begin
    c[i] := c[i + 1] + b[i + 1];
    if (a[i + 1] > 0) then
      dec(c[i]);
    if (m < c[i]) then
      c[i] := m
  end;
  ans := 0;
  last := 0;
  for i := 1 to n - 1 do
  begin
    last := last - b[i];
    if (a[i] < c[i] - last) then
      d[i] := a[i]
    else
      d[i] := c[i] - last;
    ans := ans + d[i] * (n - i);
    last := last + d[i]
  end;
  writeln(ans);
  for i := 1 to n - 2 do
    write(d[i], ' ');
  writeln(d[n - 1])
end.
