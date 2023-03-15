import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
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
   Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text('Alumnos Externos'),
      leading: MenuWidget(),
    ),
  );
}