import 'package:aulanosa_app/alumno/menu_principal_alumno.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:aulanosa_app/pantallas/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:aulanosa_app/globals/variable_global.dart' as globales;


//Pagina AdminPrincipal de administrador
class AdminPrincipal extends StatefulWidget {
  const AdminPrincipal({super.key});

  @override
  State<AdminPrincipal> createState() => _AdminPrincipalState();
}

class _AdminPrincipalState extends State<AdminPrincipal> {
  //pantalla principal del administrador/editores

  List opciones = [
    Opcion(nombre: 'Notas', icono: Icon(Icons.checklist_rtl, size: 50), ruta: 'notas'),
    Opcion(nombre: 'Empresa', icono: Icon(Icons.business_center_sharp, size: 50), ruta: 'empresa'),
    Opcion(nombre: 'Proyecto', icono: Icon(Icons.auto_awesome_motion_sharp, size: 50), ruta: 'proyecto'),
    Opcion(nombre: 'Tutorias', icono: Icon(Icons.co_present_outlined, size: 50), ruta: 'tutorias'),
    Opcion(nombre: 'Mensajes', icono: Icon(Icons.message, size: 50), ruta: 'mensajes'),
    Opcion(nombre: 'Ajustes', icono: Icon(Icons.settings, size: 50), ruta: 'ajustes')
  ];

  //Lista vertical
  //TODO recoger datos del calendario SOLO DE LOS PROXIMOS 5 EVENTOS
  // Esto va a empezar a recoger eventos de la API cuando recuperemos los datos //
  List cartas = [
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba'),
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba'),
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba'),
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba'),
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba'),
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba'),
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba')
  ];



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
              const SizedBox(height: 16),
              const Text(
                'Bienvenido Administrador',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 72, 122, 216),
                ),
              ),

              const SizedBox(height: 4),

              //GridView para mostrar los botones de las distintas opciones
              Container(
                height: MediaQuery.of(context).size.height * 0.33,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(22),
                  
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: PrincipalAdminButtons.getListButtons().length,
                  itemBuilder: (context, index) {
                    //Sobre el gestureDetector se añade un onTap para que al pulsar el boton nos lleve a la pagina correspondiente
                    return GestureDetector(
                      onTap: () {
                        //print('Tapped on item ' +PrincipalAdminButtons.getListButtons()[index].nombre);
              globales.redireccion = PrincipalAdminButtons.getListButtons()[index].ruta;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyApp(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              PrincipalAdminButtons.getListButtons()[index].color,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.black)
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              PrincipalAdminButtons.getListButtons()[index].nombre,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
              margin: EdgeInsets.all(5),
              child: Text('PRÓXIMOS EVENTOS',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
            ),

            //Lista con cada una de las cartas de evento construidas con un builder
            //A la espera de poder recoger datos que nos indiquen los próximos eventos
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *0.6,
              child: ListView.builder(
                    itemCount: cartas.length,
                    itemBuilder:((context,index){
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.black, width: 2)
                        ),
                        child: Row(
                          children: [

                            //Dia y mes
                            Container(
                              width: MediaQuery.of(context).size.width*0.2,
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(cartas[index].dia + '\n' + cartas[index].mes,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),)
                                ),
                            ),
                              )
                            ),
                            
                            //Descripcion
                            Container(
                              height: MediaQuery.of(context).size.height *0.1,
                              width: MediaQuery.of(context).size.width*0.6,
                              margin: EdgeInsets.all(5),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(cartas[index].descripcion,
                                textAlign: TextAlign.center,
                                  )
                                ),
                            ),

                            //Icono tipo calendario
                            Container(
                              margin: EdgeInsets.all(5),
                              child: FittedBox(
                                child: Icon(Icons.calendar_month,
                                
                                  color: Color.fromARGB(255, 72, 122, 216)
                                  ),
                              ),
                            ) 
                          ],
                        ),
                      );
                    }
                    
                    )
                    
                  ),
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
//Construcyor
  PrincipalAdminButtons(this.nombre, this.ruta, this.color);

  //variable que almacena el nombre que aparecerá en el boton
  final String nombre;
  //variable que almacena la ruta de la pagina a la que nos lleva el boton
  final String ruta;

  final Color color;

  //Lista de botones que se mostrarán en la pagina principal
  static List<PrincipalAdminButtons> getListButtons() {
    return <PrincipalAdminButtons>[
    
      PrincipalAdminButtons(
          'Empresa','Empresas', Color.fromARGB(255, 72, 122, 216)),
      PrincipalAdminButtons(
          'Alumnos', 'Alumnos', Color.fromARGB(255, 72, 122, 216)),
      
      PrincipalAdminButtons('Proyectos', 'Proyectos',
          Color.fromARGB(255, 72, 122, 216)),
      PrincipalAdminButtons('Alumnos externos', 'Alumnos externos',
          Color.fromARGB(255, 72, 122, 216)),
      PrincipalAdminButtons(
          'Cursos', 'Cursos', Color.fromARGB(255, 72, 122, 216)),
    ];
  }
}



