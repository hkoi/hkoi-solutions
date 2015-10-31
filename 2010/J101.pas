const
  // 10 = 0 left, 11 = 0 right
  dist:array[1..11] of string[12] = (
    '01212323412',
    '10121232321',
    '21032143232',
    '12301212323',
    '21210121232',
    '32121032143',
    '23412301234',
    '32321210143',
    '43232121054',
    '12323434501',
    '21232343410');
var
  s: ansistring;
  location, moves, i, len: longint;
begin
  read(s);
  moves := 0;
  location := 5;
  len := length(s);
  for i := 1 to len do
  begin
    if ((s[i] = '0') and (location <> 10) and (location <> 1) and (location <> 4) and (location <> 7)) then
    begin
      moves := moves + ord(dist[location][11]) - ord('0');
      location := 11
    end
    else if (s[i] = '0') then
    begin
      moves := moves + ord(dist[location][10]) - ord('0');
      location := 10
    end
    else
    begin
      moves := moves + ord(dist[location][ord(s[i]) - ord('0')]) - ord('0');
      location := ord(s[i]) - ord('0')
    end
  end;
  writeln(moves)
end.
