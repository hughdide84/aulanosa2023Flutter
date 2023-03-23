// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures, non_constant_identifier_names

import 'package:aulanosa_app/alumno/menu_principal_alumno.dart';
import 'package:aulanosa_app/objetosNecesarios/empresa.dart';
import 'package:aulanosa_app/util/metodosCompartidos.dart';
import 'package:aulanosa_app/util/notificaciones.dart';
import 'package:http/http.dart' as http;
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:aulanosa_app/pantallas/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:aulanosa_app/globals/variable_global.dart' as globales;
import 'package:aulanosa_app/util/notificaciones.dart';

//Pagina para editar/mostrar Empresas y su informacion //
class AdminEmpresa extends StatefulWidget {
  const AdminEmpresa({super.key});

  @override
  State<AdminEmpresa> createState() => _AdminEmpresaState();
}

String urlListaEmpresas = "http://10.0.2.2:8080/api/empresa";

class _AdminEmpresaState extends State<AdminEmpresa> {
  final formKey = GlobalKey<FormState>();

  //Lista donde se almacenaran los objetos de la empresa que cada uno de ellos representaran
  //List<Empresa> globales.listaEmpresas = [];
  var size, heightA, widthA;
  double alturaContainerInfoEmpresa = 0;
  bool containerAlumno = false;
  String infoContainerEmpresa = "";
  // Variable para mostrar el filtro seleccionado 'curso' por el usuario dentro del boton "filtros" //
  String filtroCurso = "";

  // Variable para mostrar el filtro seleccionado 'estudio' por el usuario dentro del boton "filtros" //
  String filtroEstudio = "";

  //Metodo para determinar que apartado tiene que mostrar dentro de cada empresa
  String determinarApartado(int index) {
    if (index == 0) {
      return "Dirección social";
    }
    if (index == 1) {
      return "Dirección trabajo";
    }
    if (index == 2) {
      return "CIF";
    }
    if (index == 3) {
      return "Representante";
    }
    if (index == 4) {
      return "Contacto";
    }
    if (index == 5) {
      return "Tutores";
    }
    if (index == 6) {
      return "Convenio";
    }
    if (index == 7) {
      return "Alumnos";
    }
    if (index == 8) {
      return "Hoja actividades";
    }
    return "sdf";
  }

  //Funcion para controlar la altura del container que muestra la lista de empresas //
  double retornarAlturaContainerEmpresa(index) {
    if (index == 7) {
      return 600;
    } else
      return 200;
  }

  //Utilizo el InitState porque quise cargar asi los objetos en la lista
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //Metodo para retornar la informacion de cada uno de los apartados de la empresa, es decir, direccion de trabajo, direccion social, etc
  Container retornarInfo(String tituloCarta, int index) {
    //Dependiendo de cual sea el titulo de la carta este metodo retornara una informacion u otra
    if (tituloCarta == "Dirección trabajo") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 72, 122, 216),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color.fromARGB(255, 72, 122, 216), width: 3)),
          child: Text(globales.listaEmpresas[index].direccionTrabajo,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
    if (tituloCarta == "Dirección social") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 72, 122, 216),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color.fromARGB(255, 72, 122, 216), width: 3)),
          child: Text(globales.listaEmpresas[index].direccionSocial,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
    if (tituloCarta == "CIF") {
      return Container(
          width: 250,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 72, 122, 216),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color.fromARGB(255, 72, 122, 216), width: 3)),
          child: Text(globales.listaEmpresas[index].cif,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
    if (tituloCarta == "Representante") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 72, 122, 216),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color.fromARGB(255, 72, 122, 216), width: 3)),
          child: Text(globales.listaEmpresas[index].representante,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
    if (tituloCarta == "Contacto") {
      return Container(
          width: 250,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 72, 122, 216),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color.fromARGB(255, 72, 122, 216), width: 3)),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(globales.listaEmpresas[index].contacto,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Icon(Icons.phone, color: Colors.white)
            ],
          ));
    }
    if (tituloCarta == "Tutores") {
      return Container(
          width: 340,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 72, 122, 216),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text("Tutor 1: " + globales.listaEmpresas[index].tutor1,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Tutor 2: " + globales.listaEmpresas[index].tutor2,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Tutor 3: " + globales.listaEmpresas[index].tutor3,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
            ],
          ));
    }
    if (tituloCarta == "Convenio") {
      //FALTA PORQUE NO SE COMO DE GRANDE ES LA INFORMACION QUE TIENE UN CONVENIO ASI QUE xD
      return Container(child: Text(globales.listaEmpresas[index].convenio));
    }
    if (tituloCarta == "Alumnos") {
      /*
        Falta por rellenar porque no se como van a ser las relaciones para este campo
       */
      return Container(child: Text(globales.listaEmpresas[index].convenio));
    }
    return Container();
  }

//Metodo para crear la estructura de toda la pagina, esta funcion creara tanto la lista principal de empresas como
//la lista que contiene la informacion de cada empresa
  ListView listaEmpresas() {
    return ListView.builder(
      // OJO CON ESTO, ANTES ERA itemCount = 8, era constante no variable //
      itemCount: globales.listaEmpresas.length,
      itemBuilder: ((context, index) {
        //Obtengo en una variable el index que equivaldra a cada miembro de la lista, para poder controlar en cual estoy
        int numeroEmpresa = index;
        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (context, StateSetter setState) {
                  return Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Stack(
                        children: [
                          ListView.builder(
                            itemCount: globales.listaEmpresas.length,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(bottom: 20),
                                //Este metodo lo utilizamos para determinar que cuando se trate de la carta que mostrara la informacion de los alumnos
                                //que estan en la empresa esta se agrande, ya que el tamano que tienen las demas no sera suficiente
                                height: retornarAlturaContainerEmpresa(index),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    // BoxShadow(
                                    //   color: Colors.black,
                                    //   spreadRadius: 2,
                                    //   blurRadius: 7,
                                    //   offset: Offset(
                                    //       3, 3), // changes position of shadow
                                    // ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                            // border: Border(
                                            //   top: BorderSide.none,
                                            //   left: BorderSide.none,
                                            //   right: BorderSide.none,
                                            //   bottom: BorderSide(
                                            //       color: Color.fromARGB(
                                            //           255, 72, 122, 216),
                                            //       width: 4),
                                            // ),
                                            ),
                                        //Con esta funcion estamos determinando en funcion del index de la segunda lista que titulo debe llevar cada celda en funcion de la posicion
                                        //esta asi pensado porque como el encabezado de la informacion siempre es el mismo de esta forma no nos complicamos y lo localizamos facilmente
                                        child: Text(determinarApartado(index),
                                            style: TextStyle(
                                              fontSize: 35,
                                              color: Color.fromARGB(
                                                  255, 72, 122, 216),
                                              fontWeight: FontWeight.bold,
                                              // shadows: <Shadow>[
                                              //   Shadow(
                                              //       offset: Offset(2, 2),
                                              //       blurRadius: 10.0,
                                              //       color: Colors.black),
                                              // ],
                                            ))),
                                    //Con este metodo gracias a la otra funcion y a la variable que indica el numero de empresa le pasamos todo esto para determinar que debe mostrar y sobre que empresa debe hacerlo
                                    retornarInfo(determinarApartado(index),
                                        numeroEmpresa)
                                  ],
                                ),
                              );
                            },
                          ),

                          //boton que se encuentra en la parte superior izquierda del showdialog para cerrarlo
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              child: FloatingActionButton(
                                backgroundColor:
                                    const Color.fromARGB(255, 48, 92, 174),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
                });
              },
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
            alignment: Alignment.center,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // boxShadow: [
              //   BoxShadow(
              //     color: Color.fromARGB(255, 72, 122, 216),
              //     spreadRadius: 12,
              //     blurRadius: 7,
              //     offset: Offset(3, 3),
              //   ),
              // ],
              color: Color.fromARGB(255, 72, 122, 216),
              border: Border(
                top: BorderSide.none,
                left: BorderSide.none,
                right: BorderSide.none,
                // bottom: BorderSide(color: Color.fromARGB(255, 72, 122, 216), width: 4),
              ),
            ),
            child: Text(
              globales.listaEmpresas[numeroEmpresa].nombre,
              style: TextStyle(
                fontSize: 27,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
                  Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 10.0,
                      color: Colors.black),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 92, 174),
        title: Text('Información Empresas'),
        leading: MenuWidget(),
      ),
      body: listaEmpresas(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //metodosCompartidos().recuperarEmpresasFiltradas(globales.idCurso, globales.idEstudio);
          showDialog(
            context: context,
            builder: (Buiildcontext) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    height: heightA,
                    width: widthA,
                    //color: Colors.pink,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          alignment: Alignment.center,
                          height: heightA * 0.1,
                          width: widthA,
                          color: Color.fromARGB(255, 48, 92, 174),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                "Filtros",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: widthA * 0.05),
                              child: Text(
                                "Curso: " + filtroCurso,
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              " | ",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Estudio: " + filtroEstudio,
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                        // Container que contiene el texto de titulo curso//
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            "Cursos",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                decoration: TextDecoration.none),
                          ),
                        ),

                        SizedBox(
                          width: widthA * 0.8,
                          height: heightA * 0.2,
                          child: ListView.builder(
                            itemCount: globales.listaCursos.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(5),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 4,
                                      color: Color.fromARGB(255, 48, 92, 174)),
                                ),
                                child: TextButton(
                                  // Aqui actualizo la variable para el filtro //
                                  onPressed: () {
                                    globales.idCurso =
                                        globales.listaCursos[index].id;
                                    print(globales.idCurso);
                                  },
                                  child:
                                      Text(globales.listaCursos[index].nombre),
                                ),
                              );
                            },
                          ),
                        ),

                        // Container que contiene el texto de titulo estudio //
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            "Estudios",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                decoration: TextDecoration.none),
                          ),
                        ),

                        SizedBox(
                          width: widthA * 0.8,
                          height: heightA * 0.2,
                          child: ListView.builder(
                            itemCount: globales.listaEstudios.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(5),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 4,
                                      color: Color.fromARGB(255, 48, 92, 174)),
                                ),
                                child: TextButton(
                                  // Aqui actualizo la variable para el filtro //
                                  onPressed: () {
                                    globales.idEstudio =
                                        globales.listaEstudios[index].id;
                                    print(globales.idEstudio);
                                  },
                                  child: Text(
                                      globales.listaEstudios[index].nombre),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: Icon(Icons.add_chart_outlined),
      ),
    );
  }
}
