var
  r1, g1, b1, r2, g2, b2: int64;
begin
  read(r1, g1, b1, r2, g2, b2);
  if ((g1 + b2 + 2 * (b1 + g2)) mod 3 = 0) then
    writeln('R')
  else if ((g1 + b2 + 2 * (b1 + g2)) mod 3 = 1) then
    writeln('G')
  else
    writeln('B');
end.
