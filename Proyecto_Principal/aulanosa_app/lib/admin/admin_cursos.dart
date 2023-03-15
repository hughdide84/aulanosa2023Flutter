import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//Pagina para editar/mostrar cursos
class Cursos extends StatefulWidget {
  const Cursos({super.key});

  @override
  State<Cursos> createState() => _CursosState();
}

class _CursosState extends State<Cursos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cursos')),
    );
  }
}