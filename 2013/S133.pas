var
  a: array[1..2000, 1..10000] of longint;
  b: array[1..2000] of longint;
  n, m, i, j, x, y: longint;
  ok: boolean;
  sum, ans: double;
begin
  for i := 1 to 2000 do
  begin
    for j := 1 to 10000 do
      a[i][j] := 0;
    b[i] := 0
  end;
  ans := 99999.0;
  read(n, m);
  for i := 1 to n do
    for j := 1 to m do
    begin
      read(x, y);
      if (x > a[i][y]) then
        a[i][y] := x
    end;
  for i := 1 to 10000 do
  begin
    sum := 0.0;
    ok := true;
    for j := 1 to n do
    begin
      if (a[j][i] > b[j]) then
        b[j] := a[j][i];
      if (a[j][i] + b[j] = 0) then
        ok := false
      else
        sum := sum + b[j];
    end;
    if (ok and (i / sum < ans)) then
      ans := i / sum
  end;
  writeln(ans:0:6)
end.
