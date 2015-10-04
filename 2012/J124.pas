var
  x, y: array[1..10000] of longint;
  n, w, h, s, xx, yy, t, i: longint;
  x1, x2, y1, y2, x3, x4, y3, y4: longint;
  d, sum: int64;
function min(a, b: longint): longint;
begin
  if (a < b) then
    min := a
  else
    min := b
end;
function max(a, b: longint): longint;
begin
  if (a > b) then
    max := a
  else
    max := b
end;
begin
  read(n, w, h, s);
  for i := 1 to n do
    read(x[i], y[i]);
  read(xx, yy, t);
  sum := 0;
  for i := 1 to n do
  begin
    x1 := max(0, x[i] - t);
    x2 := min(w, x[i] + t);
    y1 := max(0, y[i] - t);
    y2 := min(h, y[i] + t);
    sum := sum + int64(x2 - x1) * (y2 - y1);
    d := int64(s) * t;
    if (d > 1000000) then
      d := 1000000;
    x3 := max(0, xx - d);
    x4 := min(w, xx + d);
    y3 := max(0, yy - d);
    y4 := min(h, yy + d);
    sum := sum - max(0, x2 - x1 + x4 - x3 - max(x2, x4) + min(x1, x3)) *
           int64(max(0, y2 - y1 + y4 - y3 - max(y2, y4) + min(y1, y3)))
  end;
  writeln(sum)
end.
