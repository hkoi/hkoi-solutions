var
  a: array[0..200000] of longint;
  n, k, m, mi, i: longint;
begin
  for i := 0 to 200000 do
    a[i] := 0;
  read(n);
  m := 0;
  for i := n - 1 downto 0 do
  begin
    read(k);
    inc(a[k + i]);
    if (a[k + i] > m) then
    begin
      m := a[k + i];
      mi := k + i
    end
    else if (a[k + i] = m) then
      if (k + i > mi) then
        mi := k + i
  end;
  for i := 1 to n - 1 do
  begin
    read(k);
    inc(a[k + i]);
    if (a[k + i] > m) then
    begin
      m := a[k + i];
      mi := k + i
    end
    else if (a[k + i] = m) then
      if (k + i > mi) then
        mi := k + i
  end;
  writeln(2 * n - m - 1);
  writeln(mi)
end.
