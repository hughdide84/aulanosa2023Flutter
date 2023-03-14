// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

//Botón que nos abre el Drawer común en todas las clases
class MenuWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context)=>IconButton(
    onPressed: ()=>ZoomDrawer.of(context)!.toggle(),
    icon: Icon(Icons.menu)
  );

}