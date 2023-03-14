import 'package:aulanosa_app/drawer/mainScreen.dart';
import 'package:aulanosa_app/drawer/menuScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatefulWidget{
  const DrawerScreen({Key? key}) : super(key:key);
  
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();

}

class _DrawerScreenState extends State<DrawerScreen>{
  final drawerController = ZoomDrawerController();
  
  @override
  Widget build(BuildContext context) {
    
    return ZoomDrawer(
      controller: drawerController,
      //style: DrawerStyle.style3,
      menuScreen: Menu(),
      mainScreen: Main(),
      borderRadius: 30.0,
      showShadow: true,
      angle: 0.0,
      menuBackgroundColor: Color.fromARGB(255, 74, 29, 251),
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      slideWidth: MediaQuery.of(context).size.width * 0.75

    );
  }

}

