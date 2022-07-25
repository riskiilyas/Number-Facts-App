class FactModel{
  final String result;
  final bool isSuccess;

  FactModel({required this.result, required this.isSuccess});
}

class DateFactModel {
  final int year;
  final String result;
  final bool isSuccess;

  DateFactModel({required this.year, required this.result, required this.isSuccess});
}

class YearFactModel {
  final String date;
  final String result;
  final bool isSuccess;

  YearFactModel({required this.date, required this.result, required this.isSuccess});
}