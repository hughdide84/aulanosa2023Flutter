import 'package:aulanosa_app/objetosNecesarios/alumnos_externos.dart';
import 'package:aulanosa_app/objetosNecesarios/empresa.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:aulanosa_app/globals/variable_global.dart' as globales;
import 'package:http/http.dart' as http;

// Página editar/mostrar alumnos externos
class AlumnosExternos extends StatefulWidget {
  const AlumnosExternos({super.key});

  @override
  State<AlumnosExternos> createState() => _AlumnosExternosState();
}
//Lista donde se almacenaran los objetos de la empresa que cada uno de ellos representaran
List<AlumnoExterno> listadoAlumnos = [];
String urlListaAlumnosExternos = 'http://10.0.2.2:8080/api/alumnoExterno/';

class _AlumnosExternosState extends State<AlumnosExternos> {
  

  var size, heightA, widthA;
  double alturaContainerInfoEmpresa = 0;
  bool containerAlumno = false;
  String infoContainerEmpresa = "";

  //Metodo para determinar que apartado tiene que mostrar dentro de cada alumno externo
  String determinarApartado(int index) {
    if (index == 0) {
      return "nombre";
    } else if (index == 1) {
      return "tipo";
    } else if (index == 2) {
      return "telefono";
    } else if (index == 3) {
      return "email";
    } else if (index == 4) {
      return "universidad";
    } else if (index == 5) {
      return "titulacion";
    } else if (index == 6) {
      return "especialidad";
    } else if (index == 7) {
      return "evaluacion";
    } else if (index == 8) {
      return "horario";
    } else if (index == 9) {
      return "inicio";
    } else if (index == 10) {
      return "fin";
    }
    return '';
  }

// Método para recuperar la lista de alumnos externos //
  Future<void> recuperarAlumnosExternos() async {
    Uri myUri = Uri.parse('${urlListaAlumnosExternos}');

    final respuestaApi = await http.get(myUri);

    try {
      globales.listaAlumnosExternos =
          AlumnoExterno.devolverListaAlumnosExternos(respuestaApi.body);
      print(globales.listaAlumnosExternos);
    } catch (excepcion) {
      print(excepcion);
    }
  }

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listadoAlumnos = globales.listaAlumnosExternos;
  }

  //Metodo para retornar la informacion de cada uno de los apartados del alumno externo, es decir, nombre, telefono, universidad, etc
  Container retornarInfo(String tituloCarta, int index) {
    //Dependiendo de cual sea el titulo de la carta este metodo retornara una informacion u otra
    if (tituloCarta == "nombre") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(1),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].nombre,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "tipo") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].tipo,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "telefono") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].telefono,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "email") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].email,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "universidad") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].universidad,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "titulacion") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].titulacion,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "especialidad") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].especialidad,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "evaluacion") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].evaluacion,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "horario") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: const Text('horario',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "inicio") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].inicio.split('T')[0],
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "fin") {
      return Container(
          width: 320,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].fin.split('T')[0],
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }

    return Container();
  }

//Metodo para crear la estructura de toda la pagina, esta funcion creara tanto la lista principal de alumnos externos como
//la lista que contiene la informacion de cada alumno externo
  ListView listaAlumnosExternos() {
    return ListView.builder(
      itemCount: 11,
      itemBuilder: ((context, index) {
        //Obtengo en una variable el index que equivaldra a cada miembro de la lista, para poder controlar en cual estoy
        int numeroAlumnoExterno = index;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          //Mediante un GestureDetector, se podra acceder a la informacion de cada alumno externo abriendo un showDialog
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueGrey,
                    spreadRadius: 12,
                    blurRadius: 7,
                    offset: Offset(3, 3),
                  ),
                ],
                color: Colors.grey[200],
                border: const Border(
                  top: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none,
                  bottom: BorderSide(color: Colors.blueGrey, width: 4),
                ),
              ),
              child: Text(
                globales.listaAlumnosExternos[index].nombre,
                style: const TextStyle(
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
            ),
            onTap: () {
               showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, StateSetter setState) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: ListView.builder(
                            itemCount: 11,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 20),
                                height: 200,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      decoration: const BoxDecoration(
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
                                        style: const TextStyle(
                                          fontSize: 35,
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
                                    ),
                                    //Con este metodo gracias a la otra funcion y a la variable que indica el numero de empresa le pasamos todo esto para determinar que debe mostrar y sobre que empresa debe hacerlo
                                    retornarInfo(determinarApartado(index),
                                        numeroAlumnoExterno)
                                  ],
                                ),
                              );
                            },
                          ),
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
//Construimos la pagina
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 92, 174),
        title: const Text('Alumnos Externos'),
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
      body: listaAlumnosExternos());
}

//Clase para la busqueda de alumnos externos del appbar
class DataSearch extends SearchDelegate {
  String nombre = '';
  String especialidad = '';
  String universidad = '';
  String telefono = '';
  String email = '';
  String inicio = '';
  String fin = '';
//Metodo de accion para limpiar la busqueda
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

//Metodo para mostrar los resultados de la busqueda
  @override
  Widget buildResults(BuildContext context) => Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                      bottom: BorderSide(color: Colors.blueGrey, width: 4)),
                ),
                //Aqui se muestra el nombre del alumno externo
                child: Text(
                  (nombre),
                  style: const TextStyle(
                    fontSize: 35,
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
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                      bottom: BorderSide(color: Colors.blueGrey, width: 4)),
                ),
                
                //Aqui se muestra la especialidad del alumno externo
                child: Text(
                  (especialidad),
                  style: const TextStyle(
                    fontSize: 35,
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
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                      bottom: BorderSide(color: Colors.blueGrey, width: 4)),
                ),
               //Aqui se muestra la universidad del alumno externo
                child: Text(
                  (universidad),
                  style: const TextStyle(
                    fontSize: 35,
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
              ),
            ],
          ),
        ),
      );
//Metodo para mostrar las sugerencias de la busqueda
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? listadoAlumnos
        : listadoAlumnos
                .where((p) =>
                    p.nombre.toLowerCase().startsWith(query.toLowerCase()))
                .toList() +
            listadoAlumnos
                .where((p) => p.especialidad
                    .toLowerCase()
                    .startsWith(query.toLowerCase()))
                .toList() +
            listadoAlumnos
                .where((p) =>
                    p.universidad.toLowerCase().startsWith(query.toLowerCase()))
                .toList();
//Se crea un listview para mostrar las sugerencias, que incluyen el nombre, especialidad y universidad
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          nombre = suggestionList[index].nombre;
          especialidad = suggestionList[index].especialidad;
          universidad = suggestionList[index].universidad;
          showResults(context);
        },
        leading: const Icon(Icons.person),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].nombre.substring(0) +' - '+
                suggestionList[index].especialidad.substring(0) +' - '+
                suggestionList[index].universidad.substring(0),
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
