import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


// Página editar/mostrar alumnos externos
class AlumnosExternos extends StatefulWidget {
  const AlumnosExternos({super.key});

  @override
  State<AlumnosExternos> createState() => _AlumnosExternosState();
}

class _AlumnosExternosState extends State<AlumnosExternos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alumnos Externos')),
    );
  }
}