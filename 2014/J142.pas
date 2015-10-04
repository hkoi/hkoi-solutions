var
  n, a, b, c, d, x, y, i: longint;
begin
  a := 0;
  b := 0;
  c := 0;
  d := 0;
  read(n);
  for i := 1 to n do
  begin
    read(x);
    if (x <= 3) then
      read(y);
    if (x = 1) then
    begin
      a := a + y;
      b := b + y
    end;
    if (x = 2) then
    begin
      c := c + y;
      d := d + y
    end;
    if (x = 3) then
    begin
      if (b < y) then
      begin
        c := c - y + b;
        b := 0
      end
      else
        b := b - y;
      if (d < y) then
      begin
        a := a - y + d;
        d := 0
      end
      else
        d := d - y
    end;
    if (x = 4) then
      writeln(a, ' ', b)
  end
end.
