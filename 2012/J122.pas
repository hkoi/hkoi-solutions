var
  r, c, rr, cc, i, j: longint;
begin
  read(r, c, rr, cc);
  if ((r * c mod 2 = 0) or ((rr - cc) mod 2 <> 0)) then
  begin
    writeln('Impossible');
    exit
  end;
  for i := 1 to rr - 1 do
  begin
    for j := 0 to c - 2 do
      write(chr(ord('a') + (i mod 2) + (j and 2)));
    writeln(chr(ord('m') + ((i - 1) and 2)))
  end;
  if (rr mod 2 = 1) then
  begin
    for j := 0 to cc - 2 do
      write(chr(ord('e') + (j and 2)));
    write('*');
    for j := cc to c - 1 do
      write(chr(ord('e') + ((j + 1) and 2)));
    writeln
  end
  else
  begin
    write(chr(ord('p') + (rr and 2)));
    for j := 0 to cc - 3 do
      write(chr(ord('e') + (j and 2)));
    write('*');
    for j := cc to c - 2 do
      write(chr(ord('e') + (j and 2)));
    writeln(chr(ord('m') + ((rr - 1) and 2)))
  end;
  for i := rr + 1 to r do
  begin
    write(chr(ord('p') + (i and 2)));
    for j := 0 to c - 2 do
      write(chr(ord('a') + (i mod 2) + (j and 2)));
    writeln
  end;
end.
