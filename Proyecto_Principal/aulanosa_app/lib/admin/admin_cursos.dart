// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_collection_literals, prefer_const_literals_to_create_immutables

import 'package:aulanosa_app/objetosNecesarios/curso.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//Pagina para editar/mostrar AdminCursos
class AdminCursos extends StatefulWidget {
  const AdminCursos({super.key});

  @override
  State<AdminCursos> createState() => _AdminCursosState();
}

class _AdminCursosState extends State<AdminCursos> {

  Curso curso1 = Curso(id: 1, estado: "EstadoCurso1", fin: DateTime.utc(2020, 02, 04), inicio: DateTime.utc(2018, 05, 10), nombre: "NombreCurso1");
  Curso curso2 = Curso(id: 2, estado: "EstadoCurso2", fin: DateTime.utc(2023, 05, 10), inicio: DateTime.utc(2015, 10, 05), nombre: "NombreCurso2");
  Curso curso3 = Curso(id: 3, estado: "EstadoCurso3", fin: DateTime.utc(2023, 10, 04), inicio: DateTime.utc(2018, 10, 12), nombre: "NombreCurso3");
  Curso curso4 = Curso(id: 4, estado: "EstadoCurso4", fin: DateTime.utc(2023, 08, 12), inicio: DateTime.utc(2010, 02, 12), nombre: "NombreCurso4");
  Curso curso5 = Curso(id: 5, estado: "EstadoCurso5", fin: DateTime.utc(2023, 09, 10), inicio: DateTime.utc(2002, 01, 06), nombre: "NombreCurso5");
  Curso curso6 = Curso(id: 6, estado: "EstadoCurso", fin: DateTime.utc(2023, 10, 10), inicio: DateTime.utc(2006, 01, 02), nombre: "NombreCurso6");
  Curso curso7 = Curso(id: 7, estado: "EstadoCurso7", fin: DateTime.utc(2023, 01, 01), inicio: DateTime.utc(2020 , 06, 04), nombre: "NombreCurso7");
  Curso curso8 = Curso(id: 8, estado: "EstadoCurso8", fin: DateTime.utc(2023, 12, 12), inicio: DateTime.utc(2018, 05, 10), nombre: "NombreCurso8");

  List<Curso> listadoCursos = [];

  String tituloCurso = "";
  String estadoCurso = "";
  DateTime fechaInicio = DateTime.now();
  DateTime fechaFin = DateTime.now();

  bool clickado = false;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Cargamos aqui todos los objetos por conveniencia
    listadoCursos.add(curso1);
    listadoCursos.add(curso2);
    listadoCursos.add(curso3);
    listadoCursos.add(curso4);
    listadoCursos.add(curso5);
    listadoCursos.add(curso6);
    listadoCursos.add(curso7);
    listadoCursos.add(curso8);
  }

 

   Widget estadoCursos(){
    return  Container(
      padding: EdgeInsets.all(5),
        height: 200,
        child:ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: listadoCursos.length,
           itemBuilder: (BuildContext context, int index) {  
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
              width: 160.0,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                border: Border.all(color: Colors.blueGrey, width: 4)),
              child: TextButton(
                onPressed: () {
                //Aqui setearemos los estado para que se muestre la informacion segun el curso
                setState(() {
                  clickado = true;
                  tituloCurso = listadoCursos[index].nombre;
                  estadoCurso = listadoCursos[index].estado;
                  fechaFin = listadoCursos[index].fin;
                  fechaInicio = listadoCursos[index].inicio;
                });
                },
        child: Text(listadoCursos[index].nombre,  textAlign: TextAlign.center,style: TextStyle(fontSize: 25,  fontWeight: FontWeight.bold, color: Colors.blueGrey,
        shadows: <Shadow>[Shadow( offset: Offset(2, 2), blurRadius: 6.0, color: Colors.black),],))));
            
          },
          ));
  }
  //Metodo que utilizaremos para mostrar la informacion de cada curso

  Widget infoCurso() {
    if(clickado){
    return Container(
      padding: EdgeInsets.all(20),
      width: 300,
      decoration: BoxDecoration(),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 5, color: Colors.white)),
          child:Text(tituloCurso, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        
        SizedBox(height: 40,),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.blueGrey, width: 3), top: BorderSide.none, left: BorderSide.none, right: BorderSide.none)),
          width: 250,
          child:Text(estadoCurso, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey  )),
        ),
       
        SizedBox(height: 40,),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.blueGrey, width: 3), top: BorderSide.none, left: BorderSide.none, right: BorderSide.none)),
          width: 250,
          child:Text(fechaInicio.toIso8601String(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey )),
        ),
        SizedBox(height: 40,),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.blueGrey, width: 3), top: BorderSide.none, left: BorderSide.none, right: BorderSide.none)),
          width: 250,
          child:Text(fechaFin.toIso8601String(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey )),
        ),
      ],)
    );
  }else{
    return Container(
      alignment: Alignment.center, 
      child: Text("Informacion de curso")
    );
  }
    }  
    @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Cursos'),
      leading: MenuWidget(),
    ),

    body: Stack(
      alignment: Alignment.topCenter,
      children: [
      estadoCursos(),
      Padding(
        padding: EdgeInsets.all(20),
        child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 220),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
          border: Border.all(color: Colors.blueGrey, width: 3)),
          
          child: infoCurso()))
      
    ],)
   
    
    );
  
}