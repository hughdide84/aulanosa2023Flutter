import 'dart:math';

import 'package:aulanosa_app/objetosNecesarios/curso.dart';
import 'package:aulanosa_app/objetosNecesarios/empresa.dart';
import 'package:http/http.dart' as http;
import 'package:aulanosa_app/globals/variable_global.dart' as globales;


// Variable que contiene la direccion de la API para recuperar la lista de empresa //
String urlListaEmpresas="http://10.0.2.2:8080/api/empresa";

// Variable que contiene la dirección de la API para recuperar la lista de cursos //
String urlListaCursos ="http://10.0.2.2:8080/api/curso/all";

// Variable que guarda la direccion de la API para recuperar unas empresas filtradas
String urlIdEmpresa ="http://10.0.2.2:8080/api/empresa/alumno/";


class metodosCompartidos{

// Método para recuperar la lista de empresas //

  Future<void> recuperarEmpresas() async {
    
    // Uri de la direccion de la API que recupera una lista de datos por idCurso e idEstudios //

    Uri myUri = Uri.parse('${urlListaEmpresas}');

    Uri myUri2 = Uri.parse("");

    final respuestaApi = await http.get(myUri);

    try{
      globales.listaEmpresas= Empresa.devolverListaEmpresas(respuestaApi.body);



    }catch(excepcion){
      print(excepcion);
    }
    
  }

  Future<void> recuperarCursos() async{
    Uri myUri = Uri.parse('$urlListaCursos');

    final respuestaApi = await http.get(myUri);

    try{
      globales.listaCursos = Curso.devolverListaCursos(respuestaApi.body);

    }catch(excepcion){
      print(excepcion);

    }
  }




   Future<void> recuperarEmpresas2() async {
    
    // Uri de la direccion de la API que recupera una lista de datos por idCurso e idEstudios //
    
    Uri myUri = Uri.parse('${urlListaEmpresas}');


    Uri myUri2 = Uri.parse('$urlIdEmpresa'+''+'');

    // Recupero la lista de empresas para poder compararlas por id //
    final respuestaApi = await http.get(myUri);


    // Despues recupero los datos filtrados de las empresas por idCurso y por idEstudios //
    // Es decir, filtrados por el año de curso que nos interesa y los estudios //
    final respuestaAPI2 = await http.get(myUri2);

    try{

      globales.listaEmpresas= Empresa.devolverListaEmpresas(respuestaApi.body);

    

    }catch(excepcion){
      print(excepcion);
    }
    
  }

}
