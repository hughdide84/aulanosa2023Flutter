// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_collection_literals, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:aulanosa_app/objetosNecesarios/curso.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aulanosa_app/globals/variable_global.dart' as globales;

//Pagina para editar/mostrar AdminCursos
class AdminCursos extends StatefulWidget {
  const AdminCursos({super.key});

  @override
  State<AdminCursos> createState() => _AdminCursosState();
}

class _AdminCursosState extends State<AdminCursos> {

  //List<Curso> globales.listaCursos = [];

  String tituloCurso = "";
  String estadoCurso = "";
  // Formatear visualmente a string en flutter //
  DateTime fechaInicio = DateTime.now();
  DateTime fechaFin = DateTime.now();

  bool clickado = false;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

   Widget estadoCursos(){
    return  Container(
      padding: EdgeInsets.all(5),
        height: 200,
        child:ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: globales.listaCursos.length,
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
                  tituloCurso = globales.listaCursos[index].nombre;
                  if(globales.listaCursos[index].estado == "a"){
                  estadoCurso = "activo";
                  }
                   if(globales.listaCursos[index].estado == "b"){
                  estadoCurso = "inactivo";
                  }
                  fechaFin = globales.listaCursos[index].fin;
                  fechaInicio = globales.listaCursos[index].inicio;
                });
                },
        child: Text(globales.listaCursos[index].nombre,  textAlign: TextAlign.center,style: TextStyle(fontSize: 25,  fontWeight: FontWeight.bold, color: Colors.blueGrey,
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
          child:Text("Fecha de inicio: " + fechaInicio.day.toString() + "-" + fechaInicio.month.toString() + "-" + fechaInicio.year.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey )),
        ),
        SizedBox(height: 40,),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.blueGrey, width: 3), top: BorderSide.none, left: BorderSide.none, right: BorderSide.none)),
          width: 250,
          child:Text("Fecha de terminacion: " + fechaFin.day.toString() + "-" + fechaFin.month.toString() + "-" + fechaFin.year.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey )),
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