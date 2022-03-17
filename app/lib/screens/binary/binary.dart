import 'package:flutter/material.dart';

class Binary extends StatefulWidget {
  const Binary({ Key? key }) : super(key: key);

  @override
  State<Binary> createState() => _BinaryState();
}

class _BinaryState extends State<Binary> {
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
      ),
    );
  }
}