var
  d, p: array[1..3001] of longint;
  a, b: array[0..60000] of longint;
  i, n, m, x, y, sum: longint;
  dummy, c: char;
begin
  for i := 0 to 60000 do
  begin
    a[i] := -1;
    b[i] := -1
  end;
  read(n, m);
  for i := 1 to n do
  begin
    read(x, y, dummy, c);
    d[i] := x;
    p[i] := y;
    if (c = 'A') then
      a[x] := i
    else
      b[x] := i
  end;
  d[3001] := 99999;
  p[3001] := 0;
  a[60000] := 3001;
  b[60000] := 3001;
  for i := 59999 downto 0 do
  begin
    if (a[i] = -1) then
      a[i] := a[i + 1];
    if (b[i] = -1) then
      b[i] := b[i + 1]
  end;
  sum := 0;
  for i := 1 to m do
  begin
    read(x, y);
    if (x < 0) then
      x := -x;
    if (y < 0) then
      y := -y;
    if (x > y) then
      n := x
    else
      n := y;
    if ((d[a[n]] <> n) and (d[b[x + y]] <> x + y)) then
      if (d[a[n]] < d[b[x + y]]) then
        sum := sum + p[a[n]]
      else
        sum := sum + p[b[x + y]]
  end;
  writeln(sum)
end.
