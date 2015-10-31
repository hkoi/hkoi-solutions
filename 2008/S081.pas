var
  maxyears, dows: array[1..1000000] of longint;
  months, noleap, leap: array[0..100] of longint;
  m, w, l, mleap, dleap, yul, mul, dul: longint;
  a, b, n, sum, i, j, dow, max, maxcount: longint;
begin
  read(m, w, l, mleap, dleap);
  sum := 0;
  for i := 1 to m do
  begin
    read(months[i]);
    sum := sum + months[i];
  end;
  read(yul, mul, dul, a, b);

  // first we assume the day before 1st Jan, 1 is day 0
  dow := 0;
  for i := 1 to 1000000 do
  begin
    dows[i] := dow;
    dow := dow + sum;
    if (i mod l = 0) then
      dow := dow + dleap;
    dow := dow mod w;
  end;

  // dow of given date
  n := dows[yul];
  for i := 1 to mul - 1 do
  begin
    n := n + months[i];
    if ((yul mod l = 0) and (i = mleap)) then
      n := n + dleap;
  end;
  n := (n + dul) mod w;

  // simulate all different day of week on day before 1st Jan
  for i := 0 to w - 1 do
  begin
    noleap[i] := 0;
    dow := i;
    for j := 1 to m do
    begin
      if ((months[j] >= 13) and ((dow + 13) mod w = n)) then
        inc(noleap[i]);
      dow := dow + months[j];
    end;
  end;
  for i := 0 to w - 1 do
  begin
    leap[i] := 0;
    dow := i;
    for j := 1 to m do
    begin
      if ((months[j] >= 13) or ((j = mleap) and (months[j] + dleap >= 13))) then
        if ((dow + 13) mod w = n) then
          inc(leap[i]);
      dow := dow + months[j];
      if (j = mleap) then
        dow := dow + dleap;
    end;
  end;

  // lastly scan through year a to b to find max
  max := 0;
  maxcount := 0;
  for i := a to b do
  begin
    if (i mod l = 0) then
    begin
      if (leap[dows[i]] > max) then
      begin
        max := leap[dows[i]];
        maxyears[1] := i;
        maxcount := 1;
      end
      else if (leap[dows[i]] = max) then
      begin
        maxyears[maxcount + 1] := i;
        inc(maxcount);
      end
    end
    else if (noleap[dows[i]] > max) then
    begin
      max := noleap[dows[i]];
      maxyears[1] := i;
      maxcount := 1;
    end
    else if (noleap[dows[i]] = max) then
    begin
      maxyears[maxcount + 1] := i;
      inc(maxcount);
    end;
  end;

  //output
  writeln(max);
  for i := 1 to maxcount - 1 do
    write(maxyears[i], ' ');
  writeln(maxyears[maxcount])
end.