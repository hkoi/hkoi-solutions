var
  valid: array[1..100, 1..100] of boolean;
  n, m, k, i, j, from, too, pieces, a: longint;
  ok:boolean;
begin
  read(n, m, k);
  for i := 1 to m do
    for j := 1 to n do
      valid[i][j] := i = 1;
  for i := 1 to k do
  begin
    read(from, too, pieces);
    for j := 1 to pieces do
    begin
      read(a);
      valid[too][a] := valid[too][a] or valid[from][a]
    end
  end;
  for i := 1 to m do
  begin
    ok := true;
    for j := 1 to n do
      ok := ok and valid[i][j];
    if (ok) then
      writeln(i)
  end
end.
