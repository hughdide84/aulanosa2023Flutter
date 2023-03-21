import 'package:aulanosa_app/objetosNecesarios/alumnos_externos.dart';
import 'package:aulanosa_app/objetosNecesarios/empresa.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';

// Página editar/mostrar alumnos externos
class AlumnosExternos extends StatefulWidget {
  const AlumnosExternos({super.key});

  @override
  State<AlumnosExternos> createState() => _AlumnosExternosState();
}

class _AlumnosExternosState extends State<AlumnosExternos> {
  AlumnoExterno alumno1 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'nombre',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'especialidad',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  AlumnoExterno alumno2 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'nombre',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'especialidad',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  AlumnoExterno alumno3 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'nombre',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'especialidad',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  AlumnoExterno alumno4 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'nombre',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'especialidad',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  AlumnoExterno alumno5 = AlumnoExterno(
      id: 1,
      idCurso: 1,
      tipo: 'a',
      nombre: 'nombre',
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
      nombre: 'nombre',
      email: 'email',
      telefono: 'telefono',
      universidad: 'universidad',
      titulacion: 'titulacion',
      especialidad: 'especialidad',
      cv: 'cv',
      convenio: 'convenio',
      evaluacion: 'evaluacion',
      horario: 'horario');

  //Lista donde se almacenaran los objetos de la empresa que cada uno de ellos representaran
  List<Empresa> listadoEmpresas = [];
  List<AlumnoExterno> listadoAlumnos = [];
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
    listadoAlumnos.add(alumno1);
    listadoAlumnos.add(alumno2);
    listadoAlumnos.add(alumno3);
    listadoAlumnos.add(alumno4);
    listadoAlumnos.add(alumno5);
    listadoAlumnos.add(alumno6);
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
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(listadoAlumnos[index].nombre,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
    else if (tituloCarta == "tipo") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(listadoAlumnos[index].tipo,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
     else if (tituloCarta == "telefono") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(listadoAlumnos[index].telefono,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
     else if (tituloCarta == "email") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(listadoAlumnos[index].email,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
     else if (tituloCarta == "universidad") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(listadoAlumnos[index].universidad,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
     else if (tituloCarta == "titulacion") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(listadoAlumnos[index].titulacion,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
     else if (tituloCarta == "especialidad") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(listadoAlumnos[index].especialidad,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
     else if (tituloCarta == "evaluacion") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(listadoAlumnos[index].evaluacion,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
     else if (tituloCarta == "horario") {
      return Container(
          width: 320,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey, width: 3)),
          child: Text(listadoAlumnos[index].horario,
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
        itemCount: listadoAlumnos.length,
        itemBuilder: ((context, index) {
          //Obtengo en una variable el index que equivaldra a cada miembro de la lista, para poder controlar en cual estoy
          int numeroEmpresa = index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
                alignment: Alignment.center,
                height: 100,
                decoration: BoxDecoration(
                  boxShadow: [
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
                      listadoAlumnos[numeroEmpresa].nombre,
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
                                        height: retornarAlturaContainerAlumno(
                                            index),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[200],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                      top: BorderSide.none,
                                                      left: BorderSide.none,
                                                      right: BorderSide.none,
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.blueGrey,
                                                          width: 4)),
                                                ),
                                                //Con esta funcion estamos determinando en funcion del index de la segunda lista que titulo debe llevar cada celda en funcion de la posicion
                                                //esta asi pensado porque como el encabezado de la informacion siempre es el mismo de esta forma no nos complicamos y lo localizamos facilmente
                                                child: Text(
                                                    determinarApartado(index),
                                                    style: TextStyle(
                                                      fontSize: 35,
                                                      color: Colors.blueGrey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      shadows: <Shadow>[
                                                        Shadow(
                                                            offset:
                                                                Offset(2, 2),
                                                            blurRadius: 10.0,
                                                            color:
                                                                Colors.black),
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
      ),
      body: listaAlumnosExternos());
}
