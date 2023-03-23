// To parse this JSON data, do
//
//     final estudio = estudioFromJson(jsonString);

import 'dart:convert';

Estudio estudioFromJson(String str) => Estudio.fromJson(json.decode(str));

List<Estudio> estudiosFromJson(String str) =>
    List<Estudio>.from(json.decode(str).map((x) => Estudio.fromJson(x)));

String estudioToJson(Estudio data) => json.encode(data.toJson());

class Estudio {
    Estudio({
        required this.id,
        required this.nombre,
        required this.fct,
        required this.pext,
    });

    int id;
    String nombre;
    bool fct;
    bool pext;


  // Métodos para devolver objetos alumno pasandole el string que formateo desde el json de la api //
  static Estudio devolverAlumno(String datos){
    return estudioFromJson(datos);
  } 
  
  static List<Estudio> devolverListaAlumnos(String datos){
    return  estudiosFromJson(datos);
  } 


    factory Estudio.fromJson(Map<String, dynamic> json) => Estudio(
        id: json["id"],
        nombre: json["nombre"],
        fct: json["fct"],
        pext: json["pext"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "fct": fct,
        "pext": pext,
    };
}
