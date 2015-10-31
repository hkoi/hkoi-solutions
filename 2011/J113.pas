var
  n, twos, i: longint;
begin
  read(n);
  twos := 0;
  while (n >= 4) do
  begin
    inc(twos);
    n := n div 2
  end;
  if (n = 3) then
    write(3);
  if (n = 2) then
    inc(twos);
  for i := 1 to twos do
    write(2);
  writeln
end.
