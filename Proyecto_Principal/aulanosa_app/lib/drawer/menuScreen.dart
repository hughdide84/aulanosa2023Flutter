import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu2 createState() => Menu2();
}

class Menu2 extends State<Menu> {
  var size, heightA, widthA;

  @override
  Widget build(BuildContext context) {
    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });
    return Scaffold(

      body: Container(
        height: heightA,
        width: widthA,
        color: Colors.red,
        child: IconButton(
          onPressed:(){

          } ,
          icon: Icon(Icons.abc)
        ),
      ),
    );
  }
  
}