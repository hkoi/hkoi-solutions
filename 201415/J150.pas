var
  n, k, i, j: longint;
begin
  read(n);
  k := 1;
  for i := 1 to n do
    for j := 1 to n do
    begin
      write(k);
      if (j = n) then
        writeln
      else
      begin
        write(' ');
        k := k + 4
      end
    end
end.
