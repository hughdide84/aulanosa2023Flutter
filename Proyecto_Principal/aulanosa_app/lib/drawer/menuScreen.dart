import 'package:aulanosa_app/drawer/mainScreen%20copy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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
        color: Color.fromARGB(255, 74, 29, 251),
        child: IconButton(
          onPressed:(){
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Prueba()),
            );
          } ,
          icon: Icon(Icons.abc)
        ),
      ),
    );
  }
  
}


