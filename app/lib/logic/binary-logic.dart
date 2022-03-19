import 'dart:math';

import 'package:app/logic/dividor.dart';

class BinaryLogic {
  int binaryToAlgorisms(String binaryNumber){
    int number = 0;

    int counter = 0;
    for (var i = binaryNumber.length - 1; i >= 0; i--) {
      int n = int.parse(binaryNumber[i]);
      
      number = number + n * pow(2, counter).toInt();

      counter = counter + 1;
    }

    return number;
  }
  String algorismsToBinary(int number){
    String binary = "";

    while (true) {
      List<int> result = Dividor().divide(number, 2);
      binary = result[0].toString() + binary;
      if (result[1] < 2) {
        binary = result[1].toString() + binary;
        break;
      }
      number = result[1];
    }

    return binary;
  }
}