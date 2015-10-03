var
  n, i, j: longint;
begin
  read(n);
  for i := 0 to n - 1 do
  begin
    for j := i downto 1 do
      write(i * j + 1, ' ');
    writeln(1)
  end;
end.
