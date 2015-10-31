var
  gifts: array[1..500000] of longint;
  last: array[1..1000] of longint;
  w, v: array[1..50000] of longint;
  n, m, i: longint;
begin
  for i := 1 to 1000 do
    last[i] := 1;
  read(n, m);
  for i := 1 to n do
    read(gifts[i]);
  for i := 1 to m do
    read(w[i], v[i]);
  for i := 1 to n do
  begin
    while ((last[gifts[i]] <= m) and ((w[last[gifts[i]]] < gifts[i]) or (v[last[gifts[i]]] < gifts[i]))) do
      inc(last[gifts[i]]);
    if (last[gifts[i]] = m + 1) then
    begin
      writeln('Impossible');
      halt
    end;
    v[last[gifts[i]]] := v[last[gifts[i]]] - gifts[i];
    gifts[i] := last[gifts[i]]
  end;
  for i := 1 to n - 1 do
    write(gifts[i], ' ');
  writeln(gifts[n])
end.
