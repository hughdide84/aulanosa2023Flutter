import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


//Pagina para editar/mostrar AdminProductos
class AdminProductos extends StatefulWidget {
  const AdminProductos({super.key});

  @override
  State<AdminProductos> createState() => _AdminProductosState();
}

class _AdminProductosState extends State<AdminProductos> {
  @override
 Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Productos'),
      leading: MenuWidget(),
    ),
  );
}