// ignore_for_file: use_key_in_widget_constructors, duplicate_import, unused_import, prefer_const_constructors

import 'package:aulanosa_app/alumno/drawer_alumno.dart';
import 'package:aulanosa_app/alumno/menu_principal_alumno.dart';
import 'package:aulanosa_app/alumno/screem_empresa_alumno.dart';
import 'package:aulanosa_app/alumno/screem_mensajeria_alumno.dart';
import 'package:aulanosa_app/alumno/screem_notas_alumno.dart';
import 'package:aulanosa_app/alumno/screem_proyecto_alumno.dart';
import 'package:aulanosa_app/screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'alumno/menu_principal_alumno.dart';
import 'screens/menu_item.dart';

class MyApp extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
  }

class HomePageState extends State<MyApp>{
  //pantalla actual de entre todas las existentes
  MenuItemm currentItem = MenuItems.main_alumno;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ZoomDrawer(

        //menuScreen es el cuerpo del drawer
        menuScreen: Builder(
          builder: (context) => Menu(
            currentItem: currentItem,
            //cambia el valor de la pantalla actual a la que hemos clickado en el drawer y cierra el drawer
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
              });
              ZoomDrawer.of(context)!.close();
            }
          ),
        ) ,

        //mainScreen es la pantalla a la que accedemos a través de las opciones del drawer
        mainScreen: getScreen(),
        //opciones estéticas del drawer
        borderRadius: 30.0,
        showShadow: true,
        angle: 0,
        menuBackgroundColor: Color.fromARGB(255, 74, 29, 251),
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        //slideWidth: MediaQuery.of(context).size.width * 0.75
      ),
    );
  }

  //esta funcion devuelve una pantalla (clase) en base al valor actual de 'currentItem', el cual cambia de valor al darle
  //click a las opciones que vemos en el drawer
  Widget getScreen(){
    switch (currentItem){
      case MenuItems.main_alumno:
        return Main_alumno();
      case MenuItems.empresa_alumno:
        return Empresa_alumno();
      case MenuItems.mensajes_alumno:
        return Mensajeria_alumno();
      case MenuItems.notas_alumno:
        return Notas_alumno();
      case MenuItems.proyecto_alumno:
        return Proyecto_alumno();
      default:
        return Main_alumno();
    }
  }

}
