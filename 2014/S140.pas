var
  n, i, j: longint;
begin
  read(n);
  for i := n downto 1 do
  begin
    for j := 0 to n - 1 do
    begin
      write(i * (i + 1) div 2 * n - i * j);
      if (j = n - 1) then
        writeln
      else
        write(' ')
    end
  end
end.
