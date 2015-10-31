var
  vars: array['A'..'Z'] of longint;
  i, n, first, second, pos: longint;
  s: string;
  j: char;
  add: boolean;
begin
  for j := 'A' to 'Z' do
    vars[j] := -1000001;
  readln(n);
  for i := 1 to n do
  begin
    readln(s);
    s[length(s) + 1] := ' ';
    if (s[3] >= 'A') then
    begin
      first := vars[s[3]];
      pos := 4
    end
    else
    begin
      first := 0;
      pos := 3;
      if (s[3] = '-') then
        pos := 4;
      while ((s[pos] >= '0') and (s[pos] <= '9')) do
      begin
        first := first * 10 + ord(s[pos]) - ord('0');
        inc(pos)
      end;
      if (s[3] = '-') then
        first := -first
    end;
    if (s[pos] = ' ') then
    begin
      vars[s[1]] := first;
      continue
    end;
    add := s[pos] = '+';
    inc(pos);
    if (s[pos] >= 'A') then
      second := vars[s[pos]]
    else
    begin
      second := 0;
      if (s[pos] = '-') then
      begin
        add := not add;
        inc(pos)
      end;
      while ((s[pos] >= '0') and (s[pos] <= '9')) do
      begin
        second := second * 10 + ord(s[pos]) - ord('0');
        inc(pos)
      end;
    end;
    if (add) then
      vars[s[1]] := first + second
    else
      vars[s[1]] := first - second
  end;
  for j := 'A' to 'Z' do
    if (vars[j] <> -1000001) then
      writeln(j, '=', vars[j])
end.