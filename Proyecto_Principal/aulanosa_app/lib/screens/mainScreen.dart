// ignore_for_file: unused_import, annotate_overrides, prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unnecessary_import

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