// ignore_for_file: depend_on_referenced_packages, unused_import, prefer_const_constructors

import 'package:aulanosa_app/admin/admin_cursos.dart';
import 'package:aulanosa_app/admin/admin_empresa.dart';
import 'package:aulanosa_app/admin/admin_proyectos_tutorias.dart';
import 'package:aulanosa_app/alumno/menu_principal_alumno.dart';
import 'package:aulanosa_app/alumno/screem_calendario_alumno.dart';
import 'package:aulanosa_app/alumno/screem_mensajeria_alumno.dart';
import 'package:aulanosa_app/alumno/screem_proyecto_alumno.dart';
import 'package:aulanosa_app/pantallas/login.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future main() async {
  //Esto es una promesa, primero el primer metodo se encargara de aplicar los diferentes formatos de fecha
  //despues esto devolvera un resultado, para acceder a ese resultado se pone la palabra reservada then y se runnea la app
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TutoriasAdmin()
    );
  }
}

