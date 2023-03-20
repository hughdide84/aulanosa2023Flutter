// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, annotate_overrides, unused_import, unnecessary_import, non_constant_identifier_names, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, avoid_unnecessary_containers, sort_child_properties_last

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:table_calendar/table_calendar.dart';
//Pagina que mostrara el calendario el alumno
class Calendario_alumno extends StatefulWidget {
  Calendario_alumno2 createState() => Calendario_alumno2();
}

class Calendario_alumno2 extends State<Calendario_alumno> {
  
  var size, heightA, widthA;
  late double alturaPantalla;
  late double anchoPantalla;
  DateTime hoy = DateTime.now();
  String note_text = "Examenes";

  //Los valores de esta lista no se tienen que tener en cuenta
  List<String> lista_opciones = ["A", "B",  "C", "D"];

  void dia_seleccionado(DateTime dia, DateTime diaFocus){
    setState(() {
      hoy = dia;
    }); 
  }                                                                                                      

@override
  Widget build(BuildContext context) {
    
    //Reogememos las medidas de alto y ancho del dispositivo para poder trabajar siempre con medidas RELATIVAS
    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });
   //Constructor del DropDownButtonFormField
    DropdownButtonFormField(
      items:<DropdownMenuItem>[],
      onChanged:(value){}
      );

   //Estructura del calendario
    Widget calendario() {
      return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
             Container(
              height: alturaPantalla * 0.63 ,
              decoration: 
              BoxDecoration(
                 //Configuracion de las sombras del contenedor del calendario
                 boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              color: Color.fromARGB(255, 72, 122, 216),
              border: Border.all(
                color: Color.fromARGB(255, 48, 92, 174), width: 3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
              //Widget con la estructura y los estilos del calendario
              child: TableCalendar(
                //Definimos el idioma
                locale: "es_Es",
                /*(Definimos el dia en el que se va a focusear de primeras que es una variable
                DateTime que nos devolvera el dia en el que estemos
                */
                focusedDay: hoy,
                //Los valores fe firstDay y lastDay son de prueba,
                firstDay: DateTime.utc(2010, 01, 1),
                lastDay: DateTime.utc(2040, 12, 31),
                //Definimos el estilo de los dias de la semana y fin de semana, colores, sombras, fuentes, etc
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 1.0,
                            color: Color.fromARGB(255, 48, 92, 174),
                          ),
                        ],
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    weekdayStyle: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 1.0,
                            color: Color.fromARGB(255, 48, 92, 174),
                          ),
                        ],
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                //Definimos los estilos de la cabecera del calendario
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 4.0,
                          color: Color.fromARGB(255, 72, 122, 216),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 48, 92, 174),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    rightChevronIcon:
                        Icon(Icons.chevron_right, color: Colors.white)),
                //Definimos los estilos del cuerpo del calendario
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(color: Colors.transparent),
                  selectedDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 48, 92, 174),
                      border: Border.all(
                          color: Color.fromARGB(255, 48, 92, 174), width: 3)),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  tablePadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  weekendTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 1.0,
                          color: Color.fromARGB(255, 48, 92, 174),
                        ),
                      ]),
                  defaultTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 1.0,
                          color: Color.fromARGB(255, 48, 92, 174),
                        ),
                      ]),
                ),
                
                selectedDayPredicate: (dia) => isSameDay(dia, hoy),
                /*Esta funcion nos servira para que cuando nosotros pulsemos un dia determinado 
                llame a esta funcion, la cual cambia el estado del dia seleccionado para que se le apliquen
                los estilos (los estilos es basicamente que su background cambie)
                */
                onDaySelected: dia_seleccionado,
                //Esto es lo mas importante y dificil de esta parte ASI QUE ATENTOS
                /*Con calendarBuilders puedo acceder a metodos por defectos de la libreria y
                modificarlos
                */
                calendarBuilders: CalendarBuilders(
                  /*Modifico el metodo markerBuilder, este metodo es el que me permite agregarle
                  a cada celda del calendario contenido, en este caso le agrego un numero ya definido
                  este numero equivaldra en la version final al numero de examenes que tenga el alumno 
                  ese dia, si no tiene obviamente no aparecedera nada
                  */
                  markerBuilder: (context, day, events) {
                    //Cantidad de "citas"
                    // AQUI va a haber que cambiarlo en funcion a lo que recuperemos de la API //
                    var citas = "5";
                    return Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.cyan),
                            child: Text(
                              citas,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 92, 174),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )));
                  },
                ),
                ),
            ),
              /*Este container sera el que contendra el titulo de "Examenes", que es como la cabecera del 
              del DropdownButtonFormField
              */
              Container(
                  margin: EdgeInsets.only(top: alturaPantalla * 0.02),
                  width: anchoPantalla * 0.8,
                  decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(15.0),
                  ),
                   padding: EdgeInsets.only(top: 8),
                height: 40,
                  child: Text("Examenes", textAlign: TextAlign.center,  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 4.0,
                          color: Color.fromARGB(255, 72, 122, 216),
                        ),
                      ], ))),
              //Este container contendra el DropdownButtonFormField, se explica mas adelante que es esto
              Container(
                decoration: BoxDecoration(
                 boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                 ],
                 color: Color.fromARGB(255, 48, 92, 174),
                 borderRadius: BorderRadius.circular(9.0)),
                margin: EdgeInsets.only(top: alturaPantalla * 0.01),
                child: Stack(children: [
                //Este widget es un desplegable, 
                DropdownButtonFormField(
                  iconEnabledColor: Colors.white,
                  elevation: 20,
                  isExpanded: true,
                  alignment: Alignment.center,
                  decoration:InputDecoration(
                  ),
                 //Cuando esta focus se pueden hacer cositas ESTO ES UNA NOTA PARA RECORDAR IMPLEMENTAR UNA FUNCION PARECIDA
                 //QA NO LE HAGAIS CASO A ESTO, ESTAS NOTAS SON SOLO PARA MI Q SOY MUY DESPISTADO
                 dropdownColor: Color.fromARGB(255, 48, 92, 174),
                 //Esta es la parte mas importeante
                 /*El metodo map es un metodo parecido al forEach, podemos recorrer todos los elementos
                 de un array 
                 Entondes por cada iteracion retornamos una celda con el valor e, que es el texto 
                 que se ve reflejado*/
                 items:lista_opciones.map((e){
                 return DropdownMenuItem(
                  alignment: Alignment.center,
                  /*En este onTap no esta definido nada, pero se utilizara en un futuro para que el alumno
                  pueda interactuar con la propia lista
                  */
                  onTap: () => {},  
                  //Aqui defino la estructura de cada celda de la lista desplegable  
                  child: Container(
                    height: 40,
                    width: anchoPantalla * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(9.0)),
                    /*En este child  se mostraran los examenes con sus respectivas fechas
                    por ahora se muestra un valor por defecto, pero en ese campo tendra que ir 
                    la fecha de cada examen con su dicha informacion
                    */
                    child: Text(e,  style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 48, 92, 174)), textAlign: TextAlign.center,  )),
                    //El valor del Item sera e, que es el item de la lista : lista_opciones
                    value: e
                    );
                }).toList(),onChanged: (String? value) {},
                )
                ]
                )
                ),
          ]));
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 92, 174),
        title: Text('Calendario alumno'),
        leading: MenuWidget(),
      ),
      body: SafeArea(
          top: true,
          child: Stack(
            
            children: [
               Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  "assets/images/logoDark.png",
                  width: 717 * 0.3,
                  height: 445 * 0.3,
                ),
              ),
              Column(
                children: [
                  
                  Container(
                      margin: EdgeInsets.only(top: alturaPantalla * 0.01),
                      child: calendario())
                ],
              ),
              //Imagen de fondo
             
            ],
          )),
    );
    }
}