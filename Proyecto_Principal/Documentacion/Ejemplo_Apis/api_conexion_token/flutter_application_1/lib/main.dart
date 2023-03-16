import 'package:flutter/material.dart';

import 'pages/datos_otros.dart';
import 'pages/datos_usuarios.dart';
import 'pages/eliminarPipas.dart';

import 'pages/altaPipas.dart';
import 'pages/modificarPipas.dart';
import 'pages/pag_principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      initialRoute: "/paginaPrincipal",
      routes: {
        '/paginaPrincipal': (BuildContext context) => PrimeraPage(),
        '/segundaPage': (BuildContext context) => DatosUsuarios(),
        '/terceraPage': (BuildContext context) => MostrarDatos(),
        '/cuartaPage': (BuildContext context) => InsertarDatos(),
        '/quintaPage': (BuildContext context) => EliminarDatos(),
        '/sextaPage': (BuildContext context) => ModificarDatos(),
      },
    );
  }
}
