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