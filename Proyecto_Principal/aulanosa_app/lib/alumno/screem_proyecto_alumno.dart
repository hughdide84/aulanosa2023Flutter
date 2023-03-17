// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, annotate_overrides, unused_import, unused_local_variable, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, unused_element, unused_field, no_leading_underscores_for_local_identifiers


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../objetosNecesarios/menu_widget.dart';
//Pagina que contiene la informacion de proyecto del alumno

class Proyecto_alumno extends StatefulWidget {
  Proyecto_alumno2 createState() => Proyecto_alumno2();
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class Proyecto_alumno2 extends State<Proyecto_alumno> {
  var size, heightA, widthA;
  final List<Item> _data = generateItems(20);

  @override
  Widget build(BuildContext context) {
    var size, heightA, widthA;
    late double alturaPantalla;
    late double anchoPantalla;

    //Reogememos las medidas de alto y ancho del dispositivo para poder trabajar siempre con medidas RELATIVAS
    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });

    //Metodo para generar la la lista
    Widget _buildPanel() {
      return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
                title: Text(item.expandedValue),
                trailing: Icon(Icons.abc),
                onTap: () {
                  setState(() {
                    //_data.removeWhere((Item currentItem) => item == currentItem);
                  });
                }),
            isExpanded: item.isExpanded,
          );
        }).toList(),
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
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 72, 122, 216),
                        Colors.cyan,
                        Color.fromARGB(255, 72, 122, 216)
                      ],
                      stops: [
                        0.2,
                        0.7,
                        4
                      ],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomCenter),
                  color: Color.fromARGB(255, 233, 233, 233),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 72, 122, 216),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(color: Colors.cyan, width: 2)),
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

    //Estructura de la carta de tutorias
    Card tutoriaCarta() {
      return Card(
          //Modificamos la forma de nuestra carta con esta propiedad
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //Ahora viene la propia estructura de la carta
          child: Column(
            children: <Widget>[
              ListTile(),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.abc),
                  ),
                  IconButton(onPressed: () => {}, icon: Icon(Icons.abc))
                ],
              )
            ],
          ));
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
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 72, 122, 216),
                        Colors.cyan,
                        Color.fromARGB(255, 72, 122, 216)
                      ],
                      stops: [
                        0.2,
                        0.7,
                        4
                      ],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomCenter),
                  color: Color.fromARGB(255, 233, 233, 233),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 72, 122, 216),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(color: Colors.cyan, width: 2)),
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
                          return SingleChildScrollView(
                            child: Container(
                              child: _buildPanel(),
                            ),
                          );
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
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 72, 122, 216),
                        Colors.cyan,
                        Color.fromARGB(255, 72, 122, 216)
                      ],
                      stops: [
                        0.2,
                        0.7,
                        4
                      ],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomCenter),
                  color: Color.fromARGB(255, 233, 233, 233),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 72, 122, 216),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(color: Colors.cyan, width: 2)),
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

/*ExpansionPanelList(
                        children: [
                          ExpansionPanel(
                              headerBuilder: (context, isOpen) {
                                return Text("Hello");
                              },
                              body: Text("Now open"),
                              isExpanded: true),
                          ExpansionPanel(
                              headerBuilder: (context, isOpen) {
                                return Text("Hello");
                              },
                              body: Text("Now open"),
                              isExpanded: estaAbierto[1]),
                        ],
                        expansionCallback: (i, isOpen) =>
                            setState(() => estaAbierto[i] = !isOpen),
                      ); */
