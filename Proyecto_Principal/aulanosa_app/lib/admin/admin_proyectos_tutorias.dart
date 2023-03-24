// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, annotate_overrides, unused_import, unnecessary_import, non_constant_identifier_names, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, avoid_unnecessary_containers, sort_child_properties_last, unused_element, curly_braces_in_flow_control_structures, prefer_is_empty, unrelated_type_equality_checks
import 'package:aulanosa_app/globals/variable_global.dart';
import 'package:aulanosa_app/objetosNecesarios/mensaje.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:aulanosa_app/util/metodosCompartidos.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:aulanosa_app/globals/variable_global.dart' as globales;

String asunto = "";
String titulo = "";
int eventos = 0;
int cantidadDiasMes = 0;

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
  DateTime diaSeleccionado = DateTime.now();

  double topCalendario = 2;
  bool crearTutoria = false;
  List<Mensaje> listadoTotalMensajes = [];
  bool retornarCalendario = true;
  bool retornarTutoria = false;
  final _formKey = GlobalKey<FormState>();

  List<Mensaje> listaEventos = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Reogememos las medidas de alto y ancho del dispositivo para poder trabajar siempre con medidas RELATIVAS
    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });

    DropdownButtonFormField(items: <DropdownMenuItem>[], onChanged: (value) {});

    void retornarLista(List<Mensaje> listadoMensajes, DateTime dia) {
      List<Mensaje> listadoMensajesDia = [];
      for (int i = 0; i < listadoMensajes.length; i++) {
        if (diaSeleccionado.month == 1) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }
        if (diaSeleccionado.month == 2) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }
        if (diaSeleccionado.month == 3) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }

        if (diaSeleccionado.month == 4) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }
        if (diaSeleccionado.month == 5) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }
        if (diaSeleccionado.month == 6) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }
        if (diaSeleccionado.month == 7) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }
        if (diaSeleccionado.month == 8) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }
        if (diaSeleccionado.month == 9) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }
        if (diaSeleccionado.month == 10) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }

        if (diaSeleccionado.month == 11) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }
        if (diaSeleccionado.month == 12) {
          if (listadoMensajes[i].fecha ==
              DateTime.utc((dia.day).toInt(), diaSeleccionado.month,
                  (DateTime.now().year).toInt())) {
            listadoMensajesDia.add(listadoMensajes[i]);
          }
        }
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, StateSetter setState) {
                return Container(
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: listadoMensajesDia.length,
                      itemBuilder: (context, index) {
                        return Card(
                            margin: EdgeInsets.only(top: 20),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                height: 200,
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.blueGrey,
                                                      width: 3),
                                                  top: BorderSide.none,
                                                  left: BorderSide.none,
                                                  right: BorderSide.none)),
                                          child: Text(
                                            diaSeleccionado.day.toString() +
                                                "-" +
                                                diaSeleccionado.month
                                                    .toString() +
                                                "-" +
                                                diaSeleccionado.year.toString(),
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.blueGrey,
                                                    width: 3),
                                                top: BorderSide.none,
                                                left: BorderSide.none,
                                                right: BorderSide.none)),
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(top: 80),
                                        child: Text(
                                            listadoMensajesDia[index].asunto,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.blueGrey)))
                                  ],
                                )));
                      },
                    ));
              },
            );
          });
    }

    //Metodo que se llamara cuando seleccionemos cualquier dia
    dia_seleccionadoAdmin(DateTime dia, DateTime diaFocus) {
      setState(() {
        hoy = dia;
      });
      diaSeleccionado = dia;
      retornarLista(globales.listaMensajes, diaSeleccionado);
    }

    Widget retornarContenido() {
      if (retornarCalendario) {
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
                  firstDay: DateTime.utc(1, hoy.month, hoy.year),
                  lastDay: DateTime.utc(20100, 12, 31),
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

                  //Esto es lo mas importante y dificil de esta parte ASI QUE ATENTOS
                  /*Con calendarBuilders puedo acceder a metodos por defectos de la libreria y
                modificarlos
                */
                  calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, day, events) {
                    //Cantidad de "citas"
                    // AQUI va a haber que cambiarlo en funcion a lo que recuperemos de la API //
                    //Recorro todos los dias el mes en el que estoy
                    eventos = 0;
                    //ATENCION FUTUROS PROGRAMADORES QUE VAIS A VER ESTA PARTE DEL CODIGO
                    //Es el ultimo dia que tenemos para entregar esto, por lo que no tengais en cuenta los ifs anidados
                    //estamos cansados asi que cualquier cosa nos vale con tal de que funcione
                    //Pd: Animo con el calendario :)
                    for (int i = 0; i < listaEventos.length; i++) {
                      if (diaSeleccionado.month == 1) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 2) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 3) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 4) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 5) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 6) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 7) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 8) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 9) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 10) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 10) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 11) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                      if (diaSeleccionado.month == 12) {
                        if (DateTime.utc((day.day).toInt(),
                                diaSeleccionado.month, diaSeleccionado.year) ==
                            listaEventos[i].fecha) {
                          eventos = eventos + 1;
                        }
                      }
                    }

                    //Comprobamos si la cantidad de eventos es distinta de cero, para mostrar o no la cantidad
                    if (eventos == 0) {
                      return Container();
                    } else {
                      return Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.cyan),
                              child: Text(
                                eventos.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 48, 92, 174),
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )));
                    }
                  }

                      /*Modifico el metodo markerBuilder, este metodo es el que me permite agregarle
                  a cada celda del calendario contenido, en este caso le agrego un numero ya definido
                  este numero equivaldra en la version final al numero de examenes que tenga el alumno 
                  ese dia, si no tiene obviamente no aparecedera nada
                  */

                      ),
                  onDaySelected: dia_seleccionadoAdmin,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: FloatingActionButton(
                    onPressed: () {
                      print(hoy.month);
                      setState(() {
                        retornarCalendario = false;
                        retornarTutoria = true;
                      });
                    },
                    child: Icon(Icons.add),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 48, 92, 174),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(top: 10),
                  child: TextButton(
                      onPressed: () async{
                        await metodosCompartidos().recuperarMensajes();
                      },
                      child: Text("Refrescar calendario",
                          style: TextStyle(color: Colors.white))))
            ],
          ),
        );
      } else if (retornarTutoria) {
        return Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                margin: EdgeInsets.only(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                    border: Border.all(color: Colors.white, width: 4)),
                height: alturaPantalla * 0.6,
                width: 500,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            hintText: "Escriba el titulo de la tutoria"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        onSaved: (value) => {titulo = value!},
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          hintText: "Escriba el asunto",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Escriba el asunto';
                          }
                        },
                        onSaved: (value) => {asunto = value!},
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 200),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              )),
                          child: Text(
                              "Fecha tutoria: " +
                                  diaSeleccionado.year.toString() +
                                  "-" +
                                  diaSeleccionado.month.toString() +
                                  "-" +
                                  diaSeleccionado.day.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)))
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey, width: 4)),
                      child: TextButton(
                          onPressed: (() {
                            _formKey.currentState!.save();
                            print(asunto);
                            setState(() {
                              retornarTutoria = false;
                              retornarCalendario = true;
                              //Aqui se tendria que llamar al metodo para insertar datos
                            });
                          }),
                          child: Text("Crear tutoria"))))
            ])));
      }
      return Container();
    }

    Widget retornarBotonIteraccion() {
      if (retornarCalendario) {
        return FloatingActionButton(
          onPressed: () {
            setState(() {
              retornarCalendario = false;
              retornarTutoria = true;
            });
          },
          child: Icon(Icons.add),
        );
      } else if (retornarTutoria) {
        return Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 4)),
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
                Container(child: retornarContenido()),
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
