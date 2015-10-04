var
  s: array[0..89] of ansistring;
  a, b: ansistring;
  i, j, k, counta, countb, len: longint;
begin
  for i := 10 to 99 do
  begin
    setlength(s[i - 10], 100);
    s[i - 10][1] := chr(i div 10 + ord('0'));
    s[i - 10][2] := chr(i mod 10 + ord('0'));
    for k := 3 to 100 do
    begin
      j := (ord(s[i - 10][k - 2]) - ord('0')) * (ord(s[i - 10][k - 1]) - ord('0'));
      s[i - 10][k] := chr(j mod 10 + ord('0'))
    end
  end;
  readln(a);
  readln(b);
  len := length(a);
  if (len = 1) then
    counta := ord(a[1]) - ord('0') - 1
  else if (len = 2) then
    counta := (ord(a[1]) - ord('0')) * 10 + (ord(a[2]) - ord('0')) - 1
  else
  begin
    i := 0;
    while (i < 90) do
    begin
      setlength(s[i], len);
      if (s[i] >= a) then
        break;
      inc(i)
    end;
    counta := 90 * (len - 2) + i + 9;
  end;
  len := length(b);
  if (len = 1) then
    countb := ord(b[1]) - ord('0')
  else if (len = 2) then
    countb := (ord(b[1]) - ord('0')) * 10 + (ord(b[2]) - ord('0'))
  else
  begin
    i := 0;
    while (i < 90) do
    begin
      setlength(s[i], len);
      if (s[i] > b) then
        break;
      inc(i)
    end;
    countb := 90 * (len - 2) + i + 9
  end;
  writeln(countb - counta)
end.
