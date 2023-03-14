import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  Login2 createState() => Login2();
}

class Login2 extends State<Login>{
  var size, heightA, widthA;
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {

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
              
              decoration: BoxDecoration(
                color: Colors.blue[300],
                // borderRadius: BorderRadius.vertical(
                //   bottom: Radius.circular(120)
                // )
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

                  const SizedBox(height: 50,),

                  //columna con el texto 'usuario' y su respectivo cuadro de texto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //texto 'usuario'
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: const Text("Usuario", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                      ),

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
                        
                        child: TextFormField(

                         ),

                      ),
                    ],
                  ),

                  const SizedBox(height: 50,),

                  //columna con el texto 'contraseña' y su respectivo cuadro de texto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //texto 'contraseña'
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: const Text("Contraseña", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                      ),

                      //cuadro de texto para la contraseña
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
                        
                        child: TextFormField(

                         ),

                      ),
                    ],
                  ),

                  SizedBox(height: 50,),

                  //boton de iniciar sesión
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      decoration:  BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        )
                      ),
                      alignment: Alignment.center,
                      height: 60,
                      width: 200,
                      
                      child: const Text("Iniciar sesión", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
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
}