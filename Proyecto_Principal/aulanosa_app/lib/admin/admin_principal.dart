import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//Pagina AdminPrincipal de administrador
class AdminPrincipal extends StatefulWidget {
  const AdminPrincipal({super.key});

  @override
  State<AdminPrincipal> createState() => _AdminPrincipalState();
}

class _AdminPrincipalState extends State<AdminPrincipal> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Página Principal'),
      leading: MenuWidget(),
    ),
  );
}