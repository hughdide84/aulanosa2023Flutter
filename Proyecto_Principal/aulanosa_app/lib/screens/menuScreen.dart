import 'package:aulanosa_app/screens/menu_item.dart';
import 'package:flutter/material.dart';



//definimos todas las opciones accesibles desde el drawer
class MenuItems{

  static const payment = MenuItemm('pagacabron', Icons.monetization_on);
  static const mimadre = MenuItemm('mimamasita', Icons.woman);
  static const piedad = MenuItemm('piedad', Icons.church);

  static const all = <MenuItemm>[
    payment,
    mimadre,
    piedad
  ];

}

//La clase Menu es el cuerpo del Drawer en si, lo que vemos al pulsar el botón de la esquina superior izquierda
class Menu extends StatelessWidget {

  final MenuItemm currentItem;
  final ValueChanged<MenuItemm> onSelectedItem;

  const Menu({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key:key);
  

  @override
  Widget build(BuildContext context) => Theme (
    data: ThemeData.dark(),
    child: Scaffold(

      backgroundColor: Color.fromARGB(255, 74, 29, 251),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //el cuerpo del drawer contiene todas las opciones 'MenuItemm' que tenemos definidas con un espacio
          //estético entre ellas
          children: <Widget> [
            Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            Spacer(flex: 2,)
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
      selected: currentItem == item,
      minLeadingWidth: 20,
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: () => onSelectedItem(item),
    ),
  );


}

