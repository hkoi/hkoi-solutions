var
  x: array[1..200000] of longint;
  i, j: longint;
  n, a, b, s, sa, t: int64;
  space: boolean;
begin
  read(n, a, b);
  for i := 1 to a do
    x[i] := 1;
  s := n * (n + 1) div 2;
  sa := a * (a + 1) div 2;
  t := s div 2;
  i := a;
  j := n;
  while ((i > 0) and (sa < t)) do
  begin
    if (t - sa >= b) then
    begin
      sa := sa + b;
      x[i] := 0;
      x[j] := 1
    end
    else
    begin
      x[i] := 0;
      x[i + t - sa] := 1;
      break
    end;
    dec(i);
    dec(j);
  end;
  space := false;
  for i := 1 to n do
  begin
    if (x[i] = 0) then 
      continue;
    if (space) then
      write(' ');
    write(i);
    space := true
  end;
  writeln;
  space := false;
  for i := 1 to n do
  begin
    if (x[i] = 1) then
      continue;
    if (space) then
      write(' ');
    write(i);
    space := true
  end;
  writeln
end.
