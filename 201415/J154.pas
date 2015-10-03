var
  h: array[1..100001] of int64;
  n, target, i: longint;
  money, missing, ffcycles, years: int64;
begin
  read(n, money);
  for i := 1 to n do
  begin
    read(h[i]);
    if (i >= 2) then
      if ((h[i - 1] = h[1]) and (money + h[1] < h[i])) then
      begin
        writeln('Impossible');
        halt
      end
  end;
  if (n <= 2) then
  begin
    writeln(0);
    halt
  end;
  money := money + h[1];
  h[n + 1] := 9999999999999999;
  target := 2;
  years := 0;
  while (true) do
  begin
    while (h[target] <= money) do
      inc(target);
    if (target = n + 1) then
    begin
      { check if can buy 1 year earlier}
      if ((money + h[1] >= h[n] * 2) and (years > 0)) then
        dec(years);
      writeln(years);
      halt
    end;
    missing := h[target] - money;
    { fast forward }
    ffcycles := (missing - 1) div (h[target - 1] - h[1]) div 2 + 1;
    if (ffcycles < 0) then
      ffcycles := 0;
    years := years + 4 * ffcycles;
    money := money + ffcycles * (h[target - 1] - h[1]) * 2
  end
end.
