var
  n, i, j, a, count, mini, min: longint;
  s: array[0..20] of string;
  v: array[0..20] of longint;
begin
  readln(n);
  for i := 0 to n - 1 do
  begin
    readln(s[i]);
    v[i] := 0;
    for j := 1 to length(s[i]) do
      v[i] := v[i] or (1 shl (ord(s[i][j]) - ord('A')));
  end;
  min := 21;
  for i := 0 to 1 shl n do
  begin
    a := 0;
    count := 0;
    for j := 0 to n - 1 do
      if ((i and (1 shl j)) > 0) then
      begin
        a := a or v[j];
        inc(count);
      end;
    if ((a = (1 shl 26) - 1) and (count < min)) then
    begin
      min := count;
      mini := i;
    end;
  end;
  if (min = 21) then
    writeln('Impossible')
  else
  begin
    writeln(min);
    for j := 0 to n - 1 do
      if ((mini and (1 shl j)) > 0) then
        writeln(s[j]);
  end;
end.