var
  pa, pb: array[0..6000] of double;
  cost: array[0..6000000] of double;
  n, m, i, j, plan: longint;
  d: double;
begin
  read(n);
  for i := 0 to n - 1 do
    read(pa[i], pb[i]);
  for i := n - 2 downto 0 do
    for j := 0 to i do
    begin
      if (pa[j] > pa[j + 1]) then
      begin
        d := pa[j];
        pa[j] := pa[j + 1];
        pa[j + 1] := d;
        d := pb[j];
        pb[j] := pb[j + 1];
        pb[j + 1] := d
      end
    end;
  pa[n] := 99999.0;
  pb[n] := 99999.0;
  plan := 0;
  for i := 0 to 6000000 do
  begin
    while (pa[plan] + pb[plan] * i / 1000.0 >
      pa[plan + 1] + pb[plan + 1] * i / 1000.0) do
      inc(plan);
    cost[i] := pa[plan] + pb[plan] * i / 1000.0
  end;
  read(m);
  for i := 1 to m do
  begin
    read(d);
    writeln(cost[round(d * 1000.0)] + 0.0000001 : 0 : 3)
  end
end.
