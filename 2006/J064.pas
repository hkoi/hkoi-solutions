var
  a: array[1..500, 0..500] of longint;
  b, covered: array[1..500] of boolean;
  i, j, n: longint;
begin
  for i := 1 to 500 do
  begin
    covered[i] := false;
    b[i] := false
  end;
  read(n);
  for i := 1 to n do
  begin
    read(a[i][0]);
    for j := 1 to a[i][0] do
      read(a[i][j])
  end;
  for i := n downto 1 do
  begin
    if (not covered[i]) then
    begin
      b[i] := true;
      for j := 1 to a[i][0] do
      begin
        if (covered[a[i][j]]) then
        begin
          writeln(-1);
          halt
        end;
        covered[a[i][j]] := true
      end
    end
  end;
  for i := 1 to n do
    if (b[i]) then
      writeln(i)
end.
