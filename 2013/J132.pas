var
  a, b: array[1..50000] of string;
  n, m, front, i, stalled, k: longint;
  c: char;
begin
  readln(n);
  i := 1;
  a[1] := '';
  while (true) do
  begin
    read(c);
    if ((c >= '0') and (c <= '9')) then
      a[i] := a[i] + c
    else
    begin
      inc(i);
      a[i] := ''
    end;
    if (eoln) then
      break
  end;
  stalled := 0;
  for front := 1 to n - 1 do
  begin
    if ((length(a[front]) = 12) and (length(a[front + 1]) = 8) and (stalled < 2)) then
    begin
      b[front] := a[front + 1];
      a[front + 1] := a[front];
      inc(stalled)
    end
    else if ((length(a[front]) = 8) and (length(a[front + 1]) = 8) and (a[front][1] = '0') and (a[front + 1][1] = '1') and (stalled = 0)) then
    begin
      b[front] := a[front + 1];
      a[front + 1] := a[front];
      inc(stalled)
    end
    else
    begin
      b[front] := a[front];
      stalled := 0
    end
  end;
  b[n] := a[n];
  read(m);
  for i := 1 to m do
  begin
    read(k);
    write(b[k]);
    if (i = m) then
      writeln
    else
      write(' ')
  end
end.
