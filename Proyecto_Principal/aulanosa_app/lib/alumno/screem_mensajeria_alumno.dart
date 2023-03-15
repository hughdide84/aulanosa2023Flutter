// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, annotate_overrides, unused_import

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

//Pagina de mensajeria del alumno
class Mensajeria_alumno extends StatefulWidget {
  Mensajeria_alumno2 createState() => Mensajeria_alumno2();
}

class Mensajeria_alumno2 extends State<Mensajeria_alumno> {
  var size, heightA, widthA;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Mensajeria'),
      leading: MenuWidget(),
    ),
  );}