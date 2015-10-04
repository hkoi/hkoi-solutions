var
  n, i, mode, start_y, start_w: longint;
  s: ansistring;
begin
  readln(n);
  read(s);
  setlength(s, n + 1);
  s[n + 1] := 'G';
  mode := 0;
  for i := 1 to n + 1 do
  begin
    if ((mode = 0) and (s[i] = 'Y')) then
    begin
      mode := 11;
      start_y := i
    end
    else if ((mode = 0) and (s[i] = 'W')) then
    begin
      mode := 22;
      start_w := i
    end
    else if ((mode = 11) and (s[i] = 'G')) then
    begin
      mode := 0;
      writeln('Grow ', start_y, ' ', i - 1)
    end
    else if ((mode = 12) and (s[i] = 'G')) then
    begin
      mode := 0;
      writeln('Grow ', start_w, ' ', i - 1);
      writeln('Grow ', start_y, ' ', i - 1)
    end
    else if ((mode = 21) and (s[i] = 'G')) then
    begin
      mode := 0;
      writeln('Blow ', start_y, ' ', i - 1);
      writeln('SuperGrow ', start_w, ' ', i - 1)
    end
    else if ((mode = 22) and (s[i] = 'G')) then
    begin
      mode := 0;
      writeln('SuperGrow ', start_w, ' ', i - 1)
    end
    else if ((mode = 11) and (s[i] = 'W')) then
    begin
      mode := 12;
      start_w := i
    end
    else if ((mode = 12) and (s[i] = 'Y')) then
    begin
      mode := 11;
      writeln('Grow ', start_w, ' ', i - 1)
    end
    else if ((mode = 22) and (s[i] = 'Y')) then
    begin
      mode := 21;
      start_y := i
    end
    else if ((mode = 21) and (s[i] = 'W')) then
    begin
      mode := 22;
      writeln('Blow ', start_y, ' ', i - 1)
    end
  end;
  writeln('Finish')
end.
