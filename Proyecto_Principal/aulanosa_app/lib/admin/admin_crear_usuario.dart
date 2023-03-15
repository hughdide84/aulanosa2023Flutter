import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


//Pagina para crear nuevos usuarios
class CrearUsuarios extends StatefulWidget {
  const CrearUsuarios({super.key});

  @override
  State<CrearUsuarios> createState() => _CrearUsuariosState();
}

class _CrearUsuariosState extends State<CrearUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear Usuarios')),
    );
  }
}