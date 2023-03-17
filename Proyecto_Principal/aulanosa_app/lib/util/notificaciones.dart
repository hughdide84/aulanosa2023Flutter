import 'package:flutter/material.dart';

// Clase que contiene las notificaciones que mostramos al usuario // 
// por diferentes eventos; como errores en inicio de sesion, edicion de datos correcta o incorrecta etc //

class Notififcaciones{

//Listas de snackBars:

  // SnakBar para mostrar un error en el inicio de sesion de la clase login //
  void errorInicioSesion(BuildContext context) {
    final snb = SnackBar(
      backgroundColor: Color.fromARGB(0, 247, 3, 3),
    content:
        Row(
          children: const [
            Icon(Icons.block_flipped),
            SizedBox(
              width: 20,
            ),
            Text("Usuario o Contraseña Incorrectos")
          ],
    )  ,
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

 // SnakBar para mostrar el inicio de sesion correcto de la clase login //
   void acertadoInicioSesion (BuildContext context){
    final snb = SnackBar(
      content:
      Container(
        color: Color.fromARGB(255, 39, 230, 22),
        child:Row(
          children: const [
            Icon(Icons.add_task, color: Colors.white),
            SizedBox(
              width: 20,
            ),
            Text("Inicio de sesión correcto")
          ],
      ) ,) ,
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);


  }



}