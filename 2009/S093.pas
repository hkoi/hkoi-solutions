var
  right: array[0..2999] of int64;
  n, m, a, b, i, j: longint;
  max: int64;
begin
  for i := 0 to 2999 do
    right[i] := 0;
  read(n, m);
  for i := 1 to n do
  begin
    read(a, b);
    max := 0;
    for j := m - 1 downto -1 do
    begin
      if (j = -1) then
        break;
      if (right[j] > max) then
      begin
        if (m - j - 1 >= b) then
          break;
        max := right[j];
      end
    end;
    right[j + b] := max + a;
    writeln(max, ' ', j + 1)
  end
end.
