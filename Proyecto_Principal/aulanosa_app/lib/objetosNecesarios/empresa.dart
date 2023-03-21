// To parse this JSON data, do
//
//     final empresa = empresaFromJson(jsonString);

import 'dart:convert';

Empresa empresaFromJson(String str) => Empresa.fromJson(json.decode(str));

List<Empresa> empresasFromJson(String str) =>
    List<Empresa>.from(json.decode(str).map((x) => Empresa.fromJson(x)));

String empresaToJson(Empresa data) => json.encode(data.toJson());

class Empresa {
    Empresa({
        required this.id,
        required this.idCurso,
        required this.idEstudios,
        required this.nombre,
        required this.direccionSocial,
        required this.direccionTrabajo,
        required this.cif,
        required this.representante,
        required this.contacto,
        required this.tutor1,
        required this.tutor2,
        required this.tutor3,
        required this.convenio,
        required this.planIndividual,
        required this.hojaActividades,
    });

    int id;
    int idCurso;
    int idEstudios;
    String nombre;
    String direccionSocial;
    String direccionTrabajo;
    String cif;
    String representante;
    String contacto;
    String tutor1;
    String tutor2;
    String tutor3;
    String convenio;
    String planIndividual;
    String hojaActividades;


   // Métodos para devolver objetos alumno pasandole el string que formateo desde el json de la api //
  static Empresa devolverEmpresa(String datos){
    return empresaFromJson(datos);
  } 

   static List<Empresa> devolverListaEmpresas(String datos){
    return  empresasFromJson(datos);
  } 


    factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
       id: json["id"],
        idCurso: json["idCurso"],
        idEstudios: json["idEstudios"],
        nombre: json["nombre"],
        direccionSocial: json["direccionSocial"],
        direccionTrabajo: json["direccionTrabajo"],
        cif: json["cif"],
        representante: json["representante"],
        contacto: json["contacto"],
        tutor1: json["tutor1"],
        tutor2: json["tutor2"],
        tutor3: json["tutor3"],
        convenio: json["convenio"],
        planIndividual: json["planIndividual"],
        hojaActividades: json["hojaActividades"],
    );

    Map<String, dynamic> toJson() => {
        //"id": id,
        //"idCurso": idCurso,
        //"idEstudios": idEstudios,
        "nombre": nombre,
        "direccionSocial": direccionSocial,
        "direccionTrabajo": direccionTrabajo,
        "cif": cif,
        "representante": representante,
        "contacto": contacto,
        "tutor1": tutor1,
        "tutor2": tutor2,
        "tutor3": tutor3,
        "convenio": convenio,
        "planIndividual": planIndividual,
        "hojaActividades": hojaActividades,
    };
}
