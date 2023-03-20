// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, unused_import, annotate_overrides

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

//Pagina que mostrara la informacion referida a la empresa del alumno
class Empresa_alumno extends StatefulWidget {
  Empresa_alumno2 createState() => Empresa_alumno2();
}

class Empresa_alumno2 extends State<Empresa_alumno> {
  var size, heightA, widthA;

  @override
  Widget build(BuildContext context) {

    //AL ENTRAR A LA CLASE, GUARDA EL TAMAÑO DE LA PANTALLA, ANCHO Y ALTO//
    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Salidas FCT'),
      leading: MenuWidget(),
      ),

      body: Container(
        height: heightA,
        width: widthA,
        child: Column(
          children: [
            Container(
              width: widthA,
              height: heightA * 0.1,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 72, 122, 216),
              ),
              child: Column(
                children: [

                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: Text('Entrega CV y carta de presentación',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Text('No entregado',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                  ),

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5, left: 10, top: 5),
                      child: Text('Fecha Límite (9 Nov)',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
    
  
  
}