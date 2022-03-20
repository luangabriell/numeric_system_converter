import 'package:flutter/material.dart';

Widget babilonic_tab(BuildContext context, setTxt) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height; 

  List<Widget> tabs = [
    Row(
      children: [
        Container(
          width: width / 3 - 2.75,
          height: (height - 190) / 2,
          color: Colors.grey.shade800,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.grey.shade600)
            ),
            onPressed: (){
              setTxt("left");
            },
            child: Icon(
              Icons.arrow_left_outlined,
              color: Colors.grey.shade300,
              size: 32,
            )
          ),
        ),
        SizedBox(width: 4,),
        Container(
          width: width / 3 - 2.75,
          height: (height - 190) / 2,
          color: Colors.grey.shade800,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.grey.shade600)
            ),
            onPressed: (){
              setTxt("down");
            },
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey.shade300,
              size: 32,
            )
          ),
        ),
        SizedBox(width: 4,),
        Container(
          width: width / 3 - 2.75,
          height: (height - 190) / 2,
          color: Colors.grey.shade800,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.grey.shade600)
            ),
            onPressed: (){
              setTxt("erase");
            },
            child: Icon(
              Icons.backspace_outlined,
              color: Colors.grey.shade300,
              size: 32,
            )
          ),
        ),
      ]
    ),
    SizedBox(height: 4),
    Row(
      children: [
        Container(
          width: (width / 3) + (width/6) - 2.75,
          height: (height - 190) / 2,
          color: Colors.grey.shade800,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.grey.shade600)
            ),
            onPressed: (){
              setTxt("space");
            },
            child: Icon(
              Icons.space_bar,
              color: Colors.grey.shade300,
              size: 32,
            )
          ),
        ),
        SizedBox(width: 4,),
        Container(
          width: (width / 3) + (width/6) - 2.75,
          height: (height - 190) / 2,
          color: Colors.amber,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.amber.shade300)
            ),
            onPressed: (){
              setTxt("translate");
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade300,
              size: 32,
            )
          ),
        ),
      ]
    )
  
  ];

  return Container(
    color: Colors.grey.shade900,
    child: Column(
      children: tabs
    )
  );
}