import 'package:aulanosa_app/screens/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Pollaycojone extends StatefulWidget {
  Pollaycojone2 createState() => Pollaycojone2();
}

class Pollaycojone2 extends State<Pollaycojone> {
  var size, heightA, widthA;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.yellow,
      title: Text('Página principal'),
      leading: MenuWidget(),
    ),
  );
  
}