// ignore_for_file: use_key_in_widget_constructors, duplicate_import, unused_import, prefer_const_constructors

import 'package:aulanosa_app/admin/admin_alumnos.dart';
import 'package:aulanosa_app/admin/admin_alumnos_externos.dart';
import 'package:aulanosa_app/admin/admin_crear_usuario.dart';
import 'package:aulanosa_app/admin/admin_cursos.dart';
import 'package:aulanosa_app/admin/admin_empresa.dart';
import 'package:aulanosa_app/admin/admin_principal.dart';
import 'package:aulanosa_app/admin/admin_productos.dart';
import 'package:aulanosa_app/admin/admin_proyectos.dart';
import 'package:aulanosa_app/admin/drawer_admin.dart';
import 'package:aulanosa_app/alumno/drawer_alumno.dart';
import 'package:aulanosa_app/alumno/menu_principal_alumno.dart';
import 'package:aulanosa_app/alumno/pruebas_ppal.dart';
import 'package:aulanosa_app/alumno/screem_calendario_alumno.dart';
import 'package:aulanosa_app/alumno/screem_empresa_alumno.dart';
import 'package:aulanosa_app/alumno/screem_mensajeria_alumno.dart';
import 'package:aulanosa_app/alumno/screem_notas_alumno.dart';
import 'package:aulanosa_app/alumno/screem_proyecto_alumno.dart';
import 'package:aulanosa_app/pantallas/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../alumno/menu_principal_alumno.dart';
import '../objetosNecesarios/menu_item.dart';

class MyApp extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
  }

class HomePageState extends State<MyApp>{
  //pantalla actual de entre todas las existentes

  //IMPORTANTE!!!!!!!!!!: esto debe recibir valor despues del login, para que lleve a la pagina principal del
  //alumno o admin dependiendo del usuario, no siemore del alumno//
  MenuItemm itemActual = MenuItems.main_alumno;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ZoomDrawer(

        //menuScreen es el cuerpo del drawer//

        // Este builder va a depender en un futuro de la variable que recojamos de la API que nos diga el roll del usuario //
        // En el builder le vamos a mandar o Menu que es para el usuario alumno y sus pantallas //
        // O Menu2 que es para el admin y sus pantallas //
        menuScreen: Builder(
          //SE DEBE HACER UNA FUNCION WIDGET QUE EN BASE A LO QUE RECIBA DEL LOGIN DEVUELVA MENU_ALUMNO O MENU_ADMIN//
          builder: (context) => Menu_admin(
            itemActual: itemActual,
            //cambia el valor de la pantalla actual a la que hemos clickado en el drawer y cierra el drawer
            onSelectedItem: (item) {
              setState(() {
                itemActual = item;
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
        menuBackgroundColor: Color.fromARGB(255, 72, 122, 216),
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.linear
        //slideWidth: MediaQuery.of(context).size.width * 0.75
      ),
    );
  }

  //esta funcion devuelve una pantalla (clase) en base al valor actual de 'itemActual', el cual cambia de valor al darle
  //click a las opciones que vemos en el drawer //
  // Hay dos listas de MenuItems, MenuItems es para las clases que contienen las pantallas disponibles para los usuarios alumnos //
  // MenuItems2 es para las clases que contienen las pantallas disponibles para los admins/editores //
  Widget getScreen(){
    switch (itemActual){

      // Casos para las pantallas de alumnos //
      case MenuItems.main_alumno:
        return PruebasPpalAlumno();
      case MenuItems.empresa_alumno:
        return Empresa_alumno();
      case MenuItems.mensajes_alumno:
        return Mensajeria_alumno();
      case MenuItems.notas_alumno:
        return Notas_alumno();
      case MenuItems.proyecto_alumno:
        return Proyecto_alumno();
      case MenuItems.calendario_alumno:
        return Calendario_alumno();

        // Casos para las pantallas de admin/editor //
      case MenuItems2.adminPrincipal:
        return AdminPrincipal();   
      case MenuItems2.adminAlumnos:
        return AdminAlumnos();
      case MenuItems2.adminAlumnosExternos:
        return AlumnosExternos();
      case MenuItems2.adminCursos:
        return AdminCursos();  
      case MenuItems2.adminEmpresa:
        return AdminEmpresa();
      case MenuItems2.adminProductos:
        return AdminProductos();
      case MenuItems2.adminProyectos:
        return AdminProyectos();
         

        // Este default VA A ESTAR CONTROLADO POR LA VARIABLE QUE CONTENGA EL ROLL DEL USUARIO QUE SE HA LOGGEADO
        // QUE SE VA A HACER EN UN FUTURO CUANDO LA API NOS DEVUELVA ESTA INFO //
      default:
        return AdminPrincipal();

      /*
      default:
        if(rollUsuario=="alumno"){
            return Main_Alumno();

        }else if(rollUsuario=="admin"){
            return AdminPrincipal();
        }
      */ 
    }
  }

}
