class FactModel {}

class FactModelNumber extends FactModel{
  final String result;
  final bool isSuccess;

  FactModelNumber({required this.result, required this.isSuccess});
}

class FactModelString extends FactModel {
  final String result;
  FactModelString({required this.result});
}

class FactModelDate extends FactModel{
  final int year;
  final String result;
  final bool isSuccess;

  FactModelDate({required this.year, required this.result, required this.isSuccess});
}

class FactModelYear extends FactModel{
  final String date;
  final String result;
  final bool isSuccess;

  FactModelYear({required this.date, required this.result, required this.isSuccess});
}