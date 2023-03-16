// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, annotate_overrides, unused_import, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//Pagina que contiene la informacion de proyecto del alumno

class Proyecto_alumno extends StatefulWidget {
  Proyecto_alumno2 createState() => Proyecto_alumno2();
}

class Proyecto_alumno2 extends State<Proyecto_alumno> {
  var size, heightA, widthA;

 

  

  @override
  Widget build(BuildContext context){ 
    var size, heightA, widthA;
    late double alturaPantalla;
    late double anchoPantalla;

     //Reogememos las medidas de alto y ancho del dispositivo para poder trabajar siempre con medidas RELATIVAS
    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });
   //Cuerpo de Vision de las fechas marcadas
  Widget ventana_fechas_marcadas(){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
         alignment: Alignment.center,
         width: anchoPantalla * 0.9,
         height: alturaPantalla * 0.18,
         decoration: BoxDecoration(
         color: Color.fromARGB(255, 233, 233, 233),
         boxShadow: [
          BoxShadow(
            color:Color.fromARGB(255, 72, 122, 216),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(9.0),
        border: Border.all(color: Colors.black)),
        child: Stack(
          children: [
            Text("Correciones")
        ],
      )));
  }
  //Cuerpo de vision de estado de proyecto
  Widget ventana_estado_proyecto(){
        return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
         alignment: Alignment.center,
         width: anchoPantalla * 0.9,
         height: alturaPantalla * 0.18,
         decoration: BoxDecoration(
         color: Color.fromARGB(255, 233, 233, 233),
         boxShadow: [
          BoxShadow(
            color:Color.fromARGB(255, 72, 122, 216),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(9.0),
        border: Border.all(color: Colors.black)),
        child: Stack(
          children: [
            Text("Fechas proyecto")
        ],
      )));
  }
  
  //Cuerp de vision de la ventana de correciones
  Widget ventana_correciones(){
     return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
         alignment: Alignment.center,
         width: anchoPantalla * 0.9,
         height: alturaPantalla * 0.18,
         decoration: BoxDecoration(
         color: Color.fromARGB(255, 233, 233, 233),
         boxShadow: [
          BoxShadow(
            color:Color.fromARGB(255, 72, 122, 216),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(9.0),
        border: Border.all(color: Colors.black)),
        child: Stack(
          children: [
            Text("Estado del proyecto")
        ],
      )));
  }
  
 return Scaffold(
    backgroundColor: Color.fromARGB(255, 233, 233, 233),
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Proyecto final'),
      leading: MenuWidget(),
    ),
    body: SafeArea(
      child: Stack(children: [
        Column(children: [
          ventana_correciones(),
          ventana_estado_proyecto(),
          ventana_fechas_marcadas(), 
        ],),
         Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  "assets/images/logoDark.png",
                  width: 717 * 0.3,
                  height: 445 * 0.3,
                ),
              )
      ],)
    )
  );}
}
// Requisitos -> 
  /*
  Visión de las fechas marcadas de tutorias, estado del proyecto que se esta
  realizando con comentarios, ventana de correciones para que los profesores
  puedan escribir las correcciones que le haga al alumno
  */