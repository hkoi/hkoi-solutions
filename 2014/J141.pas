var
  n, m, k, batch, last_batch, page_of_batch: longint;
  tm, ts, method0, method1, method2, pred_batch, batch_end: int64;
begin
  read(n, m, k, tm, ts);
  batch := (k - 1) div m + 1;
  last_batch := (n - 1) div m + 1;
  page_of_batch := k - (batch - 1) * m;
  method0 := ts * (k - 1);
  if (tm > ts) then
    pred_batch := tm * (batch - 2) + tm
  else
    pred_batch := tm * (batch - 2) + ts;
  method1 := pred_batch + ts * page_of_batch;
  batch_end := tm * (batch - 1) + ts;
  if (last_batch = batch) then
    method2 := batch_end + ts * (n - k)
  else
    method2 := batch_end + ts * (m - page_of_batch);
  if (tm > ts * m) then
    method0 := 2147483647;
  if (batch = 1) then
    method1 := 2147483647;
  if ((method0 < method1) and (method0 < method2)) then
    writeln(method0)
  else if (method1 < method2) then
    writeln(method1)
  else
    writeln(method2)
end.
