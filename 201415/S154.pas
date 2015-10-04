var
  a: array[0..1001, 0..1001] of longint;
  b: array[0..1001] of ansistring;
  n, m, i, j, xprev, yprev, minn: longint;
  minx1, miny1, minx2, miny2, mindir, minstartdir: longint;
  s: ansistring;
procedure check(x1, y1, x2, y2, dir, startdir: longint; print: boolean);
var
  x, y, d, count: longint;
begin
  a[xprev][yprev] := 0;
  a[x2][y2] := 1;
  xprev := x2;
  yprev := y2;
  if (x2 - x1 + abs(y1 - y2) - 1 <> m) then
    exit;
  x := x1;
  y := y1;
  d := startdir;
  count := 0;
  while ((x <> x2) or (y <> y2)) do
  begin
    if (d = 2) then
    begin
      if (a[x + 1][y] = 1) then
        inc(x)
      else
      begin
        if (print) then
          if (dir = 1) then
            b[x][y] := '\'
          else
            b[x][y] := '/';
        inc(count);
        d := dir;
        if (d = 0) then
        begin
          dec(y);
          if (a[x][y] = 0) then
            exit
        end;
        if (d = 1) then
        begin
          inc(y);
          if (a[x][y] = 0) then
            exit
        end
      end
    end
    else if (d = 0) then
    begin
      if (a[x][y - 1] = 1) then
        dec(y)
      else
      begin
        if (print) then
          if (dir = 1) then
            b[x][y] := '\'
          else
            b[x][y] := '/';
        inc(count);
        d := 2;
        inc(x);
        if (a[x][y] = 0) then
          exit
      end
    end
    else
    begin
      if (a[x][y + 1] = 1) then
        inc(y)
      else
      begin
        if (print) then
          if (dir = 1) then
            b[x][y] := '\'
          else
            b[x][y] := '/';
        inc(count);
        d := 2;
        inc(x);
        if (a[x][y] = 0) then
          exit
      end
    end
  end;
  if (not print) then
  begin
    if (count < minn) then
    begin
      minn := count;
      minx1 := x1;
      miny1 := y1;
      minx2 := x2;
      miny2 := y2;
      mindir := dir;
      minstartdir := startdir
    end
  end
  else
    for i := 1 to n do
    begin
      for j := 1 to n do
        write(b[i][j]);
      writeln
    end
end;
begin
  readln(n);
  for i := 0 to n + 1 do
    for j := 0 to n + 1 do
      a[i][j] := 0;
  m := 0;
  for i := 1 to n do
  begin
    readln(s);
    setlength(b[i], n);
    for j := 1 to n do
    begin
      if (s[j] = '#') then
      begin
        a[i][j] := 1;
        inc(m)
      end;
      b[i][j] := '.'
    end
  end;
  minn := 999999;
  for i := 1 to n do
    for j := 1 to n do
    begin
      { 0 = left, 1 = right }
      check(0, i, j, 0, 0, 2, false); { J }
      check(0, i, j, n + 1, 1, 2, false); { L }
      if (i <= j) then
      begin
        check(0, i, n + 1, j, 1, 2, false); { | }
        check(i, 0, j, n + 1, 1, 1, false) { Z }
      end
      else
      begin
        check(0, i, n + 1, j, 0, 2, false);
        check(j, n + 1, i, 0, 0, 0, false)
      end;
      check(i, 0, n + 1, j, 1, 1, false); { 7 }
      check(i, n + 1, n + 1, j, 0, 0, false) { r }
    end;
  if (minn <> 999999) then
    check(minx1, miny1, minx2, miny2, mindir, minstartdir, true)
  else
    writeln('Impossible')
end.
