var
  sum: array[0..201] of longint;
  n, m, dir, x, y, z, s, ss, i: longint;
begin
  read(n, m, dir);
  for i := 0 to 201 do
    sum[i] := 0;
  ss := 0;
  for i := 1 to m do
  begin
    read(x, y, z);
    if (dir = 0) then
      sum[x + 101] := sum[x + 101] + z
    else
      sum[x - y + 101] := sum[x - y + 101] + z;
    ss := ss + z;
  end;
  s := 0;
  for i := -100 to 100 do
  begin
    s := s + sum [i - 1 + 101];
    if (s * 2 = ss - sum[i + 101]) then
    begin
      writeln(i);
      halt
    end;
  end;
  writeln('OH NO')
end.  
