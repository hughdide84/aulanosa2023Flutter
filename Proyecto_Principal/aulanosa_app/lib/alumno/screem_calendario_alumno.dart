// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, annotate_overrides, unused_import, unnecessary_import, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:table_calendar/table_calendar.dart';
//Pagina que mostrara el calendario el alumno
class Calendario_alumno extends StatefulWidget {
  Calendario_alumno2 createState() => Calendario_alumno2();
}

class Calendario_alumno2 extends State<Calendario_alumno> {
  
  var size, heightA, widthA;
  DateTime hoy = DateTime.now();

  void dia_seleccionado(DateTime dia, DateTime diaFocus){
    setState(() {
      hoy = dia;
    }); 
   }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color.fromARGB(255, 72, 122, 216),
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text('Calendario alumno'),
      leading: MenuWidget(),
    ),
    body: calendario(),
  );

  Widget calendario(){
    return Padding(padding: const EdgeInsets.all(20.0), 
    child: Column(children: [
      Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black),
         borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10)
      )
        ),
      child:
      TableCalendar(focusedDay: hoy, 
      firstDay: DateTime.utc(2010, 01, 1), 
      lastDay: DateTime.utc(2040, 12, 31), 
      headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true, 
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
      decoration: BoxDecoration(color: Colors.blue,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10)
      )),
      leftChevronIcon: Icon(Icons.chevron_left, color: Color.fromARGB(255, 72, 122, 216),),
      rightChevronIcon: ),
      
      
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (dia) => isSameDay(dia, hoy),
      onDaySelected: dia_seleccionado),
      
    )]));
  }
  //Fechas de examenes, entregas de proyecto, evaluacion
}