// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures

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

  //Metodo para determinar que apartado tiene que mostrar dentro de cada empresa
  String determinarApartado(int index) {
    if (index == 0) {
      return "Direccion social";
    }
    if (index == 1) {
      return "Direccion trabajo";
    }
    if (index == 2) {
      return "Cif";
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

  //Funcion para controlar la altura del container que muestra la lista de alumnos
  double retornarAlturaContainerAlumno(index) {
    if (index == 7) {
      return 600;
    } else
      return 200;
  }

  // Método para recuperar la lista de empresas //
  Future<void> recuperarEmpresas() async {
    Uri myUri = Uri.parse('${urlListaEmpresas}');

    final respuestaApi = await http.get(myUri);

    try {
      globales.listaEmpresas = Empresa.devolverListaEmpresas(respuestaApi.body);
      print(globales.listaEmpresas);
    } catch (excepcion) {
      print(excepcion);
    }
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
    if (tituloCarta == "Direccion trabajo") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaEmpresas[index].direccionTrabajo,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
    if (tituloCarta == "Direccion social") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaEmpresas[index].direccionSocial,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
    if (tituloCarta == "Cif") {
      return Container(
          width: 250,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
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
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
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
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
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
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
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
        itemCount: globales.listaEmpresas.length,
        itemBuilder: ((context, index) {
          //Obtengo en una variable el index que equivaldra a cada miembro de la lista, para poder controlar en cual estoy
          int numeroEmpresa = index;
          return Container(
              alignment: Alignment.center,
              height: 200,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 72, 122, 216),
                      spreadRadius: 12,
                      blurRadius: 7,
                      offset: Offset(3, 3),
                    ),
                  ],
                  color: Colors.grey[200],
                  border: Border(
                      top: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                      bottom: BorderSide(color: Colors.blueGrey, width: 4))),
              child: TextButton(
                  //Lo unico importante en esta linea es el valor que tiene el Text, este equivale al nombre que tiene el objeto empresa de la lista, al cual accedemos en funcion del index de la lista
                  child: Text(
                    globales.listaEmpresas[numeroEmpresa].nombre,
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 10.0,
                            color: Colors.black),
                      ],
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                            builder: (context, StateSetter setState) {
                          return Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: ListView.builder(
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  return Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(bottom: 20),
                                      //Este metodo lo utilizamos para determinar que cuando se trate de la carta que mostrara la informacion de los alumnos
                                      //que estan en la empresa esta se agrande, ya que el tamano que tienen las demas no sera suficiente
                                      height:
                                          retornarAlturaContainerAlumno(index),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black,
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(3,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200],
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(top: 10),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide.none,
                                                    left: BorderSide.none,
                                                    right: BorderSide.none,
                                                    bottom: BorderSide(
                                                        color: Colors.blueGrey,
                                                        width: 4)),
                                              ),
                                              //Con esta funcion estamos determinando en funcion del index de la segunda lista que titulo debe llevar cada celda en funcion de la posicion
                                              //esta asi pensado porque como el encabezado de la informacion siempre es el mismo de esta forma no nos complicamos y lo localizamos facilmente
                                              child: Text(
                                                  determinarApartado(index),
                                                  style: TextStyle(
                                                    fontSize: 35,
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    shadows: <Shadow>[
                                                      Shadow(
                                                          offset: Offset(2, 2),
                                                          blurRadius: 10.0,
                                                          color: Colors.black),
                                                    ],
                                                  ))),
                                          //Con este metodo gracias a la otra funcion y a la variable que indica el numero de empresa le pasamos todo esto para determinar que debe mostrar y sobre que empresa debe hacerlo
                                          retornarInfo(
                                              determinarApartado(index),
                                              numeroEmpresa)
                                        ],
                                      ));
                                },
                              ));
                        });
                      },
                    );
                  }));
        }));
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 92, 174),
        title: Text('Información Empresas'),
        leading: MenuWidget(),
      ),
      body: listaEmpresas(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Notififcaciones().contrasenaIncorrecta(context);
          //metodosCompartidos().recuperarEmpresasFiltradas(globales.idCurso, globales.idEstudio);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Form(
                key: formKey,
                child: Container(
                  height: heightA * 0.6,
                  width: widthA * 0.4,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: Colors.blue,
                          alignment: Alignment.center,
                          height: heightA*0.1,
                          width: widthA,
                          child: Text(
                            "Filtros",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      // Container que contiene el texto de titulo curso//
                      Container(
                        margin: EdgeInsets.only(top: heightA*0.01),
                        child: 
                          Text("Cursos", style: TextStyle(fontWeight:FontWeight.w500, fontSize: 20),),
                        ),

                      Container(
                        child:,
                      ),

                      // Container que contiene el texto de titulo estudio //
                      Container(
                        margin: EdgeInsets.only(top: heightA*0.01),
                        child: Text(
                          "Estudios",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                    ],
                  )
                ),
              ));
            },
          );
        },
        child: Icon(Icons.add_chart_outlined),
      ),
    );
  }
  
  
}
/*
// CLASE CREADA PARA EL DESPLIEGUE DE FILTROS // 
class busquedaConFiltro extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   IconButton(
    onPressed:() {
      close(context, null);
    },
    icon: Icon(Icons.arrow_back));
  }

  // Contiene el campo de texto donde se escribe
  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: (){
        // Campo de texto para el filtro //
        if(query.isEmpty){
          close(context, null);
        }else{
          query='';
        }
    },
      icon: Icon(Icons.clear));
  }

  // aqui se actualizan los resultados y se muestran //
  // el usuario probablemente no vea los resultados aqui //
  @override
  Widget buildResults(BuildContext context) {
    child:Text(
      query,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );

    // esta linea va a cambiar, desde donde llame a esta funcion va a variar //
    return buildResults(context);

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    // esta lista tiene que estar rellenada de los datos nombre de cursos //
    List<String> sugerencias=[
      '2022-2023',
      '2021-2022',
      '2020-2021',
    ];

    return ListView.builder(
      itemCount: sugerencias.length,
      itemBuilder: (context, index) {
        final sugerencia = sugerencias[index];
        return ListTile(
          title: Text(sugerencia),
          // en este on tap es donde se recoge el valor que se marca como filtro //
          onTap: (() {
            query=sugerencia;

            showResults(context);
          }
        ));
      },
    );
  }

  }
  */
