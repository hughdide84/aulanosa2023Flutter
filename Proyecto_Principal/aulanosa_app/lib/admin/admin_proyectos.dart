import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Proyectos extends StatefulWidget {
  const Proyectos({super.key});

  @override
  State<Proyectos> createState() => _ProyectosState();
}

class _ProyectosState extends State<Proyectos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Proyectos')),
    );
  }
}