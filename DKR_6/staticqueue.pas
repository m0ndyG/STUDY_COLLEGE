unit staticqueue;

interface

const
  MAX_QUEUE_SIZE = 5; // Максимальный размер статической очереди

type
  Telem = record // Структура для хранения элемента очереди
    inf: char; // Значение элемента
  end;

var
  queue: array[0..MAX_QUEUE_SIZE-1] of Telem; // Массив для хранения элементов очереди
  front, rear: integer; // Индексы начала и конца очереди

procedure initStaticQueue; // Процедура инициализации статической очереди
function isStaticQueueEmpty: boolean; // Функция проверки очереди на пустоту
function isStaticQueueFull: boolean; // Функция проверки очереди на переполнение
procedure addStaticElem(x: char); // Процедура добавления элемента в очередь
function delStaticElem: char; // Функция удаления элемента из очереди
procedure printStaticQueue; // Процедура печати элементов очереди

implementation

procedure initStaticQueue;
begin
  front := 0; // Инициализируем начало очереди
  rear := 0; // Инициализируем конец очереди
end;

function isStaticQueueEmpty: boolean;
begin
  isStaticQueueEmpty := front = rear; // Проверяем, что начало и конец очереди совпадают
end;

function isStaticQueueFull: boolean;
begin
  isStaticQueueFull := (rear + 1) mod MAX_QUEUE_SIZE = front; // Проверяем, что следующий элемент после конца будет равен началу
end;

procedure addStaticElem(x: char);
begin
  if not isStaticQueueFull then // Проверяем, что очередь не переполнена
  begin
    queue[rear].inf := x; // Записываем элемент в конец очереди
    rear := (rear + 1) mod MAX_QUEUE_SIZE; // Передвигаем конец очереди
  end
  else
    writeln('Очередь переполнена!'); // Ошибка при переполнении
end;

function delStaticElem: char;
var
  x: char; // Переменная для хранения удаленного элемента
begin
  if not isStaticQueueEmpty then // Проверяем, что очередь не пуста
  begin
    x := queue[front].inf; // Записываем значение элемента из начала
    front := (front + 1) mod MAX_QUEUE_SIZE; // Передвигаем начало очереди
    delStaticElem := x; // Возвращаем удаленный элемент
  end
  else
  begin
    writeln('Очередь пуста!'); // Ошибка при пустой очереди
    delStaticElem := ' '; // Возвращаем пустой символ
  end;
end;

procedure printStaticQueue;
var
  i: integer; // Счетчик для перебора элементов
begin
  if isStaticQueueEmpty then
    writeln('Очередь пуста!') // Сообщение об отсутствии элементов
  else
  begin
    i := front; // Начинаем перебор с начала очереди
    while i <> rear do // Перебираем элементы, пока не дойдем до конца
    begin
      write(queue[i].inf, ' '); // Выводим значение элемента
      i := (i + 1) mod MAX_QUEUE_SIZE; // Переход к следующему элементу
    end;
    writeln; // Переход на новую строку
  end;
end;

end.