var
  freq, sorter: array[1..26] of longint;
  s: ansistring;
  k, len, i, j, t, d: longint;
  c: char;
begin
  read(k, c);
  readln(c);
  read(s);
  len := length(s);
  for i := 1 to 26 do
    freq[i] := 0;
  for i := 1 to len do
  begin
    if ((s[i] >= 'A') and (s[i] <= 'Z') or
        (s[i] >= 'a') and (s[i] <= 'z')) then
      inc(freq[ord(s[i]) mod 32]);
  end;
  for i := 1 to 26 do
    sorter[i] := i;
  for i := 25 downto 1 do
    for j := 1 to i do
      if (freq[sorter[j]] < freq[sorter[j + 1]]) then
      begin
        t := sorter[j];
        sorter[j] := sorter[j + 1];
        sorter[j + 1] := t
      end;
  d := sorter[k] - ord(c) mod 32;
  if (d < 0) then
    d := d + 26;
  for i := 1 to len do
    if ((s[i] >= 'A') and (s[i] <= 'Z')) then
      write(chr(65 + (ord(s[i]) - 65 + 26 - d) mod 26))
    else if ((s[i] >= 'a') and (s[i] <= 'z')) then
      write(chr(97 + (ord(s[i]) - 97 + 26 - d) mod 26))
    else
      write(s[i]);
  writeln
end.
