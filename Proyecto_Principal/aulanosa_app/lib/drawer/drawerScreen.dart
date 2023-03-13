import 'package:aulanosa_app/drawer/mainScreen.dart';
import 'package:aulanosa_app/drawer/menuScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatefulWidget{
  const DrawerScreen({Key? key}) : super(key:key);
  
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();

}

class _DrawerScreenState extends State<DrawerScreen>{
  final zoomDrawerController = ZoomDrawerController();
  
  @override
  Widget build(BuildContext context) {
    
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: Menu(),
      mainScreen: Main(),

    );
  }

}