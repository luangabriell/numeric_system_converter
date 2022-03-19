import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget translator(String binaryTxt){
  return Center(
    child: Text(
      binaryTxt,
      style: TextStyle(
        color: Colors.grey.shade300,
        fontSize: 28
      ),
    )
  );
}