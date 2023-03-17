// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, unused_import, annotate_overrides

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//Pagina que contiene las notas del alumno
class Notas_alumno extends StatefulWidget {
  Notas_alumno2 createState() => Notas_alumno2();
}

//asignaturas deben recibirse de BBDD, ya que dependen del curso, no son siempre las mismas//
List<String> prueba = [
  "Acceso a datos",
  "Programación móvil",
  "Sistema de gestión empresarial"
];

class Notas_alumno2 extends State<Notas_alumno> {

  var size, heightA, widthA;

  //String que gana valor al entrar a una asignatura, es el título que sale arriba al entrar a una
  //asignatura en detalle
  late String nombreAsignatura;

  //color de letra y de fondo del botón de 'Notas Examenes'
  Color fondoExamenes = Color.fromARGB(255, 48, 92, 174);
  Color letraExamenes = Colors.white;

  //color de letra y de fondo del botón de 'Notas Prácticas'
  Color fondoPracticas = Colors.transparent;
  Color letraPracticas = Color.fromARGB(255, 48, 92, 174);

  //INT que indica si estamos viendo las notas de los examenes o de las prácticas
  //0.- Examenes
  //1.- Prácticas
  int tipoNotas = 0;

  //Este booleano indica si hemos clickadoe en una de las asignaturas para verla en más detalle.
  //Si está positivo, todo el cuerpo de la pantalla cambiará para mostrar info de esa asignatura en concreto//
  bool enDetalle = false;
  

  @override
  Widget build(BuildContext context) => Scaffold(
    
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Notas'),
      leading: MenuWidget(),
    ),

    body: cuerpoNotas()
  );


  //FUNCION QUE DEVUELVE UN CONTAINER
  //ESTE CONTAINER DEVUELVE O EL CUERPO DE LA PANTALLA DE NOTAS E SI (ENSEÑA TODAS LAS ASIGNATURAS)
  //O UN CUERPO CON LOS DETALLES DE UNA ASIGNATURA EN CONCRETO SI LE DAMOS CLICK
  Container cuerpoNotas(){

    if(enDetalle){
      return cuerpoAsignatura();
    }else{
      return Container(
        color: Color.fromARGB(255, 233, 233, 233),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [

            //CONTAINER que contiene una lista de todas las asignaturas (DEBE RECIBIRLAS DE LA BASE DE DATOS)
            Container(
              margin: EdgeInsets.only(top: 20),
              height: (MediaQuery.of(context).size.height)*0.8,
              width: (MediaQuery.of(context).size.width)*0.95,
              child: ListView.builder(
                itemCount: prueba.length,
                itemBuilder: (BuildContext context, int index){

                  //Cada InkWell es una asignatura, que al pulsar nos lleva a esa asignatura//
                  return InkWell(

                    onTap: (){
                      setState(() {
                        nombreAsignatura = prueba[index].toString();
                        enDetalle = true;
                      });
                    },

                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 6.0,
                            offset: Offset(0.0, 0.75)
                          )
                        ],
                        color: Colors.white
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 20),
                      height: (MediaQuery.of(context).size.height)*0.1,
                      child: Row(
                        children: [
                          
                          Icon(Icons.class_, color: Color.fromARGB(255, 48, 92, 174), size: 30,),
                          SizedBox(width: 10,),
                          Text(prueba[index].toString(), style: TextStyle(color: Color.fromARGB(255, 48, 92, 174), fontSize: 20))
                        ],
                      ),
                    ),
                  );
                }
              ),
            )


          ],
        ),
      );
    }

  }


  //FUNCION QUE DEVUELVE UN CONTAINER
  //ESE CONTAINER ES UN CUERPO NUEVO PARA EL DRAWER DE NOTAS QUE CONTIENE LA INFORMACIÓN MÁS
  //EN DETALLE DE LA ASIGNATURA SELECCIONADA
  Container cuerpoAsignatura(){
    return Container(
      color: Color.fromARGB(255, 233, 233, 233),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [

          //STACK QUE CONTIENE UNA ZONA CON FONDO AZUL CON EL NOMBRE Y LA FLECHA (EXPLICADOS ABAJO)
          Stack(
            children: [

              
              //NOMBRE DE LA ASIGNATURA QUE APARECE ARRIBA DE LA PÁGINA
              Container(
                alignment: Alignment.center,
                color: Color.fromARGB(255, 72, 122, 216),
                height: (MediaQuery.of(context).size.height)*0.1,
                width: MediaQuery.of(context).size.width,
                child: Text(nombreAsignatura, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
              ),


              //BOTÓN (FLECHA) PARA VOLVER HACIA ATRAS COLOCADO A LA IZQ. DEL NOMBRE DE LA ASIGNATURA
              InkWell(

                onTap: (){
                  setState(() {
                    enDetalle = false;
                  });
                },

                child: Container(
                  margin: EdgeInsets.only(left: 10,top: ((MediaQuery.of(context).size.height)*0.1-30)/2),
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  child: Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.white,),
                ),
              ),
            ],
          ),

          //TABLA CON NOTAS POR EV Y FINALES
          //DEBERÁ RECIBIR LA NOTA DE LA BBDD Y HACERLE UN TO STRING
          Container(

            color: Colors.white,
            margin:  EdgeInsets.only(top: 35, bottom: 35),
            height: (MediaQuery.of(context).size.height)*0.3,
            width: (MediaQuery.of(context).size.width)*0.95,
            
            //COLUMN: TABLA AL COMPLETO
            child: Column(
              children: [
                //ROW: FILA NOTAS POR EVALUACION
                Row(
                  children: [
                    //CONTAINER: CUADRO NOTA PRIMERA EV (TEXTO + NOTA)
                    Container(
                      height: ((MediaQuery.of(context).size.height)*0.3)/2,
                      width: ((MediaQuery.of(context).size.width)*0.95)/3,
                      decoration: BoxDecoration(
                             
                        border: Border(
                          top: BorderSide(width: 2, color: Colors.black),
                          left: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 48, 92, 174),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 15),
                            height: (((MediaQuery.of(context).size.height)*0.3)/2)/2.8,
                            width: ((MediaQuery.of(context).size.width)*0.95)/3,
                            child: Container(
                              child: Text("Nota 1ª EV", style: TextStyle(fontSize: 20, color: Colors.white),),
                            ),
                          ),

                          Text("8", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),

                    //CONTAINER: CUADRO NOTA SEGUNDA EV (TEXTO + NOTA)
                    Container(
                      decoration: BoxDecoration(
                             
                        border: Border(
                          top: BorderSide(width: 2, color: Colors.black),
                          left: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      height: ((MediaQuery.of(context).size.height)*0.3)/2,
                      width: ((MediaQuery.of(context).size.width)*0.95)/3,
                      child: Column(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 48, 92, 174),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 15),
                            height: (((MediaQuery.of(context).size.height)*0.3)/2)/2.8,
                            width: ((MediaQuery.of(context).size.width)*0.95)/3,
                            child: Container(
                              child: Text("Nota 2ª EV", style: TextStyle(fontSize: 20, color: Colors.white),),
                            ),
                          ),

                          Text("8", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),

                    //CONTAINER: CUADRO NOTA TERCERA EV (TEXTO + NOTA)
                    Container(
                      decoration: BoxDecoration(
                             
                        border: Border(
                          top: BorderSide(width: 2, color: Colors.black),
                          left: BorderSide(width: 2, color: Colors.black),
                          right: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      height: ((MediaQuery.of(context).size.height)*0.3)/2,
                      width: ((MediaQuery.of(context).size.width)*0.95)/3,
                      child: Column(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 48, 92, 174),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 15),
                            height: (((MediaQuery.of(context).size.height)*0.3)/2)/2.8,
                            width: ((MediaQuery.of(context).size.width)*0.95)/3,
                            
                            child: Container(
                              child: Text("Nota 3ª EV", style: TextStyle(fontSize: 20, color: Colors.white),),
                            ),
                          ),

                          Text("8", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),

                //CONTAINER: MITAD INFERIOR DE LA TABLA: NOTA FINAL
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2, 
                    ),
                  ),
                  alignment: Alignment.center,
                  height: ((MediaQuery.of(context).size.height)*0.3)/2,
                  width: (MediaQuery.of(context).size.width)*0.95,
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 48, 92, 174),
                        alignment: Alignment.center,
                        height: ((MediaQuery.of(context).size.height)*0.3)/5,
                        width: (MediaQuery.of(context).size.width)*0.95,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text("Nota final", style: TextStyle(fontSize: 30, color: Colors.white)),
                      ),

                      Text("8", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),

  
                
              ],
            ),
          ),

          //FILA CON LOS BOTONES PARA ELEGIR SI QUIERES VER LAS NOTAS DE LOS EXAMENES O DE LAS PRÁCTICAS
          Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              InkWell(
                onTap: () {
                  tipoNotas = 0;
                  cambioTipoNotas();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: fondoExamenes,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width)*0.4,
                  height: (MediaQuery.of(context).size.width)*0.1,
                  
                  child: Text("Notas exámenes", style: TextStyle(color: letraExamenes, fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),

              SizedBox(
                width: 22,
              ),
              
              InkWell(
                onTap: () {
                  tipoNotas = 1;
                  cambioTipoNotas();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: fondoPracticas,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width)*0.4,
                  height: (MediaQuery.of(context).size.width)*0.1,
                  
                  child: Text("Notas prácticas", style: TextStyle(color: letraPracticas, fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.all(10),
            height: (MediaQuery.of(context).size.height)*0.2,
            width: (MediaQuery.of(context).size.width)*0.9,
            margin: EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 6.0,
                  offset: Offset(0.0, 0.75)
                )
              ],
              color: Colors.white
            ),
            //NO DEBE DEVOLVER UN TEXTO, DEBE DEVOVLER UNA LISTA DE EXAMENES
            //PENDIENTE DE COMO NOS DIGAN QUE EL PROFESORADO LO QUIERE MANEJAR//
            child: SingleChildScrollView(
              child: Container(
                height: (MediaQuery.of(context).size.height)*0.2,
                width: (MediaQuery.of(context).size.width)*0.9,
                child: cambioListView(),
              ),
            ),
          )

        
        ],
      ),
    );
  }


  //dos array string de prueba, esta info debrá recibirse de la BBDD
  List<String> pruebaExamenes = [
    "[Exámen tema 2]: 6",
    "[Exámen Recuperación tema 3]: 8"
  ];
  List<String> pruebaPracticas = [
    "[Primera entrega clicker]: 8",
    "[Práctica Sockets]: 4"
  ];


  //funcion que devuelve un listview.builder para ver las notas de las practicas o de los examenes
  //devolverá una lista u otra en base a que boton hayamos pulsado (examenes o practicas)
  Widget cambioListView(){

    if(tipoNotas==0){
      return ListView.builder(
        itemCount: pruebaExamenes.length,
        itemBuilder: (BuildContext context, int index){

          //Cada InkWell es una asignatura, que al pulsar nos lleva a esa asignatura//
          return Text(pruebaExamenes[index], style: TextStyle(fontSize: 20));
        }
      );
    }else{
      return ListView.builder(
        itemCount: pruebaPracticas.length,
        itemBuilder: (BuildContext context, int index){

          //Cada InkWell es una asignatura, que al pulsar nos lleva a esa asignatura//
          return Text(pruebaPracticas[index], style: TextStyle(fontSize: 20));
        }
      );
    }
    
  }


  //funcion que cambia el color de letra y de fondo de los botones (practica y examenes) cuando pulsamos uno u otro
  void cambioTipoNotas(){

    if(tipoNotas==0){

      setState(() {
        fondoExamenes = Color.fromARGB(255, 48, 92, 174);
        letraExamenes = Colors.white;

        fondoPracticas = Colors.transparent;
        letraPracticas = Color.fromARGB(255, 48, 92, 174);
      });

    }else{

      setState(() {
        fondoPracticas = Color.fromARGB(255, 48, 92, 174);
        letraPracticas = Colors.white;

        fondoExamenes = Colors.transparent;
        letraExamenes = Color.fromARGB(255, 48, 92, 174);
      });
    }

  }


}