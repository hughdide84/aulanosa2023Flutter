// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, unused_import, annotate_overrides

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//Pagina que contiene las notas del alumno
class Notas_alumno extends StatefulWidget {
  Notas_alumno2 createState() => Notas_alumno2();
}

//asignaturas deben recibirse de BBDD, ya que dependen del curso, no son siempre las mismas//
List<String> prueba = [
  "Acceso a datos",
  "Programación móvil",
  "Sistema de gestión empresarial"
];

class Notas_alumno2 extends State<Notas_alumno> {
  var size, heightA, widthA;
  

  @override
  Widget build(BuildContext context) => Scaffold(
    
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Notas'),
      leading: MenuWidget(),
    ),

    body: Container(
      color: Color.fromARGB(255, 233, 233, 233),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [

          //CONTAINER que contiene una lista de todas las asignaturas (DEBE RECIBIRLAS DE LA BASE DE DATOS)
          Container(
            margin: EdgeInsets.only(top: 20),
            height: (MediaQuery.of(context).size.height)*0.8,
            width: (MediaQuery.of(context).size.width)*0.95,
            child: ListView.builder(
              itemCount: prueba.length,
              itemBuilder: (BuildContext context, int index){

                //Cada InkWell es una asignatura, que al pulsar nos lleva a esa asignatura//
                return InkWell(

                  onTap: (){

                  },

                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 6.0,
                          offset: Offset(0.0, 0.75)
                        )
                      ],
                      color: Colors.white
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 20),
                    height: (MediaQuery.of(context).size.height)*0.1,
                    child: Row(
                      children: [
                        
                        Icon(Icons.class_, color: Color.fromARGB(255, 48, 92, 174), size: 30,),
                        SizedBox(width: 10,),
                        Text(prueba[index].toString(), style: TextStyle(color: Color.fromARGB(255, 48, 92, 174), fontSize: 20))
                      ],
                    ),
                  ),
                );
              }
            ),
          )


        ],
      ),
    ),
  );



}