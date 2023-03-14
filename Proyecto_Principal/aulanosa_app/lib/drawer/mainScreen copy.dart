import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Prueba extends StatefulWidget {
  Prueba2 createState() => Prueba2();
}

class Prueba2 extends State<Prueba> {
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
        color: Colors.yellow,
        child: IconButton(
          onPressed: (){
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }},
          icon: Icon(Icons.abc)
        ),
      ),
    );
  }
  
}