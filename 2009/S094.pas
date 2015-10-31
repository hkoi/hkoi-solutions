var
  s: array[1..5000000] of longint;
  n, m, i, j, sum, start, len: longint;
begin
  read(n, m);
  for i := 1 to m do
    read(s[i]);
  j := 1;
  sum := 0;
  start := -1;
  len := m + 1;
  for i := 1 to m do
  begin
    while ((j <= m) and (sum < n)) do
    begin
      sum := sum + s[j];
      inc(j)
    end;
    if (sum = n) then
      if (j - i < len) then
      begin
        len := j - i;
        start := i
      end;
    sum := sum - s[i]
  end;
  if (start > 0) then
    writeln(start, ' ', len)
  else
    writeln('Impossible')
end.
