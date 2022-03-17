import 'package:app/logic/babilonic-logic.dart';
import 'package:app/screens/babilonic/babilonic_tab.dart';
import 'package:app/screens/babilonic/numeric-tab.dart';
import 'package:app/screens/babilonic/translator.dart';
import 'package:flutter/material.dart';

class Babilonic extends StatefulWidget {
  const Babilonic({ Key? key }) : super(key: key);

  @override
  State<Babilonic> createState() => _BabilonicState();
}

class _BabilonicState extends State<Babilonic> {
  int mode = 0;
  
  String txt = "";

  List<String> babilonicTxt = [];
  List<Widget> result = [];

  int option = 0;

  List<Widget> babilonicAlgorisms = [];

  void setOption(){
    if (option == 0){
      option = 1;
    } else{
      option = 0;
    }
  }

  void setTxt(newTxt){
    if (mode == 0) {
      if (option == 1) {
        setState(() {
          option = 0;
          txt = "";
        });
        if (newTxt != "erase" && newTxt != "translate") {
          setState(() {
            txt = txt + newTxt;
          });
        }
      } else {      
        if (newTxt == "erase") {
          if (txt.length != 0) {
            setState(() {
              txt = txt.substring(0, txt.length - 1);              
            });  
          }
          
        } if (newTxt == "translate"){
          if (txt.length != 0) {
            setState(() {
              option = 1;
              babilonicAlgorisms = translator(BabilonicLogic().algorismsToBabilonic(int.parse(txt)));
            });
          }
        } else {
          if (newTxt != "erase") {
            setState(() {
              txt = txt + newTxt;              
            });
          }
        }
      } 
    } if (mode == 1) {
      if (option == 1) {
        setState(() {
          option = 0;
          babilonicTxt.clear();
        });
        if (newTxt != "erase" && newTxt != "translate") {
          setState(() {
            babilonicTxt.add(newTxt);
          });
        }
      } else {   
        if (newTxt == "erase") {
          if (babilonicTxt.length != 0) {
            setState(() {
              babilonicTxt.removeAt(babilonicTxt.length - 1);             
            });  
          }
        } if (newTxt == "translate"){
          if (babilonicTxt.length != 0) {
            setState(() {
              option = 1;
              result = [Center(
                child: Text(
                  BabilonicLogic().babilonicToAlgorisms(babilonicTxt).toString(),
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 28
                  ),
                )
              )];
              
            });
          }
        } else {
          if (newTxt != "erase") {
            if (newTxt == "space" && babilonicTxt[babilonicTxt.length - 1] == "space") {
              return;
            } else {
              setState(() {
                babilonicTxt.add(newTxt);             
              });
            }
          }
        }
      } 
    }
  }
  
  Widget content = Container();
  List<Widget> element = [];
  @override
  Widget build(BuildContext context) {

    if (mode == 0) {
      content = numeric_tab(context, setTxt, option, setOption);
      element = [
        Center(
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 28
            ),
          )
        )
      ];
    } if (mode == 1) {
      content = babilonic_tab(context, setTxt);
      element = translator(babilonicTxt);
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height; 
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey.shade300),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Babilônico",
          style: TextStyle(
            color: Colors.grey.shade300
          ),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Container(
        color: Colors.grey.shade900,
        width: width,
        height: height,
        child: ListView(
          children: [
            Container(
              height: 30,
              color: Colors.grey.shade900,
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.change_circle_rounded,
                      color: Colors.grey.shade300,
                    ),
                    onPressed: (){
                      if (mode == 0) {
                        setState(() {
                          mode = 1;    
                          txt = "";
                          babilonicTxt = [];
                          result = [];
                          option = 0;
                          babilonicAlgorisms = [];

                        });
                      } else {
                        setState(() {
                          mode = 0;
                          txt = "";
                          babilonicTxt = [];
                          result = [];
                          option = 0;
                          babilonicAlgorisms = [];
                          
                        });
                      }
                    },
                  )
                ),
              ),
            ),
            Container(
              height: 70,
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: 
                    option == 0?
                      element:
                      mode == 0?
                        babilonicAlgorisms:
                        result
                )
              )
            ),
            content
          ],
        ),
      ),
    );
  }
}