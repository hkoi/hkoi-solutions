var
  a, b: array[0..1000] of longint;
  n, c, i, j, t: longint;
begin
  read(n, c);
  for i := 1 to n do
    read(a[i]);
  for i := n - 1 downto 1 do
    for j := 1 to i do
      if (a[j] > a[j + 1]) then
      begin
        t := a[j];
        a[j] := a[j + 1];
        a[j + 1] := t
      end;
  if (n mod 2 = 1) then
  begin
    i := 1;
    while (i <= n) do
    begin
      b[i] := a[i];
      i := i + 2
    end;
    i := 2;
    while (i <= n) do
    begin
      b[i] := a[n - i + 1];
      i := i + 2
    end
  end
  else
  begin
    for i := 1 to n div 2 do
    begin
      if (i mod 2 = 1) then
        b[i] := a[i]
      else
        b[n - i + 1] := a[i]
    end;
    for i := n div 2 + 1 to n do
    begin
      if (i mod 2 = 1) then
        b[i + 1] := a[i]
      else
        b[n - i + 2] := a[i]
    end;
  end;
  for i := 1 to n - 1 do
    write(b[i], ' ');
  writeln(b[n])
end.
