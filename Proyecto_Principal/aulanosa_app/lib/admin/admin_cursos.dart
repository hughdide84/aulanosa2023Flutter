import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//Pagina para editar/mostrar AdminCursos
class AdminCursos extends StatefulWidget {
  const AdminCursos({super.key});

  @override
  State<AdminCursos> createState() => _AdminCursosState();
}

class _AdminCursosState extends State<AdminCursos> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Cursos'),
      leading: MenuWidget(),
    ),
  );
}