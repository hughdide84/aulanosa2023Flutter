// To parse this JSON data, do
//
//     final Estudios = EstudiosFromJson(jsonString);

import 'dart:convert';

Estudios EstudiosFromJson(String str) => Estudios.fromJson(json.decode(str));

List<Estudios> EstudiossFromJson(String str) =>
    List<Estudios>.from(json.decode(str).map((x) => Estudios.fromJson(x)));

String EstudiosToJson(Estudios data) => json.encode(data.toJson());

class Estudios {
    Estudios({
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
  static Estudios devolverAlumno(String datos){
    return EstudiosFromJson(datos);
  } 
  
  static List<Estudios> devolverListaAlumnos(String datos){
    return  EstudiossFromJson(datos);
  } 


    factory Estudios.fromJson(Map<String, dynamic> json) => Estudios(
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
