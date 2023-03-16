import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:async';


// https://wiki.cifprodolfoucha.es/index.php?title=Flutter_StatefulWidget._Formularios

class ModificarDatos extends StatelessWidget {
  // This widget is the root of your application.

  String nombre = '';
  String descripcion = '';
  final formKey = GlobalKey<FormState>();

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
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                children: _crearEmail(snapshot.data),
                // Divider(),
                // _crearPassword(),
              );
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  List<Widget> _crearEmail(List<dynamic> info) {
    List<Widget> lista = [];
    info.forEach((elemento) {
      lista.add(TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email del paciente',
            labelText: 'Email',
            suffixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
      ));
    });
    return lista;
  }

  List<Widget> listado(List<dynamic> info) {
    List<Widget> lista = [];
    int cont = 1;
    info.forEach((elemento) {
      lista.add(Center(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Nombre Pipas"),
                  onSaved: (value) {
                    nombre = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo vacio';
                    }

                    if (value.length < 3) {
                      return 'Campo no válido';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Descripcion"),
                  onSaved: (value) {
                    descripcion = value!;
                  },
                ),
                // OutlinedButton(
                //     onPressed: () => recogerDatos(context),
                //     child: Text('Pulsar')
                //     )
              ],
            )),
      ));

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

    print(response.body);

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
