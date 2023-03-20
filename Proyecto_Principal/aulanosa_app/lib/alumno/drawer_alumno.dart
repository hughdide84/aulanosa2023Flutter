// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:aulanosa_app/objetosNecesarios/menu_item.dart';
import 'package:flutter/material.dart';

//definimos todas las opciones accesibles desde el drawer
// ignore: camel_case_types
class MenuItems_Alumno{
  static const main_alumno = MenuItemm('Pagina principal', Icons.church);
  static const calendario_alumno = MenuItemm('Calendario', Icons.monetization_on);
  static const notas_alumno = MenuItemm('Notas', Icons.woman);
  static const empresa_alumno = MenuItemm('Empresa', Icons.church);
  static const mensajes_alumno = MenuItemm('Mensajes', Icons.church);
  static const proyecto_alumno = MenuItemm('Proyecto final', Icons.church);
  
 //Los almacenamos en una lista para poder acceder a cada uno los items
  static const all = <MenuItemm>[
    main_alumno,
    calendario_alumno,
    notas_alumno,
    empresa_alumno,
    mensajes_alumno,
    proyecto_alumno,
  ];
}

//La clase Menu es el cuerpo del Drawer en si, lo que vemos al pulsar el botón de la esquina superior izquierda
// ignore: camel_case_types
class Menu_alumno extends StatelessWidget {

  final MenuItemm itemActual;
  final ValueChanged<MenuItemm> onSelectedItem;

  const Menu_alumno({
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
                ...MenuItems_Alumno.all.map(buildMenuItem).toList(),
                Spacer(flex: 2,)
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


