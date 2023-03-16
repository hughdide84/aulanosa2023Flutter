import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class InsertarDatos extends StatelessWidget {
  String nombre = '';
  String descripcion = '';
  int telefono = 0;
  String correo = '';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Alta pipas')),
        body: Center(
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
                  OutlinedButton(
                      onPressed: () => recogerDatos(context),
                      child: Text('Pulsar'))
                ],
              )),
        ));
  }

  recogerDatos(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      insertPipas(nombre, descripcion);
    }
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

  Future<String> insertPipas(String nombre, String descripcion) async {
    String tokenDevuelto = await recogerToken();

    Uri myUri = Uri.parse(url);

    String body = json.encode({'nombre': nombre, 'descripcion': descripcion});
    try {
      final response = await http.post(
        myUri,
        // body: jsonMap,
        body: body,
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
