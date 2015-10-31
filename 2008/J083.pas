var
  n, sum, k: int64;
  i: longint;
begin
  read(n);
  sum := 0;
  k := 1;
  for i := 0 to 58 do
  begin
    sum := sum + n div (k * 2) * k;
    if (n mod (k * 2) >= k) then
      sum := sum + n mod k + 1;
    k := k * 2
  end;
  writeln(sum)
end.
