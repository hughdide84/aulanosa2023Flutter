import 'package:aulanosa_app/alumno/menu_principal_alumno.dart';
import 'package:aulanosa_app/pantallas/cambioContrasena.dart';
import 'package:aulanosa_app/pantallas/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


// Variable para controlar la vision de la contraseña //
bool verContrasena = true;


class Login extends StatefulWidget{
  Login2 createState() => Login2();
}


class Login2 extends State<Login>{
  //variables de tamaño de pantalla, alto y ancho//
  var size, heightA, widthA;
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    
    //AL ENTRAR A LA CLASE, GUARDA EL TAMAÑO DE LA PANTALLA, ANCHO Y ALTO//
    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });

    return Scaffold(
      //propiedad del scaffold para evitar que al abrir el teclado todo se mueva de sitio
      resizeToAvoidBottomInset: false,

      //cuerpo principal de toda la pantalla del login
      body: Container(
        height: heightA,
        width: widthA,
        child: Column(
          children: [

            //parte superior de la pantalla con fondo azul que contiene el logo de AulaNosa
            Container(
              width: widthA,
              height: heightA*0.4,
              
              decoration: const BoxDecoration(
                color:Color.fromARGB(255, 72, 122, 216),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                        
                  //logo aulanosa
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/logo.png", width: 1123*0.25, height: 794*0.25,),
                  ),

                  const SizedBox(height: 20,),

                  //texto bienvenida
                  const Text("Bienvenidos a Aula Nosa", style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),

            //formulario donde ponemos nuestro usuario y contraseña
            Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 50),

                  //columna con el texto 'usuario' y su respectivo cuadro de texto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      //texto 'usuario'
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: const Text("Usuario", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
                      ),
              
                      Stack(
                        children: [
                          //cuadro de texto para el usuario
                          Container(
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
                          Container(
                            width: widthA*0.6,
                            margin: EdgeInsets.only(left: widthA*0.04),
                            alignment: Alignment.center,
                            child:TextFormField(
                               style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                              decoration: const InputDecoration(
                                border: InputBorder.none
                              ),
                            ),   
                          ),   
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 25,),

                  //columna con el texto 'contraseña' y su respectivo cuadro de texto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      //texto 'contraseña'
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: const Text("Contraseña", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
                      ),

                      Stack(
                        children: [
                          //cuadro de texto para la contraseña //
                          Container(
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
                            margin: EdgeInsets.only(left: widthA*0.59),
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
                    ],
                  ),

                  // Espaciador entre containers //
                  const SizedBox(height: 50,),

                  //boton de iniciar sesión
                  InkWell(
                    onTap: () {
                     // el login actualmente siempre va a llevar a las paginas de los alumnos, en un futuro
                     //dependerá del rol que tenga el usuario que recibamos de la api (pendiente de api)//
                     
                      Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()),);
                    },
                    child: Container(
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
                      child: const Text("Iniciar sesión", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),

                  // Espaciador entre containers //
                  const SizedBox(height: 20),

                  //boton de cambio de contraseña //
                  InkWell(
                    onTap: () {
                    // Este boton llama a otra pantalla para cambiar la contraseña del usuario //
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>cambioContrasena(),));
                    },
                    child: Container(
                      decoration:  const BoxDecoration(
                        color: Color.fromARGB(255, 72, 122, 216),
                        borderRadius:  BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        )
                      ),
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      child: const Text("Cambiar Contraseña", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              )
            ),
          ],

        )
      ), 
    );
  }
  // Función que varia la visibilidad de la contraseña //
  void visionContrasena(){
    setState(() {
      verContrasena=!verContrasena;
    });
    
  }
}

