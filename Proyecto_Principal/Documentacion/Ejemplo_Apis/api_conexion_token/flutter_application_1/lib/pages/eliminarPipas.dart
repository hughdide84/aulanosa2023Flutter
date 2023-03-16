import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:async';

class EliminarDatos extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Ejemplo'),
      ),
      body: Container(
        child: FutureBuilder<dynamic>(
          future: fetchUsersFromGitHub(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(children: listado(snapshot.data, context));
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  List<Widget> listado(List<dynamic> info, BuildContext context) {
    List<Widget> lista = [];
    int cont = 1;
    info.forEach((elemento) {
      lista.add(Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          margin: EdgeInsets.all(15),
          elevation: 10,

          // Dentro de esta propiedad usamos ClipRRect
          child: ClipRRect(
            // Los bordes del contenido del card se cortan usando BorderRadius
            borderRadius: BorderRadius.circular(30),

            // EL widget hijo que será recortado segun la propiedad anterior
            child: Column(
              children: <Widget>[
                // Usamos el widget Image para mostrar una imagen

                // Usamos Container para el contenedor de la descripción
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(elemento.id.toString() +
                        " " +
                        elemento.nombre +
                        " " +
                        elemento.descripcion),
                  ),
                  onTap: () => enviarDatos(elemento.id, context),
                ),
              ],
            ),
          )));

      cont++;
    });
    return lista;
  }

  String url = "http://www.galsoftpre.es/aulanosa/api/productos";
  String tokenEnv = "http://www.galsoftpre.es/aulanosa/token";

  Future<String> recogerToken() async {
    Uri myUri = Uri.parse(tokenEnv);
    String username = "aulanosa";
    String password = "admin";
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    final response = await http.post(myUri, headers: {
      'Authorization': basicAuth,
    });

    // print(response.body);

    return response.body;
  }

  Future<List<Pipas>> fetchUsersFromGitHub() async {
    String tokenDevuelto = await recogerToken();

    Uri myUri = Uri.parse(url);
    final response = await http
        .get(myUri, headers: {'Authorization': 'Bearer $tokenDevuelto'});

    List<Pipas> userList = pipasFromJson(response.body);
    return userList;
  }

  enviarDatos(int id, BuildContext context) {
    deletePipas(id);

    Navigator.of(context).pushNamed('/quintaPage');
  }

  Future<String> deletePipas(int id) async {
    String tokenDevuelto = await recogerToken();
    url = url + "/$id";
    Uri myUri = Uri.parse(url);

    try {
      final response = await http.delete(
        myUri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenDevuelto',
        },
      );

      print(response.body);
      return response.body;
    } catch (exception) {
      print('error');
    }
    return "";
  }
}

// To parse this JSON data, do
//
//     final pipas = pipasFromJson(jsonString);

List<Pipas> pipasFromJson(String str) =>
    List<Pipas>.from(json.decode(str).map((x) => Pipas.fromJson(x)));

String pipasToJson(List<Pipas> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pipas {
  Pipas({
    required this.id,
    required this.nombre,
    required this.descripcion,
  });

  final int id;
  final String nombre;
  final String descripcion;

  factory Pipas.fromJson(Map<String, dynamic> json) => Pipas(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
      };
}
