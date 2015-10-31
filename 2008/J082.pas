var
  n, k, sum, i:longint;
begin
  read(n);
  sum := 0;
  for i := 1 to n do
  begin
    read(k);
    sum := sum + k;
    if (k = n - i - 1) then
    begin
      writeln(n - i - 1);
      break
    end
    else if (k >= n - i) then
    begin
      writeln(n - i);
      break
    end
  end
end.
