

import 'dart:convert';

AlumnoExterno alumnoExternoFromJson(String str) => AlumnoExterno.fromJson(json.decode(str));

List<AlumnoExterno> alumnosExternosFromJson(String str) =>
    List<AlumnoExterno>.from(json.decode(str).map((x) => AlumnoExterno.fromJson(x)));

String alumnoExternoToJson(AlumnoExterno data) => json.encode(data.toJson());

class AlumnoExterno {
  AlumnoExterno({
    required this.id,
    required this.idCurso,
    required this.tipo,
    required this.nombre,
    required this.email,
    required this.telefono,
    required this.universidad,
    required this.titulacion,
    required this.especialidad,
    required this.cv,
    required this.convenio,
    required this.evaluacion,
    required this.horario,
  });

  int id;
  int idCurso;
  String tipo;
  String nombre;
  String email;
  String telefono;
  String universidad;
  String titulacion;
  String especialidad;
  String cv;
  String convenio;
  String evaluacion;
  String horario;

  // Métodos para devolver objetos alumno pasandole el string que formateo desde el json de la api //
  static AlumnoExterno devolverAlumnoExterno(String datos){
    return alumnoExternoFromJson(datos);
  } 

   static List<AlumnoExterno> devolverListaAlumnosExternos(String datos){
    return  alumnosExternosFromJson(datos);
  } 


    factory AlumnoExterno.fromJson(Map<String, dynamic> json) => AlumnoExterno(
        id: json["id"],
        idCurso: json["idCurso"],
        tipo: json["tipo"],
        nombre: json["nombre"],
        email: json["email"],
        telefono: json["telefono"],
        universidad: json["universidad"],
        titulacion: json["titulacion"],
        especialidad: json["especialidad"],
        cv: json["cv"],
        convenio: json["convenio"],
        evaluacion: json["evaluacion"],
        horario: json["horario"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idCurso": idCurso,
        "nombre": nombre,
        "email": email,
        "telefono": telefono,
        "universidad": universidad,
        "titulacion": titulacion,
        "especialidad": especialidad,
        "cv": cv,
        "convenio": convenio,
        "evaluacion": evaluacion,
        "horario": horario,

    };
}
