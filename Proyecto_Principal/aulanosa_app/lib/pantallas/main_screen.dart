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
import 'package:aulanosa_app/alumno/menu_principal_alumno.dart';
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
import 'package:aulanosa_app/globals/variable_global.dart' as globales;

class MyApp extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
  }

class HomePageState extends State<MyApp>{
  // pantalla actual de entre todas las existentes //

  late MenuItemm itemActual;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: ZoomDrawer(

        //menuScreen es el cuerpo del drawer//

        menuScreen: Builder(
          builder: (context)=> pantallaSiguiente(),
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
  // Hay dos listas de MenuItems, MenuItems_Alumno es para las clases que contienen //
  // las pantallas disponibles para los usuarios alumnos //
  // MenuItems_Admin es para las clases que contienen las pantallas disponibles para los admins/editores //

  Widget getScreen(){

    if(!globales.inicializado){
      globales.inicializado=true;
      if(globales.roll=="ADMIN"){
       itemActual = MenuItems_Admin.adminPrincipal;
      }else if(globales.roll=="ALUMNO"){
        itemActual = MenuItems_Alumno.main_alumno;
      }else if(globales.roll=="EDITOR"){
        itemActual = MenuItems_Admin.adminEmpresa;
      }
    }

    if(globales.redireccion==""){
      //NO DEBE HACER NADA SI ESTÁ VACÍO
    }else{
      valorRedireccion();
    }

    //MenuItemm itemActual = MenuItems_Alumno.main_alumno;
    switch (itemActual){
      
      // Casos para las pantallas de alumnos //
      case MenuItems_Alumno.main_alumno:
        return AlumnoPrincipal();
      case MenuItems_Alumno.empresa_alumno:
        return Empresa_alumno();
      case MenuItems_Alumno.mensajes_alumno:
        return Mensajeria_alumno();
      case MenuItems_Alumno.notas_alumno:
        return Notas_alumno();
      case MenuItems_Alumno.proyecto_alumno:
        return Proyecto_alumno();
      case MenuItems_Alumno.calendario_alumno:
        return Calendario_alumno();

        // Casos para las pantallas de admin/editor //
      case MenuItems_Admin.adminPrincipal:
        return AdminPrincipal();   
      case MenuItems_Admin.adminAlumnos:
        return AdminAlumnos();
      case MenuItems_Admin.adminAlumnosExternos:
        return AlumnosExternos();
      case MenuItems_Admin.adminCursos:
        return AdminCursos();  
      case MenuItems_Admin.adminEmpresa:
        return AdminEmpresa();
      case MenuItems_Admin.adminProductos:
        return AdminProductos();
      case MenuItems_Admin.adminProyectos:
        return AdminProyectos();
         

        // Este default va controlado por la variable global del roll que he actualizado en el login //
        
      default:
        if(globales.roll=="ALUMNO"){
          return AlumnoPrincipal();

        }else if(globales.roll=="ADMIN"){

          return AdminPrincipal();

        }else if(globales.roll=="EDITOR"){

          return AdminPrincipal();
          // En caso de que de alguna forma de error de momento lo mando //
          // A la clase del alumno que es el usuario que suele puede consultar datos y no modificarlos //
        }else{
          return AlumnoPrincipal();
        }
      
    }
  }

  Builder pantallaSiguiente(){

    // Mirar la nomenclatura para el alumno //
    if(globales.roll=="ALUMNO"){
      
      return Builder(
        builder: (context) => Menu_alumno(
          itemActual: itemActual,
          //cambia el valor de la pantalla actual a la que hemos clickado en el drawer y cierra el drawer
          onSelectedItem: (item) {
            setState(() {
              itemActual = item;
            });
            ZoomDrawer.of(context)!.close();
          }
        ),

      );
    }
    if(globales.roll=="ADMIN"){
      
      return  Builder(
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

      );
    }

    if(globales.roll=="EDITOR"){
      
      return  Builder(
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

      );
    }

    return Builder(
      builder: (context) => Menu_alumno(
        itemActual: itemActual,
        //cambia el valor de la pantalla actual a la que hemos clickado en el drawer y cierra el drawer
        onSelectedItem: (item) {
          setState(() {
            itemActual = item;
          });
          ZoomDrawer.of(context)!.close();
        }
      ),

    );
  }


  //cuando intentas ir a una página del drawer mediante un boton y no desde el propio drawer
  //al volver a pulsar el boton de abrir el drawer el programa explota, ya que al hacer un navigator
  //finaliza el drawer inicializado.
  //la forma de solucionar esto es navegar a la pagina principal, que sí inicializa el drawer
  //y cambiar la pagina inicial
  void valorRedireccion(){

    if(globales.redireccion=="calendario"){
      itemActual = MenuItems_Alumno.calendario_alumno;
    }else if(globales.redireccion=="notas"){
      itemActual = MenuItems_Alumno.notas_alumno;
    }else if(globales.redireccion=="empresa"){
      itemActual = MenuItems_Alumno.empresa_alumno;
    }else if(globales.redireccion=="proyecto"){
      itemActual = MenuItems_Alumno.proyecto_alumno;
    }else if(globales.redireccion=="mensajes"){
      itemActual = MenuItems_Alumno.mensajes_alumno;
    }else if(globales.redireccion=="Añadir Usuarios"){
      itemActual = MenuItems_Admin.adminAlumnosExternos;
      }else if(globales.redireccion=="Empresas"){
      itemActual = MenuItems_Admin.adminEmpresa;
      }
      else if(globales.redireccion=="Alumnos"){
      itemActual = MenuItems_Admin.adminAlumnos;
      }
      else if(globales.redireccion=="Proyectos"){
      itemActual = MenuItems_Admin.adminProyectos;
      }
      else if(globales.redireccion=="Alumnos externos"){
      itemActual = MenuItems_Admin.adminAlumnosExternos;
      }
      else if(globales.redireccion=="Cursos"){
      itemActual = MenuItems_Admin.adminCursos;
      }else{
        //no deberia haber else, cuando todas las clases estén implementadas se debe borrar
        itemActual = MenuItems_Alumno.main_alumno;
      }

    globales.redireccion = "";
  }

    
}
