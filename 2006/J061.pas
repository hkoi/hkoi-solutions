const
  months: array[1..12] of string[3] = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
var
  d, m, y, n, i: longint;
  mm: string[3];
  dummy: char;
begin
  read(d, dummy, mm, y);
  read(n);
  for i := 1 to 12 do
    if (months[i] = mm) then
      m := i;
  for i := 1 to n do
  begin
    inc(d);
    if ((d = 32) or (d = 31) and ((m = 4) or (m = 6) or (m = 9) or (m = 11))) then
    begin
      inc(m);
      d := 1;
    end;
    if ((d = 30) and (m = 2) or (d = 29) and (m = 2) and ((y mod 4 > 0) or (y mod 100 = 0) and (y mod 400 > 0))) then
    begin
      inc(m);
      d := 1
    end;
    if (m = 13) then
    begin
      inc(y);
      m := 1
    end;
  end;
  writeln(d, ' ', months[m], ' ', y)
end.
