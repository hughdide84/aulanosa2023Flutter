import 'dart:math';

import 'package:aulanosa_app/objetosNecesarios/alumnos_externos.dart';
import 'package:aulanosa_app/objetosNecesarios/curso.dart';
import 'package:aulanosa_app/objetosNecesarios/empresa.dart';
import 'package:aulanosa_app/objetosNecesarios/filtro_Empresa.dart';
import 'package:http/http.dart' as http;
import 'package:aulanosa_app/globals/variable_global.dart' as globales;


// Variable que contiene la direccion de la API para recuperar la lista de empresa //
String urlListaEmpresas="http://10.0.2.2:8080/api/empresa";

// Variable que contiene la dirección de la API para recuperar la lista de cursos //
String urlListaCursos ="http://10.0.2.2:8080/api/curso/all";

// Variable que contiene la dirección de la API para recuperar la lista de alumnos externos //
String urlListaAlumnosExternos ="http://10.0.2.2:8080/api/alumnoExterno/";

// Variable que guarda la direccion de la API para recuperar unas empresas filtradas
String urlIdEmpresa ="http://10.0.2.2:8080/api/empresa/alumno/";




class metodosCompartidos{

// Método para recuperar la lista de empresas //

  Future<void> recuperarEmpresas() async {
    
    // Uri de la direccion de la API que recupera una lista de datos por idCurso e idEstudios //

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

   Future<void> recuperarAlumnosExternos() async{
    Uri myUri = Uri.parse('$urlListaAlumnosExternos');

    final respuestaApi = await http.get(myUri);

    try{
      globales.listaAlumnosExternos = AlumnoExterno.devolverListaAlumnosExternos(respuestaApi.body);

    }catch(excepcion){
      print(excepcion);

    }
  }




   Future <void> recuperarEmpresasFiltradas(int idCurso, int idEstudios) async {
    
    List<Empresa> listaEmpresasRecuperadas=[];


    // Uri de la direccion de la API que recupera una lista de datos por idCurso e idEstudios //
    
    Uri myUri = Uri.parse('${urlListaEmpresas}');


    Uri myUri2 = Uri.parse('$urlIdEmpresa'+'$idCurso'+'$idEstudios');

    // Recupero la lista de empresas para poder compararlas por id //
    final respuestaApi = await http.get(myUri);


    // Despues recupero los datos filtrados de las empresas por idCurso y por idEstudios //
    // Es decir, filtrados por el año de curso que nos interesa y los estudios //
    final respuestaAPI2 = await http.get(myUri2);
    
    try{
      List<Empresa> listaEmpresas = Empresa.devolverListaEmpresas(respuestaApi.body);
      //globales.listaEmpresas= Empresa.devolverListaEmpresas(respuestaApi.body);
      List<FiltroEmpresa> listaEmpresasFiltradas = FiltroEmpresa.devolverListaFiltroEmpresas(respuestaAPI2.body);

      // Itero la lista de empresas que nos devuelve la primera direccion de la API //
      // Con la siguiente lista de empresas que nos da un id de //
      // la empresa que si cumple los filtro de idCurso e idEstudios //
      // Una vez filtradas, actualizo la variable global que es la utilizo para mostrar //
      // y actualizar info en el resto de la app //
      for(var empresa in listaEmpresas){
          for(var empresaFiltrada in listaEmpresasFiltradas){
              if(empresa.id==empresaFiltrada.idEmpresa){
                listaEmpresasRecuperadas.add(empresa);
              }
          }

      }
      // Actualizo la variable global para la lista de empresas que se muestra //
      globales.listaEmpresas=listaEmpresasRecuperadas;

    }catch(excepcion){
      print(excepcion);
    }
    
    
  }

}
