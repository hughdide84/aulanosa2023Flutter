import 'dart:math';

import 'package:aulanosa_app/objetosNecesarios/curso.dart';
import 'package:aulanosa_app/objetosNecesarios/empresa.dart';
import 'package:http/http.dart' as http;
import 'package:aulanosa_app/globals/variable_global.dart' as globales;


// Variable que contiene la direccion de la API para recuperar la lista de empresa //
String urlListaEmpresas="http://10.0.2.2:8080/api/empresa";

// Variable que contiene la dirección de la API para recuperar la lista de cursos //
String urlListaCursos ="http://10.0.2.2:8080/api/curso/all";


class metodosCompartidos{

// Método para recuperar la lista de empresas //
  Future<void> recuperarEmpresas() async {
    
    Uri myUri = Uri.parse('${urlListaEmpresas}');

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

}
