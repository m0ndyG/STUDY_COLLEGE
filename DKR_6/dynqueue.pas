unit dynqueue;

interface

type
  Tptr = ^Telem; // Тип указателя на элемент очереди
  Telem = record // Структура для хранения элемента очереди
    inf: char; // Значение элемента
    link: Tptr; // Указатель на следующий элемент
  end;

var
  begQ: Tptr; // Указатель на начало очереди

procedure addDynamicElem; // Процедура добавления элемента в очередь
procedure delDynamicElem; // Процедура удаления элемента из очереди
procedure printDynamicQ; // Процедура печати элементов очереди
procedure recPrintDynamicQ(pp: Tptr); // Рекурсивная процедура печати элементов очереди
function getCountDynamicElem: integer; // Функция подсчета количества элементов в очереди

implementation

procedure addDynamicElem;
var
  add: Tptr; // Указатель на новый элемент
  p: Tptr; // Вспомогательный указатель
begin
  new(add); // Выделение памяти для нового элемента
  add^.link := NIL; // Установка указателя на следующий элемент в NIL
  write('Введите значение добавляемого элемента: ');
  readln(add^.inf); // Считывание значения элемента
  if (begQ = NIL) then // Если очередь пуста
    begQ := add // Устанавливаем указатель на начало очереди
  else
  begin
    p := begQ; // Устанавливаем вспомогательный указатель
    while (p^.link <> NIL) do // Проходим по всем элементам до конца
      p := p^.link; // Переходим к следующему элементу
    p^.link := add; // Добавляем новый элемент в конец
  end;
end;

procedure delDynamicElem;
var
  p: Tptr; // Вспомогательный указатель
begin
  if (begQ <> NIL) then // Проверяем, не пуста ли очередь
  begin
    p := begQ; // Устанавливаем указатель на первый элемент
    begQ := begQ^.link; // Перемещаем указатель на начало очереди на следующий элемент
    dispose(p); // Освобождаем память, выделенную для первого элемента
  end else
    writeln('Очередь пуста!'); // Сообщение об ошибке, если очередь пуста
end;

procedure printDynamicQ;
var
  p: Tptr; // Вспомогательный указатель
begin
  p := begQ; // Устанавливаем указатель на первый элемент
  while (p <> NIL) do // Перебираем все элементы до конца
  begin
    write(p^.inf:3); // Выводим значение элемента
    p := p^.link; // Переходим к следующему элементу
  end;
end;

procedure recPrintDynamicQ(pp: Tptr);
begin
  if (pp <> NIL) then // Если элемент не пустой
  begin
    recPrintDynamicQ(pp^.link); // Рекурсивный вызов для печати следующего элемента
    write(pp^.inf:3); // Выводим значение элемента
  end;
end;

function getCountDynamicElem: integer;
var
  p: Tptr; // Вспомогательный указатель
  k: integer; // Счетчик элементов
begin
  k := 0; // Инициализируем счетчик
  p := begQ; // Устанавливаем указатель на первый элемент
  while (p <> NIL) do // Перебираем все элементы до конца
  begin
    k := k + 1; // Увеличиваем счетчик
    p := p^.link; // Переходим к следующему элементу
  end;
  getCountDynamicElem := k; // Возвращаем значение счетчика
end;

end.