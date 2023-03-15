import 'package:aulanosa_app/alumno/menu_principal_alumno.dart';
import 'package:aulanosa_app/alumno/screem_calendario_alumno.dart';
import 'package:aulanosa_app/pantallas/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calendario_alumno()
    );
  }
}

