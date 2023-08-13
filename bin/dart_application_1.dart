import 'dart:io';
// Программа для расчета заработной платы в ООО "АТМ СЕРВИС ЮГ"

void main() {
  print('Введите фамилию инженера');

  String ingeener = stdin.readLineSync() ?? '';

  int year = 2023;
  print('Введите Месяц');
  int month = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print('Сколько дней инженер не присутствовал в месяце из рабочих дней');
  int progul = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print('Сколько дней инженер переработал за месяц');
  int pererab = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print('Сколько чесов не полной смены инженер переработал за месяц');
  int pererabChas = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print('Количество часов в смене инженера');
  int chasi = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print('Количество километров пройденых инженером');
  int probeg = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print('Сумма минимальной оплаты инженеру за месяц');
  int cash = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  int weekendCount = getWeekendCount(year, month); //Выходных дней в месяце
  int worckingCount = getWorckCount(year, month); //Рабочих дней в месяце
  int worckingClock = worckingCount * chasi; //Рабочих часов в месяце
  int progulClock = progul * chasi; //Пропущено инженером основных часов
  int pererabClok = pererab * chasi; //Переработано часов инженером
  int rabclockEng =
      worckingClock - progulClock; //Отработано инженером основых часов
      

  // Расчеты заработной платы --------

  int poltoraOkl = 358;
  int probegCesh = probeg * 9; // Компенсация за пробег из расчета 9р/км
  int osnovnCash =
      (cash ~/ worckingClock) * rabclockEng; // Сумма основной оплаты
  int pererabCash = pererabClok * poltoraOkl;
  int pererabCashCas = pererabChas * poltoraOkl;
  int svyaz = 500;
  int premiya = 15000;
  int summ =
      probegCesh + osnovnCash + pererabCash + svyaz + premiya + pererabCashCas;

  // Принты
  print('Количество выходных дней в месяце: $weekendCount');
  print('Количество рабочих дней в месяце:$worckingCount');
  print('Количество рабочих часов в месяце: $worckingClock');

  print('Отработано инженером основных часов по окладу: $rabclockEng');
  print('Перереаботано часов инженером: $pererabClok');

  print('------------------------------------------------------------------');
  print('РАСЧЕТ ЗАРАБОТНОЙ ПЛАТЫ И КОМПЕНСАЦИИ $ingeener');
  print('Сумма основной оплаты за отработаные дни: $osnovnCash рублей');
  print('Сумма компенсации за переработаные дни: $pererabCash рублей');
  print('Сумма компенсации за пробег: $probegCesh рублей');
  print('------------------------------------------------------------------');

  print('Сумма ЗАРАБОТНОЙ ПЛАТЫ: $summ рублей');
}

enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

// Функция высчитывающая кл-во дней выходных
int getWeekendCount(int year, int month) {
  int count = 0;
  int daysInMonth = DateTime(year, month + 1, 0).day;

  for (int day = 1; day <= daysInMonth; day++) {
    DateTime date = DateTime(year, month, day);
    Day weekday = Day.values[date.weekday - 1];

    if (weekday == Day.saturday || weekday == Day.sunday) {
      count++;
    }
  }

  return count;
}

// Функция высчитывающая кл-во дней рабочих
int getWorckCount(int year, int month) {
  int count = 0;
  int daysInMonth = DateTime(year, month + 1, 0).day;

  for (int day = 1; day <= daysInMonth; day++) {
    DateTime date = DateTime(year, month, day);
    Day weekday = Day.values[date.weekday - 1];

    if (weekday == Day.monday ||
        weekday == Day.tuesday ||
        weekday == Day.wednesday ||
        weekday == Day.thursday ||
        weekday == Day.friday) {
      count++;
    }
  }

  return count;
}

// Функция считает сколько дней в месяце всего

int getCount(int year, int month) {
  int count = 0;
  int daysInMonth = DateTime(year, month + 1, 0).day;

  return count;
}
