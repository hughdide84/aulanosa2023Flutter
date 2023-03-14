import 'package:flutter/material.dart';

//Una instancia de MenuItemm es una de las opciones que vemos al 
//acceder al drawer
class MenuItemm{
  //titulo de la opcion
  final String title;
  //icono de la opcion
  final IconData icon;

  const MenuItemm(this.title, this.icon);
}