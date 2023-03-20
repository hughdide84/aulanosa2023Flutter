// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, annotate_overrides, unused_import

import 'package:animate_do/animate_do.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:aulanosa_app/globals/variable_global.dart' as globales;
import 'dart:math' as math;

//Pagina de mensajeria del alumno
class Mensajeria_alumno extends StatefulWidget {
  Mensajeria_alumno2 createState() => Mensajeria_alumno2();
}

class Mensajeria_alumno2 extends State<Mensajeria_alumno> {
  var size, heightA, widthA;


  //en base al valor de 'modoCorreo', el cuerpo de la pantalla cambiará
  //mensajeria: vemos la bandeja de correo
  //escritura: pantalla para escribir un correo
  //lectura: cuerpo de un correo abierto en detalle//
  String modoCorreo = "mensajeria";

  //cuando pulsemos en un correo, correoAbierto ganará ese valor, esto es para que en la siguiente pantalla tengamos más facilidad
  //para mostrar los datos de ese correo//
  late Correo correoAbierto;
  

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Mensajería'),
      leading: MenuWidget(),
    ),
    //implementamos un gesturedetector para que, si tenemos un teclado abierto y pulsamos fuera, se cierre
    body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },

      child: cuerpoMensajeria(),
    )

  );


  //cuerpo de la pantalla, contiene la bandeja de correos y el boton para escribir un correo//
  Widget cuerpoMensajeria(){
    return Container(

      color: Color.fromARGB(255, 233, 233, 233),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: Stack(
        children: [

          Column(
            children: [
              
              //texto 'Recibidos' que se muestra en la parte superior de la pantalla//
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text("RECIBIDOS", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                ),
              ),

              Divider(
                thickness: 2,
              ),


              //Toda la zona de la pantalla que contiene la bandeja de correos (es deslizable)//
              Expanded(
                child:  ListView.builder(
                itemCount: listaCorreos.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(

                    onTap: () {
                      setState(() {
                        correoAbierto = listaCorreos[index];
                        modoCorreo = "lectura";
                      });
                      
                    },

                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      //color: Colors.yellow,
                      height: (MediaQuery.of(context).size.height)*0.1,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 20),
                            alignment: Alignment.center,
                            height: (MediaQuery.of(context).size.height)*0.07,
                            width: (MediaQuery.of(context).size.height)*0.07,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle
                            ),
                            child: Text(listaCorreos[index].getEmisor.toString()[0], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                          ),
                          
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                            crossAxisAlignment: CrossAxisAlignment.start, //Center Column contents horizontally,
                            children: [
                              Text(listaCorreos[index].getEmisor.toString(), style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                              Text(listaCorreos[index].getAsunto.toString(), style: TextStyle(fontSize: 18),),
                            ],
                          )
                        ],
                      ),

                    ),
                  );
                }),
    
              )

              
            ],

          ),

          //Boton para escribir un correo
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                setState(() {
                  modoCorreo = "escritura";
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 48, 92, 174),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(bottom: 20, right: 20),
                height: (MediaQuery.of(context).size.height)*0.1,
                width: (MediaQuery.of(context).size.width)*0.4,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                  children: [
                    Icon(Icons.email_outlined, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Redactar", style: TextStyle(color: Colors.white, fontSize: 16),)
                  ],
                ),
              ),
            )
          ),

          //widget que abrirá una pantalla para leer un correo concreto o una página para escribir un correo en base 
          //al valor de la variable modoCorreo
          cuerpoCorreo()
        ],
      ),

    );
  }

  Widget cuerpoCorreo(){
    //si modoCorreo tiene el valor escritura, se abre una pantalla para redactar un correo
    if(modoCorreo=="escritura"){
      return SlideInUp(
        duration: Duration(milliseconds: 150),
        from: MediaQuery.of(context).size.height,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 233, 233, 233),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //Center Column contents horizontally,
            children: [

              InkWell(
                onTap: () {
                  setState(() {
                    modoCorreo = "mensajeria";
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(Icons.clear_outlined, color: Colors.black, size: 30,),
                ),
              ),

              Column(
                
                children: [
                  Row(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width)*0.2,
                        //margin: EdgeInsets.all(8),
                        child: Text("  Para", style: TextStyle(fontSize: 17),),
                      ),

                      Container(
                        width: (MediaQuery.of(context).size.width)*0.75,
                        child: TextField(

                        )
                      )
                    ],
                  ),

                  Divider(
                    thickness: 2,
                  ),

                  Row(
                    children:  [
                      Container(
                        width: (MediaQuery.of(context).size.width)*0.2,
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        child: Text("  De", style: TextStyle(fontSize: 17),),
                      ),
                      Text(globales.nombreUsuario, style: TextStyle(fontSize: 17),),
                    ],
                  ),

                  Divider(
                    thickness: 2,
                  ),
                  
                  Row(
                    children:  [
                      Container(
                        width: (MediaQuery.of(context).size.width)*0.2,
                        //margin: EdgeInsets.all(8),
                        child: Text("  Asunto", style: TextStyle(fontSize: 17),),
                      ),

                      Container(
                        width: (MediaQuery.of(context).size.width)*0.75,
                        child: TextField(

                        )
                      )
                    ],
                  ),

                  Divider(
                    thickness: 2,
                  ),
                ],
              ),


              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(top:20, left: 10),
                  child: Text("Escribe tu correo", style: TextStyle(fontSize: 15),),
                ),
              ),

             


              Align(
                alignment: Alignment.center,
                child: Container(
                  width: (MediaQuery.of(context).size.width)*0.95,
                  child: TextField(

                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      );
    }else if(modoCorreo=="lectura"){
      
      return SlideInLeft(
        duration: Duration(milliseconds: 200),
        from: MediaQuery.of(context).size.height,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 233, 233, 233),
          child: Stack(
            
            children: [

              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        modoCorreo = "mensajeria";
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(10),
                      child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 30,),
                    ),
                  ),

                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 15, bottom: 15),
                        child: Text(correoAbierto.getAsunto, style: TextStyle(fontSize: 30),),
                      ),

                      Row(

                        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,

                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 15),
                            alignment: Alignment.center,
                            height: (MediaQuery.of(context).size.height)*0.05,
                            width: (MediaQuery.of(context).size.height)*0.05,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle
                            ),
                            child: Text(correoAbierto.getEmisor.toString()[0], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                          ),

                          Text(correoAbierto.getEmisor, style: TextStyle(fontSize: 20),),

                        ],
                      ),

                      

                      Divider(
                        thickness: 2,
                      ),

                      //mensaje del correo (correo en si)
                      Container(
                        padding: EdgeInsets.all(10),
                        height: (MediaQuery.of(context).size.height)*0.6,
                        width: (MediaQuery.of(context).size.width)*0.95,
                        child: Text(correoAbierto.getMensaje, style: TextStyle(fontSize: 20),),
                      )
                    ],
                  ),
                ],
              ),


              //Boton para responder a un correo
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      modoCorreo = "escritura";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 48, 92, 174),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    height: (MediaQuery.of(context).size.height)*0.1,
                    width: (MediaQuery.of(context).size.width)*0.4,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: [
                        Icon(Icons.subdirectory_arrow_right_sharp, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text("Responder", style: TextStyle(color: Colors.white, fontSize: 16),)
                      ],
                    ),
                  ),
                )
              ),

            ],
          ),
        ),
      );
    
    }else{
      return Container(

      );
    }
  }

  List<Correo> listaCorreos = [

    Correo(emisor: "Suso", asunto: "Práctica Sockets",
    mensaje: "Buenos días, tu nota en la práctica de Sockets es de un 8, se han echado de menos capturas de la clase cliente en ejecución."),
    Correo(emisor: "Nelson", asunto: "Correción Clicker", mensaje: "Chicos recordad que debéis añadir lo explicado de apis y bases de datos a la última entrega del clicker antes del exámen final"),

  ];
  
}

//clase de prueba, pendiente a ver la estructura real de un correo recibido
class Correo{
  String emisor;
  String asunto;
  String mensaje;

  Correo({required this.emisor, required this.asunto, required this.mensaje});

  String get getEmisor {
    return emisor;
  }

  String get getAsunto {
    return asunto;
  }

  String get getMensaje {
    return mensaje;
  }

}