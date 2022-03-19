import 'package:app/logic/binary-logic.dart';
import 'package:app/screens/binary/binary-tab.dart';
import 'package:app/screens/binary/numeric-tab.dart';
import 'package:app/screens/binary/translator.dart';
import 'package:flutter/material.dart';

class Binary extends StatefulWidget {
  const Binary({ Key? key }) : super(key: key);

  @override
  State<Binary> createState() => _BinaryState();
}

class _BinaryState extends State<Binary> {
  int mode = 0;
  
  String txt = "";
  String binaryTxt = "";

  late Widget result;

  int option = 0;

  late Widget binaryAlgorisms;

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
              binaryAlgorisms = translator(BinaryLogic().algorismsToBinary(int.parse(txt)));
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
          binaryTxt = "";
        });
        if (newTxt != "erase" && newTxt != "translate") {
          setState(() {
            binaryTxt = binaryTxt + newTxt;
          });
        }
      } else {   
        if (newTxt == "erase") {
          if (binaryTxt.length != 0) {
            setState(() {
              binaryTxt.substring(0, binaryTxt.length - 2);             
            });  
          }
        } if (newTxt == "translate"){
          if (binaryTxt.length != 0) {
            setState(() {
              option = 1;
              result = Center(
                child: Text(
                  BinaryLogic().binaryToAlgorisms(binaryTxt).toString(),
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 28
                  ),
                )
              );             
            });
          }
        } else {
          if (newTxt != "erase") {
            if (newTxt == "space" && binaryTxt.substring(0, binaryTxt.length - 1) == "space") {
              return;
            }
            else {
              if (newTxt != "space"){
                setState(() {
                  binaryTxt = binaryTxt + newTxt;             
                });
              } else{
                setState(() {
                  binaryTxt = binaryTxt + " ";
                });
              }
            }
          }
        }
      } 
    }
  }
  
  Widget content = Container();
  late Widget element;
  @override
  Widget build(BuildContext context) {

    if (mode == 0) {
      content = numeric_tab(context, setTxt, option, setOption);
      element = 
        Center(
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 28
            ),
          )
        );
    } if (mode == 1) {
      content = binary_tab(context, setTxt);
      element = Center(
        child: Text(
          binaryTxt,
          style: TextStyle(
            color: Colors.grey.shade300,
            fontSize: 28
          ),
        )
      );
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
          "Binário",
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
                          binaryTxt = "";
                          result = Container();
                          option = 0;
                          binaryAlgorisms = Container();

                        });
                      } else {
                        setState(() {
                          mode = 0;
                          txt = "";
                          binaryTxt = "";
                          result = Container();
                          option = 0;
                          binaryAlgorisms = Container();
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
                  children: option == 0? 
                    [element]:
                    mode == 0?
                        [binaryAlgorisms]:
                        [result]
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