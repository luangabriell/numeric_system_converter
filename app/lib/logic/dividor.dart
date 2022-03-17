class Dividor {
  List<int> divide(int number, int divisor){
    List<int> returnValues = [];
    if (number > divisor){
      String divisonResult = (number/divisor).toString(); 

      int quotient = int.parse(
        divisonResult.substring(0, divisonResult.indexOf("."))
      );

      int rest = number - (quotient * divisor);

      returnValues = [rest, quotient];
    }
    return returnValues;
  }
}