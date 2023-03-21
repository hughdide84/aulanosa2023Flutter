import 'package:flutter/material.dart';

// Clase que contiene las notificaciones que mostramos al usuario // 
// por diferentes eventos; como errores en inicio de sesion, edicion de datos correcta o incorrecta etc //

class Notififcaciones{

//Listas de snackBars:

  // SnakBar para mostrar un error en el inicio de sesion de la clase login //
  void errorInicioSesion(BuildContext context) {
    final snb = SnackBar(
      backgroundColor: Color.fromARGB(255, 230, 6, 6),
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
   void contrasenaIncorrecta (BuildContext context){
    final snb = SnackBar(
      backgroundColor: Color.fromARGB(255, 230, 6, 6),
    content:
        Row(
          children: const [
            Icon(Icons.block_flipped),
            SizedBox(
              width: 20,
            ),
            Text("Contraseña Incorrecta")
          ],
    )  ,
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);


  }



}