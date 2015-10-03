var
  a: array[1..50000] of longint;
  i, w, h, n, x, y, count: longint;
function serial(x, y: longint): longint;
begin
  serial := x * 50000 + y;
end;
function search(x, y: longint): boolean;
var
  l, r, mid, z: longint;
begin
  search := false;
  z := serial(x, y);
  l := 1;
  r := i;
  while (r >= l) do
  begin
    mid := (l + r) div 2;
    if (a[mid] = z) then
    begin
      search := true;
      exit
    end
    else if (a[mid] > z) then
      r := mid - 1
    else
      l := mid + 1
  end
end;
begin
  count := 0;
  read(w, h, n);
  for i := 1 to n do
  begin
    read(x, y);
    a[i] := serial(x, y);
    if (search(x - 4, y) and search(x - 3, y) and search(x - 2, y + 3) and search(x - 2, y + 2) and search(x - 1, y)) then
      inc(count);
    if (search(x - 4, y) and search(x - 3, y) and search(x - 2, y - 3) and search(x - 2, y - 2) and search(x - 1, y)) then
      inc(count);
    if (search(x - 3, y - 2) and search(x - 2, y - 2) and search(x, y - 4) and search(x, y - 3) and search(x, y - 1)) then
      inc(count);
    if (search(x - 3, y - 2) and search(x - 3, y - 1) and search(x - 3, y + 1) and search(x - 3, y + 2) and search(x - 1, y)) then
      inc(count);
  end;
  writeln(count)
end.
