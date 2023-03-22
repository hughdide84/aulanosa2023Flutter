// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, annotate_overrides, unused_import, unnecessary_import, non_constant_identifier_names, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, avoid_unnecessary_containers, sort_child_properties_last, unused_element, curly_braces_in_flow_control_structures
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TutoriasAdmin extends StatefulWidget {
  const TutoriasAdmin({super.key});

  @override
  State<TutoriasAdmin> createState() => TutoriasAdminState();
}

class TutoriasAdminState extends State<TutoriasAdmin> {
  var size, heightA, widthA;
  late double alturaPantalla;
  late double anchoPantalla;
  DateTime hoy = DateTime.now();
  late DateTime diaSeleccionado;
 
  

  void dia_seleccionadoAdmin(DateTime dia, DateTime diaFocus) {
    setState(() {
      hoy = dia;
    });
    diaSeleccionado = dia;
  }

  double topCalendario = 2;
  bool crearTutoria = false;
 
  bool retornarCalendario = true;
  bool retornarTutoria = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Reogememos las medidas de alto y ancho del dispositivo para poder trabajar siempre con medidas RELATIVAS
    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });
    
    
    DropdownButtonFormField(items: <DropdownMenuItem>[], onChanged: (value) {});
    

    //Estructura del calendario
    Widget calendario() {
      return AnimatedContainer(
        padding: const EdgeInsets.all(20.0),
        duration: Duration( seconds: 5),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: topCalendario),
              height: alturaPantalla * 0.63,
              decoration: BoxDecoration(
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
                onDaySelected: dia_seleccionadoAdmin,
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
          ],
        ),
      );
    }

    

    Widget retornarContenido() {
      if(retornarCalendario) {
        return Container(
        padding: const EdgeInsets.all(20.0),
        
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: topCalendario),
              height: alturaPantalla * 0.63,
              decoration: BoxDecoration(
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
                onDaySelected: dia_seleccionadoAdmin,
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
            FloatingActionButton(
        onPressed: () {
          setState(() {
            retornarCalendario = false;
            retornarTutoria = true;
          });
        },
        child: Icon(Icons.add),
      )
          ],
        ),
      );
      }else if(retornarTutoria) {
         return Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
        child: Column(children: [
          Container(
          margin: EdgeInsets.only(),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.blueGrey, width: 4)
          ),
        height: alturaPantalla * 0.6,
        width: 500,
        child: Form(
          key: _formKey,
          child: Column(
            
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Escriba el titulo de la tutoria"

                 ),
                 validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
            },
                
              ),
            
        ],
      ),
    ),
    


         ), Padding(
          padding: EdgeInsets.all(20),
          child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey, width: 4)),
          child: TextButton(
            onPressed: (() {
              setState(() {
                retornarTutoria = false;
                retornarCalendario = true;
              });
             
            }),
            child: Text("Crear tutoria"))))])));

      }
      return Container();
    }

    Widget retornarBotonIteraccion() {
      if(retornarCalendario){
        return FloatingActionButton(
        onPressed: () {
          setState(() {
            retornarCalendario = false;
            retornarTutoria = true;
          });
        },
        child: Icon(Icons.add),
      );
      }else if(retornarTutoria) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey, width: 4)),
          child: TextButton(
            onPressed: (() {
              setState(() {
                retornarTutoria = false;
                retornarCalendario = true;
              });
             
            }),
            child: Text("Crear tutoria"))));
      }
      return Container();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 92, 174),
        leading: MenuWidget(),
        title: Text('Tutorias'),
        //  leading: MenuWidget(),
      ),
      body: Stack(
        children: [
         Container(
              child: Column(
                children: [
                  Container(
                    
                    child: retornarContenido()
                  ),
                  
                ],
              ),
            ),
         
            
             

          //Imagen de fondo
        ],
      ),
    );
  }
}

class ListaTutorias {
  ListaTutorias(this.infoTutoria);

  final String infoTutoria;

  static List<ListaTutorias> getListTutorias() {
    return <ListaTutorias>[
      ListaTutorias('Descripcion'),
      ListaTutorias('Descripcion2'),
    ];
  }
}
