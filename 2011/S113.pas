var
  a: array[0..1001, 0..1001] of char;
  up, down, left, right: array[0..1001, 0..1001] of longint;
  s: ansistring;
  n, m, c, i, j, x, y: longint;
  sum: int64;
begin
  readln(n, m, c);
  for i := 1 to n do
  begin
    for j := 1 to m do
      read(a[i][j]);
    a[i][0] := '#';
    a[i][m + 1] := '#';
    readln
  end;
  for j := 1 to m do
  begin
    a[0][j] := '#';
    a[n + 1][j] := '#';
  end;
  for i := 1 to n do
  begin
    left[i][0] := 0;
    for j := 1 to m do
      if (a[i][j - 1] = '#') then
        left[i][j] := 0
      else
        left[i][j] := left[i][j - 1] + 1;
    right[i][m + 1] := 0;
    for j := m downto 1 do
      if (a[i][j + 1] = '#') then
        right[i][j] := 0
      else
        right[i][j] := right[i][j + 1] + 1
  end;
  for j := 1 to m do
  begin
    up[0][j] := 0;
    for i := 1 to n do
      if (a[i - 1][j] = '#') then
        up[i][j] := 0
      else
        up[i][j] := up[i - 1][j] + 1;
    down[n + 1][j] := 0;
    for i := n downto 1 do
      if (a[i + 1][j] = '#') then
        down[i][j] := 0
      else
        down[i][j] := down[i + 1][j] + 1;
  end;
  sum := 0;
  readln(x, y);
  read(s);
  for i := 1 to c do
  begin
    if (s[i] = 'N') then
    begin
      sum := sum + up[x][y];
      x := x - up[x][y]
    end
    else if (s[i] = 'E') then
    begin
      sum := sum + right[x][y];
      y := y + right[x][y]
    end
    else if (s[i] = 'S') then
    begin
      sum := sum + down[x][y];
      x := x + down[x][y]
    end
    else
    begin
      sum := sum + left[x][y];
      y := y - left[x][y]
    end
  end;
  writeln(sum)
end.
