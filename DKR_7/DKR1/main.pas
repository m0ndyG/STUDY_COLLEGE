// Главная программа
program Main;

uses GraphABC, PeanoFractal;

var
  x, y, depth: integer;

procedure Button(key: integer);
begin
  case key of
    VK_Up: y := y - 10;
    VK_Down: y := y + 10;
    VK_Left: x := x - 10;
    VK_Right: x := x + 10;
    87: // W
      begin
        u := u + 10;
      end;
    83: // S
      begin
        if u > 20 then
        begin
          u := u - 10;
        end;
      end;
    65: // A
      begin
        if depth > 0 then
          depth := depth - 1;
      end;
    68: // D
      begin
        depth := depth + 1;
      end;
  end;
  Window.Clear;
  MoveTo(x, y);
  a(depth);
end;

begin
  SetWindowSize(600, 600);
  x := 50;
  y := 50;
  u := 10;
  depth := 4;
  MoveTo(x, y);
  a(depth);
  OnKeyDown := Button;
end.
