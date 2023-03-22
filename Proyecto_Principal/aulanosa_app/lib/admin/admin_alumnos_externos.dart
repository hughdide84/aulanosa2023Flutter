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

List<AlumnoExterno> listadoAlumnos = [];
String urlListaAlumnosExternos='http://10.0.2.2:8080/api/alumnoExterno';

class _AlumnosExternosState extends State<AlumnosExternos> {
  AlumnoExterno alumno1 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'roberto',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'cocina',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  AlumnoExterno alumno2 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'suso',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'filosofia',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  AlumnoExterno alumno3 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'pablo',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'programacion',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  AlumnoExterno alumno4 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'marcos',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'matematicas',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  AlumnoExterno alumno5 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'daniel',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'especialidad',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  AlumnoExterno alumno6 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'pablo',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'aire libre',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  //Lista donde se almacenaran los objetos de la empresa que cada uno de ellos representaran

  var size, heightA, widthA;
  double alturaContainerInfoEmpresa = 0;
  bool containerAlumno = false;
  String infoContainerEmpresa = "";

  //Metodo para determinar que apartado tiene que mostrar dentro de cada empresa
  String determinarApartado(int index) {
    if (index == 0) {
      return "nombre";
    }
    if (index == 1) {
      return "tipo";
    }
    if (index == 2) {
      return "telefono";
    }
    if (index == 3) {
      return "email";
    }
    if (index == 4) {
      return "universidad";
    }
    if (index == 5) {
      return "titulacion";
    }
    if (index == 6) {
      return "especialidad";
    }
    if (index == 7) {
      return "evaluacion";
    }
    if (index == 8) {
      return "horario";
    }
    return "sdf";
  }

    Future<void> recuperarEmpresas() async {
    
    Uri myUri = Uri.parse('${urlListaAlumnosExternos}');

    final respuestaApi = await http.get(myUri);

    try{
      globales.listaEmpresas= Empresa.devolverListaEmpresas(respuestaApi.body);
      print(globales.listaEmpresas);
      

    }catch(excepcion){
      print(excepcion);
    }
    
  }

  //Funcion para controlar la altura del container que muestra la lista de alumnos
  double retornarAlturaContainerAlumno(index) {
    if (index == 7) {
      return 200;
    } else
      return 200;
  }

  //Utilizo el InitState porque quise cargar asi los objetos en la lista
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   listadoAlumnos=globales.listaAlumnosExternos;

  }

  //Metodo para retornar la informacion de cada uno de los apartados de la empresa, es decir, direccion de trabajo, direccion social, etc
  Container retornarInfo(String tituloCarta, int index) {
    //Dependiendo de cual sea el titulo de la carta este metodo retornara una informacion u otra
    if (tituloCarta == "nombre") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(1),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].nombre,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "tipo") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].tipo,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "telefono") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].telefono,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "email") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].email,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "universidad") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].universidad,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "titulacion") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].titulacion,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "especialidad") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].especialidad,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "evaluacion") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(globales.listaAlumnosExternos[index].evaluacion,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "horario") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text('horario',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }

    return Container();
  }

//Metodo para crear la estructura de toda la pagina, esta funcion creara tanto la lista principal de empresas como
//la lista que contiene la informacion de cada empresa
  ListView listaAlumnosExternos() {
    return ListView.builder(
        itemCount: globales.listaAlumnosExternos.length,
        itemBuilder: ((context, index) {
          //Obtengo en una variable el index que equivaldra a cada miembro de la lista, para poder controlar en cual estoy
          int numeroEmpresa = index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
                  border: Border(
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                    bottom: BorderSide(color: Colors.blueGrey, width: 4),
                  ),
                ),
                child: TextButton(
                    //Lo unico importante en esta linea es el valor que tiene el Text, este equivale al nombre que tiene el objeto empresa de la lista, al cual accedemos en funcion del index de la lista
                    child: Text(
                      globales.listaAlumnosExternos[index].nombre,
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        shadows: const <Shadow>[
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
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
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
                                        boxShadow: const [
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
                                                shadows: const <Shadow>[
                                                  Shadow(
                                                      offset: Offset(2, 2),
                                                      blurRadius: 10.0,
                                                      color: Colors.black),
                                                ],
                                              ),
                                            ),
                                          ),
                                          //Con este metodo gracias a la otra funcion y a la variable que indica el numero de empresa le pasamos todo esto para determinar que debe mostrar y sobre que empresa debe hacerlo
                                          retornarInfo(
                                              determinarApartado(index),
                                              numeroEmpresa)
                                        ],
                                      ),
                                    );
                                  },
                                ));
                          });
                        },
                      );
                    })),
          );
        }));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 92, 174),
        title: Text('Alumnos Externos'),
        leading: MenuWidget(),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      body: listaAlumnosExternos());
}

class DataSearch extends SearchDelegate {
 String nombre='';
 String email='';

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
           
            } 
        ),
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
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
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
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                      bottom: BorderSide(color: Colors.blueGrey, width: 4)),
                ),
                //Con esta funcion estamos determinando en funcion del index de la segunda lista que titulo debe llevar cada celda en funcion de la posicion
                //esta asi pensado porque como el encabezado de la informacion siempre es el mismo de esta forma no nos complicamos y lo localizamos facilmente
                child: Text(
                  (query),
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    shadows: const <Shadow>[
                      Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 10.0,
                          color: Colors.black),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                      bottom: BorderSide(color: Colors.blueGrey, width: 4)),
                ),
                //Con esta funcion estamos determinando en funcion del index de la segunda lista que titulo debe llevar cada celda en funcion de la posicion
                //esta asi pensado porque como el encabezado de la informacion siempre es el mismo de esta forma no nos complicamos y lo localizamos facilmente
                child: Text(
                  (nombre),
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    shadows: const <Shadow>[
                      Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 10.0,
                          color: Colors.black),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                      bottom: BorderSide(color: Colors.blueGrey, width: 4)),
                ),
                //Con esta funcion estamos determinando en funcion del index de la segunda lista que titulo debe llevar cada celda en funcion de la posicion
                //esta asi pensado porque como el encabezado de la informacion siempre es el mismo de esta forma no nos complicamos y lo localizamos facilmente
                child: Text(
                  (email),
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    shadows: const <Shadow>[
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

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? listadoAlumnos
        :  listadoAlumnos
                .where((p) =>
                    p.nombre.toLowerCase().startsWith(query.toLowerCase()))
                .toList() +
            listadoAlumnos
                .where((p) => p.especialidad
                    .toLowerCase()
                    .startsWith(query.toLowerCase()))
                .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestionList[index].especialidad;
          nombre=suggestionList[index].nombre;
          email=suggestionList[index].email;
          showResults(context);
        },
        leading: Icon(Icons.person),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].nombre.substring(0, query.length),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: suggestionList[index].nombre.substring(query.length),
                style: TextStyle(color: Colors.grey),
              ),
              const TextSpan(text: ' - '),
              TextSpan(
                text:
                    suggestionList[index].especialidad.substring(query.length),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
