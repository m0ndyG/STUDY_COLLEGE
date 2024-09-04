program Z_3;

const
  MAX_SIZE = 10; // Максимальный размер стека и списка
  INPUT_FILE = '1.txt'; // Имя файла для ввода данных
  OUTPUT_FILE = '2.txt'; // Имя файла для вывода результата

type
  Stack = record
    data: array [1..MAX_SIZE] of integer; // Массив для хранения данных стека
    top: integer; // Индекс вершины стека
  end;

// Процедура инициализации стека
procedure initializeStack(var S: Stack);
begin
  S.top := 0; // Устанавливаем индекс вершины стека в 0
end;

// Функция проверки пустоты стека
function isEmpty(S: Stack): boolean;
begin
  isEmpty := (S.top = 0); // Возвращает true, если индекс вершины стека равен 0
end;

// Процедура добавления элемента в стек
procedure push(var S: Stack; item: integer);
begin
  if S.top < MAX_SIZE then // Проверяем, не превышен ли максимальный размер стека
  begin
    S.top := S.top + 1; // Увеличиваем индекс вершины стека
    S.data[S.top] := item; // Добавляем новый элемент в стек
  end
  else
    writeln('Стек переполнен'); // Выводим сообщение о переполнении стека
end;

// Функция извлечения элемента из стека
function pop(var S: Stack): integer;
begin
  if not isEmpty(S) then // Проверяем, не является ли стек пустым
  begin
    pop := S.data[S.top]; // Возвращаем значение верхнего элемента стека
    S.top := S.top - 1; // Уменьшаем индекс вершины стека
  end
  else
  begin
    writeln('Стек пуст'); // Выводим сообщение о пустом стеке
    pop := -1; // Возвращаем значение 
  end;
end;

// Процедура вывода содержимого стека в файл
procedure printStackToFile(S: Stack; filename: string);
var
  i: integer;
  outputFile: text;
begin
  assign(outputFile, filename); // Привязываем файл к переменной
  rewrite(outputFile); // Открываем файл для записи
  writeln(outputFile, 'Четные числа:');
  for i := 1 to S.top do
    writeln(outputFile, S.data[i]); // Записываем содержимое стека в файл
  close(outputFile); // Закрываем файл
end;

var
  i: integer;
  myStack: Stack;
  inputFile: text;
  currentNumber: integer;

begin
  assign(inputFile, INPUT_FILE); // Привязываем файл к переменной
  reset(inputFile); // Открываем файл для чтения

  initializeStack(myStack);

  // Чтение чисел из файла и добавление четных чисел в стек
  while not eof(inputFile) do
  begin
    readln(inputFile, currentNumber);
    if currentNumber mod 2 = 0 then
      push(myStack, currentNumber);
  end;

  close(inputFile); // Закрываем файл после чтения

  // Вывод четных чисел из стека в файл
  printStackToFile(myStack, OUTPUT_FILE);
end.
