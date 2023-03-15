// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, unused_import, annotate_overrides

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//Pagina que contiene las notas del alumno
class Notas_alumno extends StatefulWidget {
  Notas_alumno2 createState() => Notas_alumno2();
}

class Notas_alumno2 extends State<Notas_alumno> {
  var size, heightA, widthA;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Notas'),
      leading: MenuWidget(),
    ),
  );}