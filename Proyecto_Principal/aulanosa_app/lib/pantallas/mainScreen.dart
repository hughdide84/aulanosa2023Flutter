// ignore_for_file: unused_import, annotate_overrides, prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unnecessary_import

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Main extends StatefulWidget {
  Main2 createState() => Main2();
}

//CLASE DE PRUEBA, PLACEHOLDER, NO REPRESENTA NADA //

class Main2 extends State<Main> {
  //tamaño de pantalla, ancho y alto
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