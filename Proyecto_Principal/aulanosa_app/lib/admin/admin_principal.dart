import 'package:aulanosa_app/admin/admin_alumnos.dart';
import 'package:aulanosa_app/admin/admin_alumnos_externos.dart';
import 'package:aulanosa_app/admin/admin_crear_usuario.dart';
import 'package:aulanosa_app/admin/admin_cursos.dart';
import 'package:aulanosa_app/admin/admin_empresa.dart';
import 'package:aulanosa_app/admin/admin_productos.dart';
import 'package:aulanosa_app/admin/admin_proyectos.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';

//Pagina AdminPrincipal de administrador
class AdminPrincipal extends StatefulWidget {
  const AdminPrincipal({super.key});

  @override
  State<AdminPrincipal> createState() => _AdminPrincipalState();
}

class _AdminPrincipalState extends State<AdminPrincipal> {
  //pantalla principal del administrador/editores

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 72, 122, 216),
        title: const Text('Aula Nosa (provisional)'),

        //Botón que nos abre el Drawer común en todas las clases
        leading: MenuWidget(),
      ),
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 32),
              const Text(
                'Bienvenido Administrador',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 72, 122, 216),
                ),
              ),

              const SizedBox(height: 32),

              //GridView para mostrar los botones de las distintas opciones
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
                  //Sobre el gestureDetector se añade un onTap para que al pulsar el boton nos lleve a la pagina correspondiente, la página está definida en la clase PrincipalAdminButtons
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PrincipalAdminButtons.getListButtons()[index]
                                  .ruta,
                        ),
                      );
                    },
                    //Container que contiene el boton, 
                    child: Container(
                      decoration: BoxDecoration(
                        //se le define el color llamando a la clase PrincipalAdminButtons y su variable color
                        color: PrincipalAdminButtons.getListButtons()[index].color,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 72, 122, 216),
                              blurRadius: 15,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      //se añade el texto del boton
                      child: Center(
                        child: Text(
                          //se define el texto llamando a la clase PrincipalAdminButtons y su variable nombre
                          PrincipalAdminButtons.getListButtons()[index].nombre,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18.0,
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

//Clase para crear los botones de la pagina principal
class PrincipalAdminButtons {
  //variable que almacena el nombre que aparecerá en el boton
  final String nombre;
  //variable que almacena la ruta de la pagina a la que nos lleva el boton
  final Widget ruta;

  final Color color;

  PrincipalAdminButtons(this.nombre, this.ruta, this.color);

  //Lista de botones que se mostrarán en la pagina principal
  static List<PrincipalAdminButtons> getListButtons() {
    return <PrincipalAdminButtons>[
      PrincipalAdminButtons('Añadir Usuarios', const CrearUsuarios(), Color.fromARGB(204, 33, 149, 243)),
      PrincipalAdminButtons('Empresa', const AdminEmpresa(), Color.fromARGB(204, 33, 149, 243)),
      PrincipalAdminButtons('Alumnos', const AdminAlumnos(), Color.fromARGB(204, 33, 149, 243)),
      PrincipalAdminButtons('Productos', const AdminProductos(), Color.fromARGB(204, 33, 149, 243)),
      PrincipalAdminButtons('Proyectos', const AdminProyectos(), Color.fromARGB(204, 33, 149, 243)),
      PrincipalAdminButtons('Alumnos externos', const AlumnosExternos(), Color.fromARGB(204, 33, 149, 243)),
      PrincipalAdminButtons('Cursos', const AdminCursos(), Color.fromARGB(204, 33, 149, 243)),
    ];
  }
}
