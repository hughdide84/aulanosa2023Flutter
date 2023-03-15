// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, annotate_overrides, unused_import

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//Pagina que contiene la informacion de proyecto del alumno

class Proyecto_alumno extends StatefulWidget {
  Proyecto_alumno2 createState() => Proyecto_alumno2();
}

class Proyecto_alumno2 extends State<Proyecto_alumno> {
  var size, heightA, widthA;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text('Proyecto final'),
      leading: MenuWidget(),
    ),
  );}