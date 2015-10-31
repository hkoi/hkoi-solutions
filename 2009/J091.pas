var
  a, b, ds, de: array[0..200000] of longint;
  c: array[0..400000] of longint;
  n, m, i, aa, bb, sum, count: longint;
begin
  read(n);
  for i := 0 to n - 1 do
  begin
    read(a[i * 2], a[i * 2 + 1]);
    inc(a[i * 2 + 1])
  end;
  a[2 * n] := 999999999;
  read(m);
  for i := 0 to m - 1 do
  begin
    read(b[i * 2], b[i * 2 + 1]);
    inc(b[i * 2 + 1])
  end;
  b[2 * m] := 999999999;
  aa := 0;
  bb := 0;
  for i := 0 to 2 * (m + n) - 1 do
  begin
    if (a[aa] < b[bb]) then
    begin
      if (aa mod 2 = 0) then
        c[i] := a[aa]
      else
        c[i] := -a[aa];
      inc(aa)
    end
    else
    begin
      if (bb mod 2 = 0) then
        c[i] := b[bb]
      else
        c[i] := -b[bb];
      inc(bb)
    end;
  end;
  c[2 * (m + n)] := 999999999;
  sum := 0;
  count := 0;
  i := 0;
  while (i < 2 * (m + n)) do
  begin
    if (c[i] = -c[i + 1]) then
    begin
      i := i + 2;
      continue
    end;
    if (c[i] > 0) then
    begin
      if (sum = 0) then
        ds[count] := c[i];
      inc(sum)
    end
    else
    begin
      dec(sum);
      if (sum = 0) then
      begin
        de[count] := -c[i] - 1;
        inc(count)
      end;
    end;
    inc(i)
  end;
  writeln(count);
  for i := 0 to count - 1 do
    writeln(ds[i], ' ', de[i]);
end.
