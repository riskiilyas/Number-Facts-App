class NumberUtil {
  int d1 = 0,d2 = 0,d3 = 0,d4 = 0;
  int total = 0;

  int setDigit(int digit, int num) {
    if(digit>4) return -1;

    if(digit==0) {
      d1=num;
    } else if(digit==1) {
      d2=num;
    } else if(digit==2) {
      d3=num;
    } else if(digit==3) {
      d4=num;
    }

    String build = d1.toString()+d2.toString()+d3.toString()+d4.toString();

    total = int.parse(build);

    return getTotal();
  }

  int getTotal() => total;

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
  }

}