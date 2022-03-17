import 'package:flutter/material.dart';

class Babilonic extends StatefulWidget {
  const Babilonic({ Key? key }) : super(key: key);

  @override
  State<Babilonic> createState() => _BabilonicState();
}

class _BabilonicState extends State<Babilonic> {
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
      ),
    );
  }
}