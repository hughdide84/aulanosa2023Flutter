import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


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
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Alumnos'),
      leading: MenuWidget(),
    ),
  );


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
}