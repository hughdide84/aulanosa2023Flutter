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
  var size, heightA, widthA;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 72, 122, 216),
        title: Text('Página Principal'),
        leading: MenuWidget(),
      ),
      backgroundColor: Color.fromARGB(255, 233, 233, 233),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 32),
              Container(
                child: Text('Bienvenido Administrador',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 72, 122, 216),
                ),
                ),
                ),
              
              SizedBox(height: 32),
              GridView.builder(
                padding: const EdgeInsets.all(8),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: PrincipalAdminButtons.getListButtons().length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                     onTap: () {
                      print('Tapped on item '+PrincipalAdminButtons.getListButtons()[index].nombre);
                      } ,
                    child: Container(
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 72, 122, 216),
                              blurRadius: 15,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: Center(
                        child: Text(
                          PrincipalAdminButtons.getListButtons()[index].nombre,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrincipalAdminButtons {

final String nombre;
  final String ruta;

  PrincipalAdminButtons(this.nombre, this.ruta);

  static List<PrincipalAdminButtons> getListButtons() {
    return <PrincipalAdminButtons>[

      PrincipalAdminButtons('Añadir Usuarios' ,''),
      PrincipalAdminButtons('Empresa' ,''),
      PrincipalAdminButtons('Alumnos' ,''),
      PrincipalAdminButtons('Productos' ,''),
      PrincipalAdminButtons('Proyectos' ,''),
      PrincipalAdminButtons('Alumnos externos' ,''),
      PrincipalAdminButtons('Cursos' ,''),



    ];

  }

}
