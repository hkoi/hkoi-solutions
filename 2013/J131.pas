var
  n, m, i, j, k: longint;
  a: array[1..10000] of longint;
  count, last: array[1..5] of longint;
  gameover: boolean;
begin
  readln(n, m);
  for i := 1 to m do
    a[i] := 0;
  for i := 1 to 100 do
  begin
    count[1] := 0;
    count[3] := 0;
    count[5] := 0;
    for j:= 1 to m do
    begin
      read(k);
      inc(count[k]);
      last[k] := j
    end;
    if (count[1] = 1) then
    begin
      a[last[1]] := a[last[1]] + 1;
      gameover := a[last[1]] >= n
    end;
    if (count[3] = 1) then
    begin
      a[last[3]] := a[last[3]] + 3;
      gameover := gameover or (a[last[3]] >= n)
    end;
    if (count[5] = 1) then
    begin
      a[last[5]] := a[last[5]] + 5;
      gameover := gameover or (a[last[5]] >= n)
    end;
    if (gameover) then
    begin
      writeln(i);
      for j := 1 to m-1 do
        if (a[j] > n) then
          write(n, ' ')
        else
          write(a[j], ' ');
      if (a[m] > n) then
        writeln(n)
      else
        writeln(a[m]);
      break
    end
  end
end.
