var
  a: array[1..1000, 1..1000] of longint;
  r, c: array[1..1000] of longint;
  o1: array[1..2000000] of char;
  o2: array[1..2000000] of longint;
  n, t, o, i, j: longint;
begin
  read(n);
  for i := 1 to n do
  begin
    for j := 1 to n do
      read(a[i][j]);
    r[i] := i;
    c[i] := i
  end;
  o := 1;
  for i := n - 1 downto 1 do
    for j := 1 to i do
    begin
      if (a[r[j]][1] > a[r[j + 1]][1]) then
      begin
        o1[o] := 'R';
        o2[o] := j;
        inc(o);
        t := r[j];
        r[j] := r[j + 1];
        r[j + 1] := t
      end;
      if (a[1][c[j]] > a[1][c[j + 1]]) then
      begin
        o1[o] := 'C';
        o2[o] := j;
        inc(o);
        t := c[j];
        c[j] := c[j + 1];
        c[j + 1] := t
      end
    end;
  t := 0;
  for i := 1 to n do
    for j := 1 to n do
    begin
      if (a[r[i]][c[j]] < t) then
      begin
        writeln('No solution');
        halt
      end;
      t := a[r[i]][c[j]]
    end;
  for i := 1 to o - 1 do
    writeln(o1[i], ' ', o2[i]);
  writeln('Z')
end.
