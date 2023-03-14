import 'package:aulanosa_app/screens/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Main extends StatefulWidget {
  Main2 createState() => Main2();
}

class Main2 extends State<Main> {
  var size, heightA, widthA;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text('Página principal'),
      leading: MenuWidget(),
    ),
  );
  
}