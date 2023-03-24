import 'package:aulanosa_app/objetosNecesarios/alumno.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aulanosa_app/globals/variable_global.dart' as globales;
import 'package:http/http.dart' as http;

String cursoNombre = "";
String estudiosNombre = "";
String empresaNombre = "";

//Pagina para editar/mostrar AdminAlumnos
class AdminAlumnos extends StatefulWidget {
  const AdminAlumnos({super.key});

  @override
  State<AdminAlumnos> createState() => _AdminAlumnosState();
}

List<Alumno> listadoAlumnos = [];
String urlListaAlumnos = 'http://10.0.2.2:8080/api/alumno';

//Metodo para determinar que apartado tiene que mostrar dentro de cada alumno externo
String determinarApartado(int index) {
  if (index == 0) {
    return "Nombre";
  } else if (index == 1) {
    return "Curso";
  } else if (index == 2) {
    return "Estudios";
  } else if (index == 3) {
    return "Empresa";
  }
  return '';
}

class _AdminAlumnosState extends State<AdminAlumnos> {
// Método para recuperar la lista de alumnos externos //
  Future<void> recuperarAlumnos() async {
    Uri myUri = Uri.parse('${urlListaAlumnos}');

    final respuestaApi = await http.get(myUri);

    try {
      globales.listaAlumnos = Alumno.devolverListaAlumnos(respuestaApi.body);
      print(globales.listaAlumnos);
    } catch (excepcion) {
      print(excepcion);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listadoAlumnos = globales.listaAlumnos;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 48, 92, 174),
          title: const Text('Alumnos'),
          leading: MenuWidget(),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 105, 146, 221),
        body: listaAlumnos(),
      );

  //Funcion para controlar la altura del container que muestra la lista de alumnos
  double retornarAlturaContainerAlumno(index) {
    if (index == 1) {
      return 200;
    } else if (index == 2) {
      return 200;
    } else {
      return 200;
    }
  }

//Metodo para retornar la informacion de cada uno de los apartados del alumno externo, es decir, nombre, telefono, universidad, etc
  Column retornarInfo(String tituloCarta, int index) {
    //Dependiendo de cual sea el titulo de la carta este metodo retornara una informacion u otra
    if (tituloCarta == "Nombre") {
      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 105, 146, 221),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: const Color.fromARGB(255, 105, 146, 221), width: 3),
            ),
            child: Text(
              globales.listaAlumnos[index].nombre,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    } else if (tituloCarta == "Curso") {
      return Column(children: [
        //  Text('nombre'),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 105, 146, 221),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 105, 146, 221), width: 3)),
            child: FittedBox(
              child: Text(mostrarCurso(listadoAlumnos[index]),
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )),
      ]);
    } else if (tituloCarta == "Estudios") {
      return Column(children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 105, 146, 221),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 105, 146, 221), width: 3)),
            child: Text(mostrarEstudios(listadoAlumnos[index]),
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)))
      ]);
    } else if (tituloCarta == "Empresa") {
      return Column(children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 105, 146, 221),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 105, 146, 221), width: 3)),
            child: Text(
              mostrarEmpresa(listadoAlumnos[index]),
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ))
      ]);
    }

    return Column();
  }

  //Metodo para crear la estructura de toda la pagina, esta funcion creara tanto la lista principal de alumnos como
//la lista que contiene la informacion de cada alumno
  ListView listaAlumnos() {
    return ListView.builder(
      itemCount: globales.listaAlumnos.length,
      itemBuilder: ((context, index) {
        //Obtengo en una variable el index que equivaldra a cada miembro de la lista, para poder controlar en cual estoy
        int numeroAlumnoExterno = index;
        return Padding(
          padding:
              const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 8),

          //Mediante un GestureDetector, se podra acceder a la informacion de cada alumno abriendo un showDialog
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                border: const Border(
                  top: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  child: Text(
                    globales.listaAlumnos[index].nombre,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 72, 122, 216),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              //Al pulsar sobre un alumno se abrira un showDialog con toda la informacion de este
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (context, StateSetter setState) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Stack(children: [
                          ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 20),
                                height: retornarAlturaContainerAlumno(index),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        determinarApartado(index),
                                        style: const TextStyle(
                                          fontSize: 35,
                                          color: Color.fromARGB(
                                              255, 105, 146, 221),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    //Con este metodo gracias a la otra funcion y a la variable que indica el numero de empresa le pasamos todo esto para determinar que debe mostrar y sobre que empresa debe hacerlo
                                    retornarInfo(determinarApartado(index),
                                        numeroAlumnoExterno)
                                  ],
                                ),
                              );
                            },
                          ),
                          Align(
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: FloatingActionButton(
                                    backgroundColor:
                                        const Color.fromARGB(255, 72, 122, 216),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      size: 30,
                                    ),
                                  ),
                                )),
                          )
                        ]),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      }),
    );
  }
}
//Clase para poder realizar la busqueda de alumnos
class DataSearch extends SearchDelegate {
  String nombre = '';
  int empresa = 0;
  int curso = 0;
  int estudios = 0;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              query = '';
            }),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Container(
        alignment: Alignment.topCenter,
        height: double.infinity,
        color: Color.fromARGB(255, 72, 122, 216),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),

                    //Aqui se muestra el nombre del alumno externo
                    child: const Text(
                      ('Nombre'),
                      style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 105, 146, 221),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(top: 40),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 105, 146, 221),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 105, 146, 221),
                          width: 3),
                    ),
                    child: Text(
                      nombre,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              margin: const EdgeInsets.only(
                top: 20,
              ),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),

                    //Aqui se muestra el nombre del alumno externo
                    child: const Text(
                      ('Curso'),
                      style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 105, 146, 221),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(top: 40),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 105, 146, 221),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 105, 146, 221),
                          width: 3),
                    ),
                    child: FittedBox(
                      child: Text(
                        cursoNombre,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              margin: const EdgeInsets.only(
                top: 20,
              ),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),

                    //Aqui se muestra el nombre del alumno externo
                    child: const Text(
                      ('Estudios'),
                      style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 105, 146, 221),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(top: 40),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 105, 146, 221),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 105, 146, 221),
                          width: 3),
                    ),
                    child: Text(
                      estudiosNombre,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              margin: const EdgeInsets.only(
                top: 20,
              ),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),

                    //Aqui se muestra el nombre del alumno externo
                    child: const Text(
                      ('Empresa'),
                      style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 105, 146, 221),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(top: 40),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 105, 146, 221),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 105, 146, 221),
                          width: 3),
                    ),
                    child: Text(
                      empresaNombre,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? listadoAlumnos
        : listadoAlumnos
            .where(
                (p) => p.nombre.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
//Se crea un listview para mostrar las sugerencias, que incluyen el nombre, especialidad y universidad
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          nombre = suggestionList[index].nombre;
          empresaNombre = mostrarEmpresa(listadoAlumnos[index]);
          cursoNombre = mostrarCurso(listadoAlumnos[index]);
          estudiosNombre = mostrarEstudios(listadoAlumnos[index]);

          showResults(context);
        },
        leading: const Icon(Icons.person),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].nombre.substring(0),
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /* void mostrarCursoEstudiosAlumno(Alumno alumno) {
    for (var curso in globales.listaCursos) {
      if (curso.id == alumno.idCurso) {
        cursoNombre = curso.nombre;
      }
    }
    /*
    for(var estudios in globales.listaEstudios){
        if(estudios.id==alumno.idEstudios){
            estudiosNombre= estudios.nombre;
         }
    }
    */
    for (var empresa in globales.listaEmpresas) {
      if (empresa.id == alumno.idEmpresa) {
        empresaNombre = empresa.nombre;
      }
    }
  }
*/
}

String mostrarCurso(Alumno alumno) {
  for (var curso in globales.listaCursos) {
    if (curso.id == alumno.idCurso) {
      cursoNombre = curso.nombre;
    }
  }
  return cursoNombre;
}

String mostrarEmpresa(Alumno alumno) {
  for (var empresa in globales.listaEmpresas) {
    if (empresa.id == alumno.idEmpresa) {
      empresaNombre = empresa.nombre;
    }
  }
  return empresaNombre;
}

String mostrarEstudios(Alumno alumno) {
  for (var estudio in globales.listaEstudios) {
    if (estudio.id == alumno.idEstudios) {
      estudiosNombre = estudio.nombre;
    }
  }
  return estudiosNombre;
}
