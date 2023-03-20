
import 'dart:convert';

// Clase que representa el objeto Alumno, para guardar la info de los usuarios de rol alumno //

Alumno alumnoFromJson(String str) => Alumno.fromJson(json.decode(str));

List<Alumno> alumnosFromJson(String str) =>
    List<Alumno>.from(json.decode(str).map((x) => Alumno.fromJson(x)));

String alumnoToJson(Alumno data) => json.encode(data.toJson());

class Alumno {
    Alumno({
        required this.id,
        required this.idCurso,
        required this.idEstudios,
        required this.nombre,
        required this.cv,
        required this.carta,
        required this.idEmpresa,
        required this.inicioPr,
        required this.finPr,
    });

    int id;
    int idCurso;
    int idEstudios;
    String nombre;
    String cv;
    String carta;
    int idEmpresa;
    DateTime inicioPr;
    DateTime finPr;

  // Métodos para devolver objetos usuario pasandole el string que formateo desde el json de la api //
  static Alumno devolverAlumno(String datos){
    return alumnoFromJson(datos);
  } 
  
  static List<Alumno> devolverListaAlumnos(String datos){
    return  alumnosFromJson(datos);
  } 


  // Método para mapear los atributos del objeto alumno que devuelve la API en formato Json //
  
    factory Alumno.fromJson(Map<String, dynamic> json) => Alumno(
        id: json["id"],
        idCurso: json["idCurso"],
        idEstudios: json["idEstudios"],
        nombre: json["nombre"],
        cv: json["cv"],
        carta: json["carta"],
        idEmpresa: json["idEmpresa"],
        inicioPr: DateTime.parse(json["inicioPr"]),
        finPr: DateTime.parse(json["finPr"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idCurso": idCurso,
        "idEstudios": idEstudios,
        "nombre": nombre,
        "cv": cv,
        "carta": carta,
        "idEmpresa": idEmpresa,
        "inicioPr": inicioPr.toIso8601String(),
        "finPr": finPr.toIso8601String(),
    };
}
