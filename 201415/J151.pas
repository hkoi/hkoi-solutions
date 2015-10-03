var
  n, m, i: longint;
begin
  read(n, m);
  if ((m > 1000000) or (m < -1000000)) then
    for i := 1 to (n - 1) div 2 do
      write(i, ' ', -i, ' ')
  else
    for i := 1 to (n - 1) div 2 do
      write(i + 2000000, ' ', -i - 2000000, ' ');
  if (n mod 2 = 0) then
    if (m = 0) then
      writeln('-99999999 99999999')
    else
      writeln(0, ' ', m)
  else
    writeln(m)
end.
