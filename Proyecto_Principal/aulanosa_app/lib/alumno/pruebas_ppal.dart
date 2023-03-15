import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PruebasPpalAlumno extends StatefulWidget {
  const PruebasPpalAlumno({super.key});

  @override
  State<PruebasPpalAlumno> createState() => _PruebasPpalAlumnoState();
}

class _PruebasPpalAlumnoState extends State<PruebasPpalAlumno> {

  //variables de tamaño de pantalla, alto y ancho//
  var size, heightA, widthA;
  List opciones = [
    Opcion(nombre: 'Notas', icono: Icon(Icons.checklist_rtl, size: 100)),
    Opcion(nombre: 'Empresa', icono: Icon(Icons.business_center_sharp, size: 100)),
    Opcion(nombre: 'Proyecto', icono: Icon(Icons.auto_awesome_motion_sharp, size: 100)),
    Opcion(nombre: 'Tutorias', icono: Icon(Icons.co_present_outlined, size: 100)),
    Opcion(nombre: 'Mensajes', icono: Icon(Icons.message, size: 100)),
    Opcion(nombre: 'Ajustes', icono: Icon(Icons.settings, size: 100))
  ];


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
        title: Text('Página principal'),
        backgroundColor: Color.fromARGB(255, 48, 92, 174),
        leading: MenuWidget(),
        //leading: MenuWidget()
      ),
      body: Container(
        height: heightA,
        width: widthA,
        child: Column(
          children: [
            
            Container(
              height: heightA * 0.25,
              width: widthA,
              color: Color.fromARGB(255, 72, 122, 216),
              child: Row(
                children: [

                  //REVISAR ALTO, ANCHO Y MARGEN PARA SUSTITUIRLO POR TAMAÑOS REFERENCIADOS AL MEDIAQUERY//

                  Container(
                    height: 120,
                    width: 120,
                    margin: EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(60)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Editar Foto',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                    )
                  ),

                  Container(
                    height: 200,
                    width: widthA*0.54,
                    margin: EdgeInsets.all(15),
                    // color: Colors.lightBlue[100],
                    child: Column(
                      
                      children: [

                        SizedBox(height: 35),

                        Text('PLACEHOLDER_NOMBRE',
                          style: TextStyle(
                            fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(height: 30),

                        Text('PLACEHOLDER_APELLIDOS',
                          style: TextStyle(
                            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(height: 30),

                        Row(
                          children: [

                            SizedBox(width: 20),

                            Text('CURSO'),

                            SizedBox(width: 20),

                            Text('ALGO MÁS')
                          ],
                        )
                      ],
                    ),
                  ),

                ],
 
              ),
            ),

            //Container que equivale a una zona en base a la altura de la pantalla que contiene una lista horizontal de opciones 
            Container(
              margin: EdgeInsets.only(top: 20),
              height: heightA*0.25,
              width: widthA,
              //color: Colors.grey[200],
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: opciones.length,
                itemBuilder: ((context, index) {
                  //este container es cada una de las opciones que podemos pulsar desde el perfil principal
                  return Container(
                    alignment: Alignment.center,
                    height: heightA*0.25,
                    width: heightA*0.25,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 5
                      )
                    ),
                    
                    //icono y texto dentro del cuadrado
                    child: Column(
                      children: [
                        SizedBox(height: 20),

                        Container(
                          height: 100,
                          width: 100,
                          child: opciones[index].icono,
                        ),

                        SizedBox(height: 20),

                        Text(opciones[index].nombre),

                      ],
                    ),
                  );
                })),
            )
          ],
        ),
      ),


    );
  }
}


class Opcion{
  String nombre;
  Icon icono;

  Opcion(
    {required this.nombre,
    required this.icono}
  );
}