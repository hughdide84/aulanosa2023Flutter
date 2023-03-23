import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aulanosa_app/globals/variable_global.dart' as globales;
import 'package:http/http.dart' as http;

//Pagina para editar/mostrar AdminAlumnos
class AdminAlumnos extends StatefulWidget {
  const AdminAlumnos({super.key});

  @override
  State<AdminAlumnos> createState() => _AdminAlumnosState();
}

class _AdminAlumnosState extends State<AdminAlumnos> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 48, 92, 174),
          title: const Text('Alumnos'),
          leading: MenuWidget(),
        ),
        backgroundColor: const Color.fromARGB(255, 105, 146, 221),
        body: listaAlumnos(),
      );

  //Metodo para determinar que apartado tiene que mostrar dentro de cada alumno externo
  String determinarApartado(int index) {
    if (index == 0) {
      return "Nombre";
    } else if (index == 1) {
      return "Curso";
    } else if (index == 2) {
      return "Estudios";
    }
    return '';
  }

  //Funcion para controlar la altura del container que muestra la lista de alumnos
  double retornarAlturaContainerAlumno(index) {
    if (index == 1 ) {
      return 2000;
    } else {
      return 200;
    }
  }

//Metodo para retornar la informacion de cada uno de los apartados del alumno externo, es decir, nombre, telefono, universidad, etc
  Container retornarInfo(String tituloCarta, int index) {
    //Dependiendo de cual sea el titulo de la carta este metodo retornara una informacion u otra
    if (tituloCarta == "Nombre") {
      return Container(
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
          'dato recogido',
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    } else if (tituloCarta == "Curso") {
      return Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 105, 146, 221),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: const Color.fromARGB(255, 105, 146, 221), width: 3)),
          child: Text('dato recogido',
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    } else if (tituloCarta == "Estudios") {
      return Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 105, 146, 221),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: const Color.fromARGB(255, 105, 146, 221), width: 3)),
          child: Text('dato recogido',
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }

    return Container();
  }

  //Metodo para crear la estructura de toda la pagina, esta funcion creara tanto la lista principal de alumnos externos como
//la lista que contiene la informacion de cada alumno externo
  ListView listaAlumnos() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: ((context, index) {
        //Obtengo en una variable el index que equivaldra a cada miembro de la lista, para poder controlar en cual estoy
        int numeroAlumnoExterno = index;
        return Padding(
          //padding: const EdgeInsets.all(10.0),
          padding:
              const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 8),

          //Mediante un GestureDetector, se podra acceder a la informacion de cada alumno externo abriendo un showDialog
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
                  //bottom: BorderSide(color: Color.fromARGB(255, 105, 146, 221), width: 4),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  child: Text(
                    'nombre recogido',
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
                            itemCount: 3,
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

                                      //Con esta funcion estamos determinando en funcion del index de la segunda lista que titulo debe llevar cada celda en funcion de la posicion
                                      //esta asi pensado porque como el encabezado de la informacion siempre es el mismo de esta forma no nos complicamos y lo localizamos facilmente
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
