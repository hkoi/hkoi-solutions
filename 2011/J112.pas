var
  n, m, x, y, i: longint;
  count, twos, threes, ans: longint;
begin
  read(n, m, x);
  count := 1;
  twos := 0;
  threes := 0;
  for i := 1 to n - 1 do
  begin
    read(x, y);
    if (x = y) then
      inc(count)
    else
      count := 1;
    if (count mod 3 = 0) then
    begin
      dec(twos);
      inc(threes)
    end;
    if (count mod 3 = 2) then
      inc(twos)
  end;
  ans := threes * 2 + twos;
  if (ans + m > n) then
    ans := n - m;
  writeln(ans)
end.
