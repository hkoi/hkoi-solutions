var
  s: array[0..20000] of string;
  ahead, atail, bhead, btail: array[0..20000] of longint;
  aa, bb: array[0..20000] of longint;
  l, n, m, i, j: longint;
  q: string;
  akey, bkey, search, diff: longint;
begin
  readln(n, l);
  for i := 0 to 20000 do
  begin
    ahead[i] := -1;
    bhead[i] := -1;
    atail[i] := -1;
    btail[i] := -1
  end;
  for i := 1 to n do
  begin
    readln(q);
    s[i] := q;
    akey := ord(s[i][1]) * 26 * 26 + ord(s[i][2]) * 26 + ord(s[i][3]) - 67488;
    bkey := ord(s[i][l - 2]) * 26 * 26 + ord(s[i][l - 1]) * 26 + ord(s[i][l]) - 67488;
    if (ahead[akey] = -1) then
      ahead[akey] := i
    else
      aa[atail[akey]] := i;
    atail[akey] := i;
    if (bhead[bkey] = -1) then
      bhead[bkey] := i
    else
      bb[btail[bkey]] := i;
    btail[bkey] := i;
    aa[i] := -1;
    bb[i] := -1
  end;
  readln(m);
  for i := 1 to m do
  begin
    readln(q);
    akey := ord(q[1]) * 26 * 26 + ord(q[2]) * 26 + ord(q[3]) - 67488;
    bkey := ord(q[l - 2]) * 26 * 26 + ord(q[l - 1]) * 26 + ord(q[l]) - 67488;
    search := ahead[akey];
    diff := 0;
    while (search <> -1) do
    begin
      diff := 0;
      for j := 1 to l do
      begin
        if (q[j] <> s[search][j]) then
          inc(diff);
        if (diff = 2) then
          break
      end;
      if (diff = 1) then
      begin
        writeln(s[search]);
        break
      end;
      search := aa[search]
    end;
    if (diff = 1) then
      continue;
    search := bhead[bkey];
    diff := 0;
    while (search <> -1) do
    begin
      diff := 0;
      for j := 1 to l do
      begin
        if (q[j] <> s[search][j]) then
          inc(diff);
        if (diff = 2) then 
          break
      end;
      if (diff = 1) then
      begin
        writeln(s[search]);
        break
      end;
      search := bb[search]
    end
  end
end.
