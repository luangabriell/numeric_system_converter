import 'package:flutter/material.dart';

Widget numeric_tab(BuildContext context, setTxt, option, setOption) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height; 

  List<Widget> tabs = [];

  void addTabs(){

    for (var i = 0; i < 4; i++) {

      List<String> tabsText = [];
      if(i == 0){
        tabsText.add("0");
        tabsText.add("1");
        tabsText.add("2");
      }
      if(i == 1){
        tabsText.add("3");
        tabsText.add("4");
        tabsText.add("5");
      }
      if(i == 2){
        tabsText.add("6");
        tabsText.add("7");
        tabsText.add("8");
      }
      if(i == 3){
        tabsText.add("9");
        tabsText.add("erase");
        
        tabsText.add("translate");
      }

      tabs.add(
        Row(
          children: [
            Container(
              width: width / 3 - 2.75,
              height: (height - 200) / 4,
              color: Colors.grey.shade800,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.grey.shade600)
                ),
                onPressed: (){
                  setTxt(tabsText[0]);
                },
                child: Text(
                  tabsText[0],
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 24
                  ),
                ),
              ),
            ),
            SizedBox(width: 4),
            Container(
              width: width / 3 - 2.75,
              height: (height - 200) / 4,
              color: Colors.grey.shade800,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.grey.shade600)
                ),
                onPressed: (){
                  setTxt(tabsText[1]);
                },
                child: tabsText[1] == "erase"? 
                Icon(
                  Icons.backspace_outlined,
                  color: Colors.grey.shade300,
                  size: 32,
                ):
                Text(
                  tabsText[1],
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 24
                  ),
                ),
              ),
            ),
            SizedBox(width: 4),
            Container(
              width: width / 3 - 2.75,
              height: (height - 200) / 4,
              color: tabsText[2] == "translate"? Colors.amber:Colors.grey.shade800,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(tabsText[2] == "translate"? Colors.amber.shade300:Colors.grey.shade600)
                ),
                onPressed: (){
                  setTxt(tabsText[2]);
                },
                child: tabsText[2] == "translate"?
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade300,
                  size: 32,
                ):
                Text(
                  tabsText[2],
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 24
                  ),
                )
              ),
            ),
          ],
        )
      );
      tabs.add(SizedBox(height: 4));
    }
  }

  addTabs();

  return Container(
    color: Colors.grey.shade900,
    child: Column(
      children: tabs
    )
  );
}