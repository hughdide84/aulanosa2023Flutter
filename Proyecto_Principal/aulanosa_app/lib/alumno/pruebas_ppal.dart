import 'package:aulanosa_app/alumno/screem_calendario_alumno.dart';
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

  //LISTAS DE ELEMENTOS SCROLLEABLES//
  //Lista horizontal
  List opciones = [
    Opcion(nombre: 'Notas', icono: Icon(Icons.checklist_rtl, size: 50)),
    Opcion(nombre: 'Empresa', icono: Icon(Icons.business_center_sharp, size: 50)),
    Opcion(nombre: 'Proyecto', icono: Icon(Icons.auto_awesome_motion_sharp, size: 50)),
    Opcion(nombre: 'Tutorias', icono: Icon(Icons.co_present_outlined, size: 50)),
    Opcion(nombre: 'Mensajes', icono: Icon(Icons.message, size: 50)),
    Opcion(nombre: 'Ajustes', icono: Icon(Icons.settings, size: 50))
  ];

  //Lista vertical
  //TODO recoger datos del calendario SOLO DE LOS PROXIMOS 5 EVENTOS
  List cartas = [
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba'),
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba'),
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba'),
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba'),
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba')
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
      
      //appBar que contiene el titulo de la pagina y el boton para abrir el drawer
      appBar: AppBar(
        title: Text('Página principal'),
        backgroundColor: Color.fromARGB(255, 48, 92, 174),
        leading: MenuWidget(),
      ),

      //Container general
      body: Container(
        height: heightA,
        width: widthA,
        child: Column(
          children: [
            
            //Container superior azul, foto y datos del alumno
            Container(
              height: heightA * 0.25,
              width: widthA,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 72, 122, 216),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
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

                    //TODO
                    //Foto en un futuro editable
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

                  //TODO cambiarlos por valores retornados de la api
                  //Datos del usuario
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

                        SizedBox(height: 20),

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
              margin: EdgeInsets.all(8),
              height: heightA*0.2,
              width: widthA,
              color: Colors.grey[200],
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                //control de tamaño y espaciado de los elementos del scroll horizontal
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 225,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
                itemCount: opciones.length,
                itemBuilder: ((_, index) {
                  //este container es cada una de las opciones que podemos pulsar desde el perfil principal
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2
                      )
                    ),
                    
                    //icono y texto dentro del cuadrado
                    child: Column(
                      children: [
                        SizedBox(height: 20),

                        Container(
                          height: 80,
                          width: 80,
                          child: opciones[index].icono,
                        ),

                        SizedBox(height: 10),

                        Text(opciones[index].nombre),

                      ],
                    ),
                  );
                })),
            ),

            //Division opciones scroll horizontal / Eventos scroll vertical
            Divider(thickness: 5,),

            Container(
              margin: EdgeInsets.all(5),
              child: Text('PRÓXIMOS EVENTOS',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
            ),

            //Lista con cada una de las cartas de evento construidas con un builder
            Container(
              width: widthA,
              height: heightA*0.25,
              child: ListView.builder(
                    itemCount: cartas.length,
                    itemBuilder:((context,index){
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.black, width: 2)
                        ),
                        child: Row(
                          children: [

                            //Dia y mes
                            Container(
                              width: widthA*0.2,
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                              height: heightA*0.1,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(cartas[index].dia + '\n' + cartas[index].mes,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),)
                                ),
                            ),
                              )
                            ),
                            
                            //Descripcion
                            Container(
                              height: heightA*0.1,
                              width: widthA*0.6,
                              margin: EdgeInsets.all(5),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(cartas[index].descripcion,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.blue),)
                                ),
                            ),

                            //Icono tipo calendario
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Icon(Icons.calendar_month,
                                size: 40,),
                            )
                            
                          ],
                        ),
                      );
                    }
                    
                    )
                    
                  ),
                ),

                //TODO cambiarlo por algo mas visualmente atractivo
                //Boton para ver la pagina del calendario
                Container(
                  height: heightA*0.05,
                  margin: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: OutlinedButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Calendario_alumno()));
                      },
                      child: Text('Ver calendario completo')),
                  )
                )
              ]
            ),

          
        ),
      );


    
  }
}

//CLASES QUE DEFINEN LOS ELEMENTOS DE AMBAS LISTAS//

//Lista vertical
class Carta{
  String dia;
  String mes;
  String descripcion;

  Carta(
    {required this.dia,
    required this.mes,
    required this.descripcion}
  );
}

//Lista horizontal
class Opcion{
  String nombre;
  Icon icono;

  Opcion(
    {required this.nombre,
    required this.icono}
  );
}