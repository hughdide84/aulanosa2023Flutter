import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//Pagina AdminPrincipal de administrador
class AdminPrincipal extends StatefulWidget {
  const AdminPrincipal({super.key});

  @override
  State<AdminPrincipal> createState() => _AdminPrincipalState();
}

class _AdminPrincipalState extends State<AdminPrincipal> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Página Principal'),
          leading: MenuWidget(),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Text('Bienvenido Administrador'),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
                  itemBuilder: (context, index){
                    return Container(
                      color: Colors.blue,
                      child: Text('Hola'),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        
      );
}
