var
  a, b, c, d: array[1..1000] of longint;
  n, i, j: longint;
  sum: int64;
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
  read(n);
  sum := 0;
  for i := 1 to n do
  begin
    read(a[i], b[i], c[i], d[i]);
    sum := sum + int64(c[i] - a[i]) * (d[i] - b[i] + 1);
    sum := sum + int64(c[i] - a[i] + 1) * (d[i] - b[i]);
    for j := 1 to i - 1 do
    begin
      if ((a[i] = c[j]) or (c[i] = a[j])) then
        sum := sum - max(0, d[i] - b[i] + d[j] - b[j] - max(d[i], d[j]) + min(b[i], b[j]));
      if ((b[i] = d[j]) or (d[i] = b[j])) then
        sum := sum - max(0, c[i] - a[i] + c[j] - a[j] - max(c[i], c[j]) + min(a[i], a[j]))
    end
  end;
  writeln(sum)
end.
