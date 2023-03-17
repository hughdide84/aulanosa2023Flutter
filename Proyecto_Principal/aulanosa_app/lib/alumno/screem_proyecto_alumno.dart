// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, annotate_overrides, unused_import, unused_local_variable, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, unused_element, unused_field, no_leading_underscores_for_local_identifiers, prefer_final_fields, sort_child_properties_last, sized_box_for_whitespace


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../objetosNecesarios/menu_widget.dart';
//Pagina que contiene la informacion de proyecto del alumno
const List <String> lista = ['One', 'Two', 'Three', 'Four'];

class Proyecto_alumno extends StatefulWidget {
  Proyecto_alumno2 createState() => Proyecto_alumno2();
}

bool marcado = false;


class Proyecto_alumno2 extends State<Proyecto_alumno> {
  var size, heightA, widthA;
  
  
  String dropdownValue = lista.first;
  

  

  @override
  Widget build(BuildContext context) {
    
    var size, heightA, widthA;
    late double alturaPantalla;
    late double anchoPantalla;
    DateTime hoy = DateTime.now();

    //Reogememos las medidas de alto y ancho del dispositivo para poder trabajar siempre con medidas RELATIVAS
    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });
    
    ListView _lista() {
  return ListView(
    children: <Widget>[
      // ListTile es un widget que funciona como un bloque del ListView
      ListTile(
        // Tiene muchas propiedades que nos ayudan a ordenar la información.
        // Titulo
        title: Text('Primero'),
        // Subtitulo
        subtitle: Text('Este es el primer Tile'),
        // Icono inicial del bloque
        leading: Icon(Icons.add),
        // Funcion que se ejecuta al hacer click en él
        onTap: () {},
      ),
      ListTile(
        title: Text('Primero'),
        onTap: () {},
      )
    ],
  );
}



    //Cuerpo de Vision de las fechas marcadas
    Widget ventana_fechas_marcadas() {
      return Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
              alignment: Alignment.center,
              width: anchoPantalla * 0.9,
              height: alturaPantalla * 0.18,
              decoration: BoxDecoration(
                 
                  color: Color.fromARGB(255, 72, 122, 216),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 72, 122, 216),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(color: Colors.cyan, width: 3)),
              child: Stack(
                children: [
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: anchoPantalla * 0.9,
                      height: alturaPantalla * 0.18,
                      child: Text("Tutorias",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white)),
                    ),
                    onTap: () {
                      print("hola");
                    },
                  ),
                ],
              )));
    }

    Color seleccionado() {
      if(!marcado){
        return Color.fromARGB(255, 72, 122, 216);
      }
      return Colors.indigo;
    }
    Widget buildCar(int index) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color.fromARGB(255, 72, 122, 216),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(15),
         boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 48, 92, 174),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
        color: seleccionado()
        ),
      margin: EdgeInsets.only(bottom: 15),
      height: 200,
      width: 300,
      child:  Stack(children: [
        Column(
          children: [
          Container(
            decoration: BoxDecoration(),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                 
                child: Row(children: [
                  Container(
                  width: 180,
                  decoration: BoxDecoration(
                  border: Border(top: BorderSide.none, left: BorderSide.none, right: BorderSide.none, bottom: BorderSide(color: Colors.cyan, width: 4) ), 
                ),
                  child: Text("Tutoria",  style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 233, 233, 233), fontWeight: FontWeight.bold))),
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: IconButton(
                      
                      color: Colors.yellowAccent,
                      onPressed: (
                      ) {
                        setState(() {
                          marcado == false ? marcado = true: marcado = false;
                        });
                        
                       
                       
                      }, icon: Icon(Icons.star)))
                ],)
           ),
           Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          )
          ],)),
          
             Container(
              alignment: Alignment.center,
              height: 40,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                
                border: Border.all(width: 3, color: Colors.cyan),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(hoy.toString(), style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),))
          ],),
      
      ],)
     ));
    //Cuerpo de vision de estado de proyecto
    Widget ventana_estado_proyecto() {
      return Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
              alignment: Alignment.center,
              width: anchoPantalla * 0.9,
              height: alturaPantalla * 0.18,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 72, 122, 216),
                 
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 72, 122, 216),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(color: Colors.cyan, width: 3)),
              child: Stack(
                children: [
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: anchoPantalla * 0.9,
                      height: alturaPantalla * 0.18,
                      child: Text("Estado del proyecto",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white)),
                    ),
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                         return StatefulBuilder(builder: (context, StateSetter setState) {
                          return Padding(
                          padding: EdgeInsets.all(20),
                          child: SingleChildScrollView(
                          child: Container(
                            width: 200,
                            child: Column(children: [
                            buildCar(1),
                             SizedBox(width: 40),
                            buildCar(1),
                            SizedBox(width: 10),
                            buildCar(1),
                            SizedBox(width: 10),
                            buildCar(1),
                            const SizedBox(width: 10),
                            buildCar(1),
                            const SizedBox(width: 10),
                            buildCar(1),
                            ],)
                        )));

                         });
            
                  },
                      );
                    },
                  ),
                ],
              )));
    }

    

    //Cuerp de vision de la ventana de correciones
    Widget ventana_correciones() {
      return Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
              alignment: Alignment.center,
              width: anchoPantalla * 0.9,
              height: alturaPantalla * 0.18,
              decoration: BoxDecoration(
                 color: Color.fromARGB(255, 72, 122, 216),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 72, 122, 216),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(color: Colors.cyan, width: 3)),
              child: Stack(
                children: [
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: anchoPantalla * 0.9,
                      height: alturaPantalla * 0.18,
                      child: Text("Correciones",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white)),
                    ),
                    onTap: () {
                      print("hola");
                    },
                  ),
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
            child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                "assets/images/logoDark.png",
                width: 717 * 0.3,
                height: 445 * 0.3,
              ),
            ),
            Column(
              children: [
                ventana_correciones(),
                ventana_estado_proyecto(),
                ventana_fechas_marcadas(),
              ],
            ),
          ],
        )));
  }

  
}

/*Padding(
                          padding: EdgeInsets.all(20),
                          child: SingleChildScrollView(
                          child: Container(
                            width: 200,
                            child: Column(children: [
                            buildCar(1),
                             SizedBox(width: 40),
                            buildCar(1),
                            SizedBox(width: 10),
                            buildCar(1),
                            SizedBox(width: 10),
                            buildCar(1),
                            const SizedBox(width: 10),
                            buildCar(1),
                            const SizedBox(width: 10),
                            buildCar(1),
                            ],)
                        ))); */