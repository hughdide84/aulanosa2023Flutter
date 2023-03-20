
// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_import, unnecessary_import, use_key_in_widget_constructors, camel_case_types, annotate_overrides, unused_element

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../objetosNecesarios/menu_widget.dart';

//Pagina que contiene la informacion de proyecto del alumno
const List<String> lista = ["", "", "", "", "", ""];

class Proyecto_alumno extends StatefulWidget {
  Proyecto_alumno2 createState() => Proyecto_alumno2();
}

int prueba = 0;

class Proyecto_alumno2 extends State<Proyecto_alumno> {
  var size, heightA, widthA;

  List<Card> listaCartas = [];

  @override
  Widget build(BuildContext context) {
    var size, heightA, widthA;
    late double alturaPantalla;
    late double anchoPantalla;
    bool tutoria = false;
    DateTime hoy = DateTime.now();
    bool marcado = false;

    //Reogememos las medidas de alto y ancho del dispositivo para poder trabajar siempre con medidas RELATIVAS
    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });

    //Metodo para crear cada carta de tutoria
    void menuTutoria() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    child: ListView.builder(
                        //Longitud de la lista
                        itemCount: lista.length,
                        itemBuilder: ((context, index) {
                          /*Retornamos la estructura de la carta, lo hacemos de esta manera
                          para poder actualizar el estado dentro del propio showDialog
                          */
                          bool marcado = false;
                          List<Widget> listaCartas = <Widget>[];
                          Widget carta = Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.white,
                              child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                     
                                      color: Colors.grey[100]),
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 200,
                                  width: 300,
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      child: Stack(
                                                        
                                                        children: [
                                                          Row(children: [
                                                            Container(
                                                          width: 180,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border(
                                                                top: BorderSide
                                                                    .none,
                                                                left: BorderSide
                                                                    .none,
                                                                right:
                                                                    BorderSide
                                                                        .none,
                                                                bottom: BorderSide(
                                                                    color: Colors.blueGrey,
                                                                        
                                                                    width: 4)),
                                                          ),
                                                          child: Text("Tutoria",
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  color: Colors.blueGrey                                  ,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 40),
                                                          child: IconButton(
                                                              color: Colors
                                                                  .yellowAccent,
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                  Icons.star)))
                                                ])],
                                                  )),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black)),
                                                  )
                                                ],
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              margin: EdgeInsets.only(top: 30),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 3,
                                                    color: Colors.blueGrey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                hoy.toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.blueGrey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                    ],
                                  )));
                                   listaCartas.add(carta);
                                 
                                  return carta;
                          }))));
          });
        },
      );
    }

    void menuEstadoProyecto() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Padding(padding: EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: [
              Container(
               
                decoration: BoxDecoration(
                   
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 400,
                width: 400,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(bottom: 30),
                    
                    padding: EdgeInsets.only(top: 30),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [ 
                      Column(
                        
                        children: [
                          Container(
                            width: 220,
                            decoration: BoxDecoration(
                             
                              border: Border(                                             
                                top: BorderSide.none,
                                left: BorderSide.none,
                                right: BorderSide.none,
                                bottom: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 4)),
                                  ),
                            child: Text("Estado proyecto", textAlign: TextAlign.center, style: TextStyle( fontSize: 30,
                              color: Colors.blueGrey, fontWeight: FontWeight.bold))),
                         
                           Padding(
                            padding: EdgeInsets.all(15),
                            child:Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white, width: 3)),
                           margin: EdgeInsets.only(top: 70),
                          
                         
                          child: LinearProgressIndicator(
                            
                            minHeight: 40,
                            color: Color.fromARGB(255, 0, 255, 8),
                              value: 23
                            ), )),
                            Text("Estado: en proceso", style: TextStyle(fontSize: 20, color:Colors.blueGrey ) ),
                            
                           

                      ],)
                    

                  ],)
                )
            ))],)
            );
    });
        });}

        void listaCorreciones(){
          showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    child: ListView.builder(
                        //Longitud de la lista
                        itemCount: lista.length,
                        itemBuilder: ((context, index) {
                          /*Retornamos la estructura de la carta, lo hacemos de esta manera
                          para poder actualizar el estado dentro del propio showDialog
                          */
                          bool marcado = false;
                          List<Widget> listaCartas = <Widget>[];
                          Widget carta = Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.white,
                              child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                     
                                      color: Colors.grey[100]),
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 200,
                                  width: 300,
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            decoration:BoxDecoration(
                                              border: Border(top: BorderSide.none, left: BorderSide.none,
                                                right: BorderSide.none, bottom: BorderSide(color: Colors.blueGrey,
                                                width: 4))),
                                            child: Row(children: [
                                              Text("Correciones", style: TextStyle(fontSize: 30, color: Colors.blueGrey                                  ,
                                                fontWeight: FontWeight.bold)),
                                                Container(
                                                  margin: EdgeInsets.only(left: 100),
                                                  child: IconButton(
                                                    color: Colors.blueGrey,
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                  Icons.calendar_today)))
                                            ],)),

                                            Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              margin: EdgeInsets.only(top: 30),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 3,
                                                    color: Colors.blueGrey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: TextButton(
                                                onPressed: () {
                                                  showDialog(context: context, builder: (BuildContext context){
                                                    return Padding(
                                                      padding: EdgeInsets.all(20),
                                                      
                                                      child: Card(
                                                         shape: RoundedRectangleBorder(
                                                         borderRadius: BorderRadius.circular(10)),
                                                         color: Colors.white,
                                                         child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(15),
                                                          color: Colors.grey[100],
                                                          ),
                                                          margin: EdgeInsets.only(bottom: 30),
                                                          child: Stack(children: [
                                                            Column(children: [
                                                              IconButton(onPressed: () {
                                                                Navigator.pop(context);
                                                              }, icon: Icon(Icons.share_sharp))
                                                            ],)
                                                          ],)
                                                        )));
                                                  });
                                                },
                                                child: Text( "Informacion",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.blueGrey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                               
                                              ))
                                      )],
                                      ),
                                    ],
                                  )));
                                   listaCartas.add(carta);
                                 
                                  return carta;
                          }))));
          });
        },
      );
        }
    //Cuerpo de vision de estado de proyecto
    Widget ventana_estado_proyecto() {
      return Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
              alignment: Alignment.center,
              width: anchoPantalla * 0.9,
              height: alturaPantalla * 0.18,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 72, 122, 216),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(9.0),
              ),
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
                              color: Colors.blueGrey)),
                    ),
                    onTap: () {
                      menuEstadoProyecto();
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
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 72, 122, 216),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(9.0),
                  ),
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
                              color: Colors.blueGrey)),
                    ),
                    onTap: () {
                    listaCorreciones();
                    },
                  ),
                ],
              )));
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
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 72, 122, 216),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(9.0),
                 ),
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
                              color: Colors.blueGrey   )),
                    ),
                    onTap: () {
                      menuTutoria();
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
/*
child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      child: Stack(
                                                        
                                                        children: [
                                                          Row(children: [
                                                            Container(
                                                          width: 0,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border(
                                                                top: BorderSide
                                                                    .none,
                                                                left: BorderSide
                                                                    .none,
                                                                right:
                                                                    BorderSide
                                                                        .none,
                                                                bottom: BorderSide(
                                                                    color: Colors.blueGrey,
                                                                        
                                                                    width: 4)),
                                                          ),
                                                          child: Text("Tutoria",
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  color: Colors.blueGrey                                  ,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                                          ),
                                                                          Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 40),
                                                          child: IconButton(
                                                              color: Colors
                                                                  .yellowAccent,
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                  Icons.star)))
                                                      
                                                ])],
                                                  )),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black)),
                                                  )
                                                ],
                                              )

*/