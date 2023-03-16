import 'dart:convert';
import 'package:flutter/material.dart';

class PrimeraPage extends StatefulWidget {
  @override
  Lienzo createState() => Lienzo();
}

class Lienzo extends State<PrimeraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uso del drawer"),
      ),
      body: Center(
        child: Text("Hola mundo"),
      ),
      drawer: getDrawer(context),
    );
  }

  getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal[100]),
            child: Row(
              children: [
                FlutterLogo(
                  size: 50,
                ),
                Text(
                  "Esta es la cabecera",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ),
          ListTile(
            title: Text("Inicio"),
            leading: Icon(Icons.home),
            onTap: () => mostrarHome(context),
          ),
          ListTile(
            title: Text("Ver datos Usuarios"),
            leading: Icon(Icons.verified_user),
            onTap: () => verUsuarios(context),
          ),
          ListTile(
            title: Text("Mostrar datos API token"),
            leading: Icon(Icons.apple),
            onTap: () => mostrarDatos(context),
          ),
          ListTile(
            title: Text("Dar datos API token"),
            leading: Icon(Icons.insert_chart),
            onTap: () => insertarDatos(context),
          ),
          ListTile(
            title: Text("Eliminar datos API token"),
            leading: Icon(Icons.delete),
            onTap: () => eliminarDatos(context),
          ),
          ListTile(
            title: Text("Modificar datos API token"),
            leading: Icon(Icons.update),
            onTap: () => modificarDatos(context),
          ),
        ],
      ),
    );
  }

  mostrarHome(BuildContext context) {
    Navigator.pop(context);
  }

  verUsuarios(BuildContext context) {
    Navigator.of(context).pushNamed('/segundaPage');
  }

  mostrarDatos(BuildContext context) {
    Navigator.of(context).pushNamed('/terceraPage');
  }

  modificarDatos(BuildContext context) {
    Navigator.of(context).pushNamed('/sextaPage');
  }

  eliminarDatos(BuildContext context) {
    Navigator.of(context).pushNamed('/quintaPage');
  }

  insertarDatos(BuildContext context) {
    Navigator.of(context).pushNamed('/cuartaPage');
  }
}
