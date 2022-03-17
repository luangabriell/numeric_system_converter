import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> translator(arrows){
  
  List<Widget> arrowsList = [];
  
  for (var i = 0; i < arrows.length; i++) {
    if (arrows[i] == "left") {
      arrowsList.add(
        Container(
          child: Icon(
            Icons.arrow_left,
            size: 30,
            color: Colors.grey.shade300,
          )
        )
      );
    } if (arrows[i] == "down") {
      arrowsList.add(
        Container(
          child: Icon(
            Icons.arrow_drop_down,
            size: 30,
            color: Colors.grey.shade300,
          )
        )
      );
    } if (arrows[i] == "space") {
      arrowsList.add(
        SizedBox(width: 20)
      );
    }
  }

  return arrowsList;
}