var
  n, m, i, j, l, p, q, req: longint;
  k: char;
  ones: array[1..20, '0'..'1'] of longint;
  zeros: array[1..20, '0'..'1'] of longint;
  done: array[1..20] of boolean;
  r: array[0..1048575] of longint;
  s: array[0..1048575] of string[20];
  o1, o3: array[1..20] of longint;
  o2: array[1..20] of char;
  found: boolean;
begin
  readln(n);
  m := 1 shl n;
  for i := 0 to m - 1 do
  begin
    readln(s[i]);
    readln(r[i]);
    for j := 1 to n do
      if (r[i] = 1) then
        inc(ones[j][s[i][j]])
      else
        inc(zeros[j][s[i][j]])
  end;
  req := m div 2;
  for i := 1 to n - 1 do
  begin
    found := false;
    for j := 1 to n do
    begin
      if (done[j]) then
        continue;
      for k := '0' to '1' do
      begin
        if ((ones[j][k] = req) or (zeros[j][k] = req)) then
        begin
          o1[i] := j;
          o2[i] := k;
          if (ones[j][k] = req) then
            o3[i] := 1
          else
            o3[i] := 0;
          for p := 0 to m - 1 do
            if ((r[p] <> - 1) and (s[p][j] = k)) then
            begin
              for q := 1 to n do
                if (r[p] = 1) then
                  dec(ones[q][s[p][q]])
                else
                  dec(zeros[q][s[p][q]]);
              r[p] := -1
            end;
          done[j] := true;
          found := true;
          break
        end;
      end
    end;
    if (not found) then
    begin
      writeln('Impossible');
      halt
    end;
    req := req div 2
  end;
  for j := 1 to n do
    if (not done[j]) then
    begin
      if (ones[j]['0'] + ones[j]['1'] <> 1) then
      begin
        writeln('Impossible');
        halt
      end;
      for i := 1 to n - 1 do
        writeln(o1[i], ' ', o2[i], ' ', o3[i]);
      write(j, ' ');
      if (ones[j]['0'] > ones[j]['1']) then
        writeln('0')
      else
        writeln('1')
    end
end.
