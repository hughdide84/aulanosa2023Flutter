// To parse this JSON data, do
//
//     final proyecto = proyectoFromJson(jsonString);

import 'dart:convert';

Proyecto proyectoFromJson(String str) => Proyecto.fromJson(json.decode(str));

List<Proyecto> proyectosFromJson(String str) =>
    List<Proyecto>.from(json.decode(str).map((x) => Proyecto.fromJson(x)));

String proyectoToJson(Proyecto data) => json.encode(data.toJson());

class Proyecto {
    Proyecto({
        required this.id,
        required this.idAlumno,
        required this.documento,
        required this.presentacion,
        required this.notaDoc,
        required this.notaPres,
        required this.notaFinal,
    });

    int id;
    int idAlumno;
    String documento;
    String presentacion;
    int notaDoc;
    int notaPres;
    int notaFinal;

     // Métodos para devolver objetos alumno pasandole el string que formateo desde el json de la api //
  static Proyecto devolverProyecto(String datos){
    return proyectoFromJson(datos);
  } 
  
  static List<Proyecto> devolverListaProyectos(String datos){
    return  proyectosFromJson(datos);
  } 



    factory Proyecto.fromJson(Map<String, dynamic> json) => Proyecto(
        id: json["id"],
        idAlumno: json["idAlumno"],
        documento: json["documento"],
        presentacion: json["presentacion"],
        notaDoc: json["notaDoc"],
        notaPres: json["notaPres"],
        notaFinal: json["notaFinal"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idAlumno": idAlumno,
        "documento": documento,
        "presentacion": presentacion,
        "notaDoc": notaDoc,
        "notaPres": notaPres,
        "notaFinal": notaFinal,
    };
}
