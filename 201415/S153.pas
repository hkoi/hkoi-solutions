var
  s: ansistring;
  t: array[1..300000] of char;
  u: array[1..300000] of longint;
  l: array['A'..'Z', 1..300000] of longint;
  freq: array['A'..'Z'] of longint;
  n, m, cur, i: longint;
  c: char;
begin
  read(s);
  n := length(s);
  for c := 'A' to 'Z' do
    freq[c] := 0;
  for i := 1 to n do
    if (s[i] = '.') then
      cur := i
    else
    begin
      inc(freq[s[i]]);
      l[s[i]][freq[s[i]]] := i
    end;
  m := 2;
  for c := 'A' to 'Z' do
    for i := 1 to freq[c] do
    begin
      t[m] := c;
      u[m] := i;
      inc(m)
    end;
  for i := 1 to n - 1 do
  begin
    write(t[cur]);
    cur := l[t[cur]][u[cur]]
  end;
  writeln('.')
end.
