var
  n, i, j: longint;
begin
  read(n);
  for i := 1 to n do
  begin
    for j := 0 to n - 1 do
    begin
      write(i * i + j * i);
      if (j = n - 1) then
        writeln
      else
        write(' ')
    end
  end
end.
