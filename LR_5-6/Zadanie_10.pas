﻿program z_10;

const
  N = 20; // размер массива

var
  arr: array[1..N] of Integer; // создаем массив
  i, j: Integer;

begin
  Randomize; // заполнение случайными числами
  for i := 1 to N do
    arr[i] := Random(100) - 50; // заполняем случайными числами от -50 до 49

  writeln('Исходный массив:');
  for i := 1 to N do // вывод изначального массива
    write(arr[i], ' ');
  writeln;
  
  j := 0; // индекс нового массива
  
  for i := 1 to N do // удаление отрицательных элементов
    if arr[i] >= 0 then // если элемент положителен
    begin
      j := j + 1; // увеличиваем индекс массива
      arr[j] := arr[i]; // обновляем массив с новым элементом
    end;

  writeln('Массив без отрицательных элементов:');
  for i := 1 to j do // вывод положительного массива
    write(arr[i], ' ');

  readln;
end.

