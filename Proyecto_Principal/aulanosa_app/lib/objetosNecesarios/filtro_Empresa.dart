// To parse this JSON data, do
//
//     final filtroEmpresa = filtroEmpresaFromJson(jsonString);

import 'dart:convert';

FiltroEmpresa filtroEmpresaFromJson(String str) => FiltroEmpresa.fromJson(json.decode(str));

List<FiltroEmpresa> filtrosEmpresaFromJson(String str) =>
    List<FiltroEmpresa>.from(json.decode(str).map((x) => FiltroEmpresa.fromJson(x)));

String filtroEmpresaToJson(FiltroEmpresa data) => json.encode(data.toJson());

class FiltroEmpresa {
    FiltroEmpresa({
        required this.id,
        required this.idAlumno,
        required this.nombreAlumno,
        required this.idEmpresa,
        required this.nombreEmpresa,
        required this.estado,
    });

    int id;
    int idAlumno;
    String nombreAlumno;
    int idEmpresa;
    String nombreEmpresa;
    String estado;


    // Métodos para devolver objetos empresa Filtrada pasandole el string que formateo desde el json de la api //
  static FiltroEmpresa devolverFiltroEmpresa(String datos){
    return filtroEmpresaFromJson(datos);
  } 
  
  static List<FiltroEmpresa> devolverListaFiltroEmpresas(String datos){
    return  filtrosEmpresaFromJson(datos);
  } 


    factory FiltroEmpresa.fromJson(Map<String, dynamic> json) => FiltroEmpresa(
        id: json["id"],
        idAlumno: json["idAlumno"],
        nombreAlumno: json["nombreAlumno"],
        idEmpresa: json["idEmpresa"],
        nombreEmpresa: json["nombreEmpresa"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idAlumno": idAlumno,
        "nombreAlumno": nombreAlumno,
        "idEmpresa": idEmpresa,
        "nombreEmpresa": nombreEmpresa,
        "estado": estado,
    };
}
