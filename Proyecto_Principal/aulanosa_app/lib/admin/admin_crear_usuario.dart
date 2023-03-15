import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


// Pagina para crear nuevos usuarios ESTA VENTANA SE ABRE DE LA VENTANA DE admin_alumnos //
class CrearUsuarios extends StatefulWidget {
  const CrearUsuarios({super.key});

  @override
  State<CrearUsuarios> createState() => _CrearUsuariosState();
}

class _CrearUsuariosState extends State<CrearUsuarios> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Crear Usuarios'),
      leading: MenuWidget(),
    ),
  );
}