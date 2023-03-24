// To parse this JSON data, do
//
//     final mensaje = mensajeFromJson(jsonString);

import 'dart:convert';

Mensaje mensajeFromJson(String str) => Mensaje.fromJson(json.decode(str));

List<Mensaje> mensajesFromJson(String str) =>
    List<Mensaje>.from(json.decode(str).map((x) => Mensaje.fromJson(x)));

String mensajeToJson(Mensaje data) => json.encode(data.toJson());

class Mensaje {
    Mensaje({
        required this.id,
        required this.idUsuario,
        required this.asunto,
        required this.texto,
        required this.fecha,
    });

    int id;
    int idUsuario;
    String asunto;
    String texto;
    DateTime fecha;

 // Métodos para devolver objetos alumno pasandole el string que formateo desde el json de la api //
  static Mensaje devolverMensaje(String datos){
    return mensajeFromJson(datos);
  } 
  
  static List<Mensaje> devolverListaMensajes(String datos){
    return  mensajesFromJson(datos);
  } 



    factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
        id: json["id"],
        idUsuario: json["idUsuario"],
        asunto: json["asunto"],
        texto: json["texto"],
        fecha: DateTime.parse(json["fecha"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idUsuario": idUsuario,
        "asunto": asunto,
        "texto": texto,
        "fecha": fecha.toIso8601String(),
    };
}
