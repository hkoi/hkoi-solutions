var
  r, g, w, x, y, z, p, q: longint;
  red, green, ans: longint;
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
function divide(a, b: longint): longint;
begin
  if (a < 0) then
    divide := 0
  else if (b = 0) then
    divide := 9999999
  else
    divide := a div b
end;
begin
  read(r, g, w, x, y, z, p, q);
  ans := 0;
  for red := 0 to r do
  begin
    green := min((r - red * (w - 1)) div y, divide(g - red * x - 1, z - 1));
    if (green < 1) then
      break;
    ans := max(ans, red * p + green * q)
  end;
  for green := 0 to g do
  begin
    red := min(divide(r - green * y - 1, w - 1), (g - green * (z - 1)) div x);
    if (red < 1) then
      break;
    ans := max(ans, red * p + green * q)
  end;
  writeln(ans + r * p + g * q)
end.
