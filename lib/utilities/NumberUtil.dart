class NumberUtil {
  NumberUtil(int total, this.digits) {
    List<int> tempL = [];
    for(int i = 10; i<total*10; i*=10) {
      tempL.add(((total % i) / (i / 10)).floor());
    }

    while(tempL.length < digits) {
      tempL.add(0);
    }

    for (var element in tempL.reversed) {
      numbers.add(element);
    }
  }

  final int digits;
  List<int> numbers = [];

  int setDigit(int digit, int num) {
    if(digit > digits) return -1;
    numbers[digit] = num;
    return getTotal();
  }

  int getTotal() {
    int total = 0;
    int i = 1;
    for (var element in numbers.reversed) {
      total += (element * i);
      i *= 10;
    }

    return total;
  }

}