import 'package:flutter/material.dart';

//Una instancia de MenuItemm es una de las opciones que vemos al 
//acceder al drawer
class MenuItemm{
  //titulo de la opcion
  final String titulo;
  //icono de la opcion
  final IconData icono;

  const MenuItemm(this.titulo, this.icono);
}