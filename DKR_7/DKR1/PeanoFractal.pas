// Модуль PeanoFractal.pas
unit PeanoFractal;

interface

uses GraphABC;

var
  u: integer;

procedure a(i: Integer); forward;
procedure b(i: Integer); forward;
procedure c(i: Integer); forward;
procedure d(i: Integer); forward;

implementation

procedure LineRel(dx, dy : Integer);
begin
     LineTo(PenX+dx, PenY+dy)
end;

procedure a(i: Integer);
begin
     if i > 0 then
     begin
          d(i - 1);
          LineRel( + u, 0);
          a(i - 1);
          LineRel(0, u);
          a(i - 1);
          LineRel(-u, 0);
          c(i - 1)
     end
end;

procedure b(i: integer);
begin
     if i > 0 then
     begin
          c(i - 1);
          LineRel(-u, 0);
          b(i - 1);
          LineRel(0, -u);
          b(i - 1);
          LineRel(u, 0);
          d(i - 1)
     end
end;

procedure c(i: integer);
begin
     if i > 0 then
     begin
          b(i - 1);
          LineRel(0, -u);
          c(i - 1);
          LineRel(-u, 0);
          c(i - 1);
          LineRel(0, u);
          a(i - 1)
     end
end;

procedure d(i: integer);
begin
     if i > 0 then
     begin
          a(i - 1);
          LineRel(0, u);
          d(i - 1);
          LineRel(u, 0);
          d(i - 1);
          LineRel(0, -u);
          b(i - 1)
     end
end;

end.
