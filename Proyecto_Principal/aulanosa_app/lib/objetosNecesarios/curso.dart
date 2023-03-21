// To parse this JSON data, do
//
//     final curso = cursoFromJson(jsonString);

import 'dart:convert';

Curso cursoFromJson(String str) => Curso.fromJson(json.decode(str));

List<Curso> cursosFromJson(String str) =>
    List<Curso>.from(json.decode(str).map((x) => Curso.fromJson(x)));

String cursoToJson(Curso data) => json.encode(data.toJson());

class Curso {
    Curso({
        required this.id,
        required this.nombre,
        required this.inicio,
        required this.fin,
        required this.estado,
    });

    int id;
    String nombre;
    DateTime inicio;
    DateTime fin;
    String estado;

  // Métodos para devolver objetos usuario pasandole el string que formateo desde el json de la api //
  static Curso devolverCurso(String datos){
    return cursoFromJson(datos);
  } 
  
  static List<Curso> devolverListaCursos(String datos){
    return  cursosFromJson(datos);
  } 

    factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        id: json["id"],
        nombre: json["nombre"],
        inicio: DateTime.parse(json["inicio"]),
        fin: DateTime.parse(json["fin"]),
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "inicio": inicio.toIso8601String(),
        "fin": fin.toIso8601String(),
        "estado": estado,
    };
}
