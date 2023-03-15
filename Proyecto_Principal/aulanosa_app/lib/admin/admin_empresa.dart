import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


//Pagina para editar/mostrar empresas
class Empresas extends StatefulWidget {
  const Empresas({super.key});

  @override
  State<Empresas> createState() => _EmpresasState();
}

class _EmpresasState extends State<Empresas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Empresass')),
    );
  }
}