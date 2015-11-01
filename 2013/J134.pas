var
  a: array[0..1000, 0..1000] of char;
  c: array[0..1000, 0..1000] of longint;
  t: array['A'..'Z'] of longint;
  w, h, p, r, l, i, j, x, y, ww, hh, ans: longint;
  ch: char;
  tx, ty: double;
  ok: boolean;
begin
  read(w, h, p, r, l);
  for i := 0 to p - 1 do
    read(t[chr(65 + i)]);
  readln;
  for i := h - 1 downto 0 do
  begin
    for j := 0 to w - 1 do
      read(a[i][j]);
    readln
  end;
  for i := 0 to h - 1 do
  begin
    c[i][w - 1] := 1;
    for j := w - 2 downto 0 do
      if (a[i][j] = a[i][j + 1]) then
        c[i][j] := c[i][j + 1] + 1
      else
        c[i][j] := 1
  end;
  ans := 0;
  for i := 1 to r do
  begin
    read(tx, ty);
    x := trunc(tx);
    y := trunc(ty);
    if (x = tx) then
      ww := l
    else
      ww := l + 1;
    if (y = ty) then
      hh := l
    else
      hh := l + 1;
    if ((tx < 0) or (ty < 0) or (x + ww > w) or (y + hh > h)) then
      continue;
    ok := true;
    for j := 0 to hh - 1 do
      if ((a[y + j][x] <> a[y][x]) or (c[y + j][x] < ww)) then
      begin
        ok := false;
        break
      end;
    if (ok) then
      ans := ans + t[a[y][x]]
  end;
  writeln(ans)
end.
