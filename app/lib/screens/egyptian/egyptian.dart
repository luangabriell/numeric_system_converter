import 'package:flutter/material.dart';

class Egyptian extends StatefulWidget {
  const Egyptian({ Key? key }) : super(key: key);

  @override
  State<Egyptian> createState() => _EgyptianState();
}

class _EgyptianState extends State<Egyptian> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height; 
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey.shade300),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Egípcio",
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
      ),
    );
  }
}