import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Main extends StatefulWidget {
  Main2 createState() => Main2();
}

class Main2 extends State<Main> {
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
        color: Colors.blue,
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