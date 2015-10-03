var
  a, b: ansistring;
  i, y, overtype, deleted: longint;
begin
  readln(a);
  readln(b);
  y := length(b);
  overtype := 0;
  deleted := 0;
  for i := 1 to y do
  begin
    if (b[i] = 'D') then
      inc(deleted)
    else if (b[i] = 'I') then
      overtype := 1 - overtype
    else
    begin
      write(b[i]);
      deleted := deleted + overtype
    end
  end;
  delete(a, 1, deleted);
  writeln(a)
end.
