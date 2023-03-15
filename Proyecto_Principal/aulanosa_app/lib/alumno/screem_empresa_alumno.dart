// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, unused_import, annotate_overrides

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

//Pagina que mostrara la informacion referida a la empresa del alumno
class Empresa_alumno extends StatefulWidget {
  Empresa_alumno2 createState() => Empresa_alumno2();
}

class Empresa_alumno2 extends State<Empresa_alumno> {
  var size, heightA, widthA;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text('Informacion Empresa'),
      leading: MenuWidget(),
    ),
  );
  
}