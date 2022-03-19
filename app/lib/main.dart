import 'package:app/screens/babilonic/babilonic.dart';
import 'package:app/screens/binary/binary.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NumericSystemConverter());
}

class NumericSystemConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numeric System Converter',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height; 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          "Conversor de Medidas",
          style: TextStyle(
            color: Colors.grey.shade300
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade900,
        width: width,
        height: height,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(20), 
                child: Text(
                  "Escolhe o sistema de numeração:",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade400
                  ),
                ),
              )
            ),
            buttons(context, "Babilônico"),
            dividor(),
            buttons(context, "Binário"),
            dividor(),
          ],
        ),
      )
    );
  }
}
  
Widget dividor(){
  return Padding(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Divider(
      height: 16,
      color: Colors.grey.shade800,
    )
  );
}

Widget buttons(BuildContext context, text){
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: EdgeInsets.only(left: 20, right: 20), 
      child: Container(
        width: width - 20,
        height: 40,
        child: TextButton(
          onPressed: (){
            if (text == "Babilônico"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Babilonic()),
              );
            };
            if (text == "Binário"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Binary()),
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, top: 5),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Colors.grey.shade600,
                )
              ),
            ],
          ),
        ),
      )
    )
  );
}