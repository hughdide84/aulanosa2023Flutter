// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, annotate_overrides, unused_import, unnecessary_import

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//Pagina que mostrara el calendario el alumno
class Calendario_alumno extends StatefulWidget {
  Calendario_alumno2 createState() => Calendario_alumno2();
}

class Calendario_alumno2 extends State<Calendario_alumno> {
  var size, heightA, widthA;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Calendario'),
      leading: MenuWidget(),
    ),
  );
  
}