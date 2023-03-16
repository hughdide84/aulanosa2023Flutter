// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:aulanosa_app/objetosNecesarios/menu_item.dart';
import 'package:flutter/material.dart';

//definimos todas las opciones accesibles desde el drawer
class MenuItems2{

  static const adminPrincipal = MenuItemm('Principal', Icons.home);
  //static const adminCrearUsuario = MenuItemm('Añadir Usuario', Icons.person_add_alt_1);
  static const adminEmpresa = MenuItemm('Empresas', Icons.business_center);
  static const adminAlumnos = MenuItemm('Alumnos', Icons.group);
  static const adminProductos = MenuItemm('Productos', Icons.shopping_cart_rounded);
  static const adminProyectos = MenuItemm('Proyectos', Icons.assignment_rounded);
  static const adminAlumnosExternos = MenuItemm('Alumnos Externos', Icons.groups);
  static const adminCursos = MenuItemm('Cursos', Icons.grading_outlined);

  static const all = <MenuItemm>[
    adminPrincipal,
    //adminCrearUsuario,
    adminEmpresa,
    adminAlumnos,
    adminProductos,
    adminProyectos,
    adminAlumnosExternos,
    adminCursos
  
  ];
}

//La clase Menu es el cuerpo del Drawer en si, lo que vemos al pulsar el botón de la esquina superior izquierda
class Menu_admin extends StatelessWidget {

  final MenuItemm itemActual;
  final ValueChanged<MenuItemm> onSelectedItem;

  const Menu_admin({
    Key? key,
    required this.itemActual,
    required this.onSelectedItem,
  }) : super(key:key);
  

  @override
  Widget build(BuildContext context) => Theme (
    data: ThemeData.dark(),
    child: Scaffold(

      backgroundColor: Color.fromARGB(255, 72, 122, 216),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //el cuerpo del drawer contiene todas las opciones 'MenuItemm' que tenemos definidas con un espacio
              //estético entre ellas
              children: <Widget> [
                Spacer(),
                ...MenuItems2.all.map(buildMenuItem).toList(),
                Spacer(flex: 2,),

                
              ],
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset("assets/images/logoDark.png", width: 717*0.3, height: 445*0.3,),
            )
          ],
        )
      )
    ),
  );

  //Cambia la estética de la opción que hemos seleccionado para que:
  //-mantenga el color de letra blanco
  //-tenga un sombreado de fondo para indicar visualmente que estamos en esa pantalla
  Widget buildMenuItem(MenuItemm item) => ListTileTheme(
    selectedColor: Colors.white,
    child: ListTile(
      selectedTileColor: Colors.black26,
      selected: itemActual == item,
      minLeadingWidth: 20,
      leading: Icon(item.icono),
      title: Text(item.titulo),
      onTap: () => onSelectedItem(item),
    ),
  );
}


