import 'package:flutter/material.dart';

import 'pages/datos_otros.dart';
import 'pages/datos_usuarios.dart';
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
        '/terceraPage': (BuildContext context) => OtrosDatos(),
      },
    );
  }
}
