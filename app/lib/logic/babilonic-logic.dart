
import 'package:app/logic/dividor.dart';

class BabilonicLogic {
  int babilonicToAlgorisms(List<String> arrows){
    
    int number = 0;  

    int actualSpace = 0;
    for (var arrow in arrows) {
      if (arrow == "space"){
        actualSpace = actualSpace + 1;
      }
    }  
    
    for (var arrow in arrows) {
      if (arrow == "down"){
        number = number + 1;
      }
      if (arrow == "left") {
        number = number + 10;
      }
      if (arrow == "space") {
        int multiplier = 0;
        for (var i = 0; i < actualSpace; i++) {
          multiplier = multiplier * 60;
        }
        number = number * 60;
      }
    }
    
    return number;
  }
  List<String> algorismsToBabilonic(int number){
    List<String> arrows = [];
    
    if (number <= 10) {
      for (var i = 0; i < number; i++) {
        arrows.add("down");
      }
    } if(number < 60){
      List<dynamic> quocientAndRest = Dividor().divide(number, 10);
      if(quocientAndRest.length > 0){
        for(int i = 0; i < quocientAndRest[1]; i ++){
            arrows.add("left");
        }
        for(int i = 0; i < quocientAndRest[0]; i ++){
            arrows.add("down");
        }
      }
    } else {
      List<int> algorisms = [];
      List<int> result = Dividor().divide(number, 60);
      while (true) {
        if (result[1] >= 60){
          algorisms.add(result[0]); 
        }
        else{
          algorisms.add(result[0]); 
          algorisms.add(result[1]); 
          break;
        }
        result = Dividor().divide(result[1], 60);
      }
      for(int i = algorisms.length - 1; i >= 0; i--){
        if (algorisms[i] != 0)
          if (algorisms[i] > 10){
            List<dynamic> quocientAndRest = Dividor().divide(algorisms[i], 10);
            if(quocientAndRest.length > 0){
              for(int i = 0; i < quocientAndRest[1]; i ++){
                  arrows.add("left");
              }
              for(int i = 0; i < quocientAndRest[0]; i ++){
                  arrows.add("down");
              }
            }
          }
          else{
            for(int c = 0; c < algorisms[i]; c ++){
                  arrows.add("down");
              }
          }
        else{
          arrows.add("space");
        }
        arrows.add("space");
      }
      arrows.removeAt(arrows.length - 1);

      if (arrows[arrows.length - 2] == "space" && arrows[arrows.length - 1] == "space") {
        arrows.removeAt(arrows.length - 1);
      }
    }
    
    return arrows;
  }
}