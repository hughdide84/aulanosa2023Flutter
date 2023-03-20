// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, unused_import, annotate_overrides

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


//Pagina principal del alumno
class cambioContrasena extends StatefulWidget {
  cambioContrasena2 createState() => cambioContrasena2();
}

class cambioContrasena2 extends State<cambioContrasena> {
  var size, heightA, widthA;
  final formKey = GlobalKey<FormState>();
  // Variable para controlar la vision de la contraseña //
  bool verContrasena = true;

  @override
  Widget build(BuildContext context) {
      //AL ENTRAR A LA CLASE, GUARDA EL TAMAÑO DE LA PANTALLA, ANCHO Y ALTO//
    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          
        backgroundColor: Colors.blue,
        title: Text('Cambia tu contraseña'),
      ),
          body: Container(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child:Column(
                    //mainAxisAlignment: MainAxisAlignment. center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: heightA*0.05),
                      //texto descriptivo de lo que tiene que introducir el usuario, "contraseña actual"
                      Container(
                        margin: EdgeInsets.only(left: widthA*0.06,top: heightA*0.06),
                        child: const Text("Introducir nombre de usuario", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
                  ),
                  Stack(
                        children: [
                          //cuadro de texto para la contraseña actual //
                          Container(
                            margin: EdgeInsets.only(left: widthA*0.15),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 206, 206, 206),
                              borderRadius:  BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20)
                              )
                            ),
                            height: heightA*0.05,
                            width: widthA*0.7,
                          ),

                          // Campo donde rellena el usuario los datos, en este caso la contraseña actual //
                          Container(
                            width: widthA*0.6,
                            margin: EdgeInsets.only(left: widthA*0.04),
                            alignment: Alignment.center,
                            child:TextFormField(
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                              decoration: const InputDecoration(
                                border: InputBorder.none
                              ),
                              obscureText: verContrasena,
                            ),  
                          ),

                          // Container del icono del ojo para cambiar la visibilidad de la contraseña actual //
                          Container(
                            margin: EdgeInsets.only(left: widthA*0.73),
                            child: IconButton(
                              iconSize: 25,
                              icon: const Icon(Icons.visibility),
                              // En este onPressed llamo a la función que cambia la visibilidad de la contraseña //
                              onPressed: () {
                                visionContrasena();
                              },
                            )   
                          ) 
                        ],
                      ),
                    
                      // Segunda estructura para que el usuario confirme su contraseña nueva //
                  Container(
                    margin: EdgeInsets.only(left: widthA*0.06,top: heightA*0.03),
                    child: const Text("Introducir nueva contraseña", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
                  ),
                  Stack(
                        children: [
                          //cuadro de texto para la contraseña //
                          Container(
                            margin: EdgeInsets.only(left: widthA*0.15),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 206, 206, 206),
                              borderRadius:  BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20)
                              )
                            ),
                            height: heightA*0.05,
                            width: widthA*0.7,
                          ),

                          // Campo donde rellena el usuario los datos, en este caso la contraseña //
                          Container(
                            width: widthA*0.6,
                            margin: EdgeInsets.only(left: widthA*0.04),
                            alignment: Alignment.center,
                            child:TextFormField(
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                              decoration: const InputDecoration(
                                border: InputBorder.none
                              ),
                              obscureText: verContrasena,
                            ),  
                          ),

                          // Container del icono del ojo para cambiar la visibilidad de la contraseña //
                          Container(
                            margin: EdgeInsets.only(left: widthA*0.73),
                            child: IconButton(
                              iconSize: 25,
                              icon: const Icon(Icons.visibility),
                              // En este onPressed llamo a la función que cambia la visibilidad de la contraseña //
                              onPressed: () {
                                visionContrasena();
                              },
                            )   
                          ) 
                        ],
                      ),


                      Container(
                    margin: EdgeInsets.only(left: widthA*0.06,top: heightA*0.03),
                    child: const Text("Confirmar nueva contraseña", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
                ),

                  Stack(
                        children: [
                          //cuadro de texto para la contraseña //
                          Container(
                            margin: EdgeInsets.only(left: widthA*0.15),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 206, 206, 206),
                              borderRadius:  BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20)
                              )
                            ),
                            height: heightA*0.05,
                            width: widthA*0.7,
                          ),

                          // Campo donde rellena el usuario los datos, en este caso la contraseña //
                          Container(
                            width: widthA*0.6,
                            margin: EdgeInsets.only(left: widthA*0.04),
                            alignment: Alignment.center,
                            child:TextFormField(
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                              decoration: const InputDecoration(
                                border: InputBorder.none
                              ),
                              obscureText: verContrasena,
                            ),  
                          ),

                          // Container del icono del ojo para cambiar la visibilidad de la contraseña //
                          Container(
                            margin: EdgeInsets.only(left: widthA*0.73),
                            child: IconButton(
                              iconSize: 25,
                              icon: const Icon(Icons.visibility),
                              // En este onPressed llamo a la función que cambia la visibilidad de la contraseña //
                              onPressed: () {
                                visionContrasena();
                              },
                            )   
                          ) 
                        ],
                      ),
                      // Espaciador entre containers //
                  const SizedBox(height: 50,),

                  //boton de iniciar sesión
                  InkWell(
                    onTap: () {
                     // BOTÓN QUE ACTIVARÁ LA FUNCION DE COMPROBAR CONTRASEÑA //
                    
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: widthA*0.25),
                      decoration:  const BoxDecoration(
                        color: Color.fromARGB(255, 72, 122, 216),
                        borderRadius:  BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        )
                      ),
                      alignment: Alignment.center,
                      height: 60,
                      width: 200,
                      child: const Text("Cambiar Contraseña", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
              ],
            ),
          ),
              ],
            ),
          )
          
            
    );
  } 
    
  // Función que varia la visibilidad de la contraseña //
  void visionContrasena(){
    setState(() {
      verContrasena=!verContrasena;
    });
    
  }
    
  
}