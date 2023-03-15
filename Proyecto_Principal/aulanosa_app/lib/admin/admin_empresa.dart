import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


//Pagina para editar/mostrar Empresas y su informacion // 
class AdminEmpresa extends StatefulWidget {
  const AdminEmpresa({super.key});

  @override
  State<AdminEmpresa> createState() => _AdminEmpresaState();
}

class _AdminEmpresaState extends State<AdminEmpresa> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Información Empresas'),
      leading: MenuWidget(),
    ),
  );
}