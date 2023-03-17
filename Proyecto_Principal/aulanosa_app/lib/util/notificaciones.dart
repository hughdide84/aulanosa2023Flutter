import 'package:flutter/material.dart';

// Clase que contiene las notificaciones que mostramos al usuario // 
// Por diferentes eventos //

class Notififcaciones{

//Listas de snackBars:

  //SnakBar para mostrar el maxima de mejora alcanzado
  void mostrarMaximaMejora(BuildContext context) {
    final snb = SnackBar(
      content:
      Container(
        color: Color.fromARGB(a, r, g, b),
        child:Row(
          children: const [
            Icon(Icons.thumb_up),
            SizedBox(
              width: 20,
            ),
            Text("Maxima mejora alcnazada")
          ],
      ) ,) ,
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }




}