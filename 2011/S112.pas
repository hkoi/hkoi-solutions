var
  sum: array[1..2000, 1..3] of longint;
  s, t: ansistring;
  n, m, i, j, ans, dist: longint;
begin
  readln(n);
  readln(s);
  readln(m);
  readln(t);
  for i := 0 to m - 1 do
  begin
    sum[i][0] := 0;
    sum[i][1] := 0;
    sum[i][2] := 0
  end;
  for i := 1 to n do
  begin
    if (s[i] = 'B') then
      inc(sum[(i - 1) mod m][1]);
    if (s[i] = 'G') then
      inc(sum[(i - 1) mod m][2]);
    if (s[i] = 'W') then
      inc(sum[(i - 1) mod m][3])
  end;
  ans := 2147483647;
  for i := 0 to m - 1 do
  begin
    dist := 0;
    for j := 0 to m - 1 do
    begin
      if (t[j + 1] <> 'B') then
        dist := dist + sum[(i + j) mod m][1];
      if (t[j + 1] <> 'G') then
        dist := dist + sum[(i + j) mod m][2];
      if (t[j + 1] <> 'W') then
        dist := dist + sum[(i + j) mod m][3];
    end;
    if (dist < ans) then
      ans := dist
  end;
  writeln(ans)
end.
