import 'package:aulanosa_app/alumno/screem_calendario_alumno.dart';
import 'package:aulanosa_app/objetosNecesarios/alumno.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:aulanosa_app/pantallas/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aulanosa_app/globals/variable_global.dart' as globales;
import 'package:http/http.dart' as http;

class AlumnoPrincipal extends StatefulWidget {
  const AlumnoPrincipal({super.key});

  @override
  State<AlumnoPrincipal> createState() => _AlumnoPrincipalState();
}



Alumno alumnoUsuario = Alumno(
    id: 0, idCurso: 0, idEmpresa: 0, idEstudios: 0, cv: 'hola', nombre: 'Prueba', carta: 'hola', finPr: DateTime.parse('2023-03-20T10:27:09.798Z'), inicioPr: DateTime.parse('2023-03-20T10:27:09.798Z'),
);


class _AlumnoPrincipalState extends State<AlumnoPrincipal> {

  //variables de tamaño de pantalla, alto y ancho//
  var size, heightA, widthA;


  //LISTAS DE ELEMENTOS SCROLLEABLES//
  //Lista horizontal
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
    Carta(dia: '03', mes: 'MAR', descripcion: 'Una descripcion de prueba')
  ];


  @override
  Widget build(BuildContext context) {

    //AL ENTRAR A LA CLASE, GUARDA EL TAMAÑO DE LA PANTALLA, ANCHO Y ALTO//
    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });


    return Scaffold(
      
      //appBar que contiene el titulo de la pagina y el boton para abrir el drawer
      appBar: AppBar(
        title: Text('Página principal'),
        backgroundColor: Color.fromARGB(255, 48, 92, 174),
        leading: MenuWidget(),
      ),

      //Container general
      body: Container(
        height: heightA,
        width: widthA,
        child: Column(
          children: [
            
            //Container superior azul, foto y datos del alumno
            Container(
              height: heightA * 0.25,
              width: widthA,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 72, 122, 216),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
              child: Row(
                children: [

                  //REVISAR ALTO, ANCHO Y MARGEN PARA SUSTITUIRLO POR TAMAÑOS REFERENCIADOS AL MEDIAQUERY//

                  Container(
                    height: 130,
                    width: 130,
                    margin: EdgeInsets.only(left: widthA * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(65)
                    ),

                    //TODO
                    //Foto en un futuro editable
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.add_a_photo_outlined,
                        color: Colors.white,
                        size: 50)
                    )
                  ),

                  //TODO cambiarlos por valores retornados de la api
                  //Datos del usuario
                  Container(
                    height: 200,
                    width: widthA*0.54,
                    margin: EdgeInsets.all(15),
                    // color: Colors.lightBlue[100],
                    child: Column(
                      
                      children: [

                        SizedBox(height: heightA * 0.035),

                        Text(alumnoUsuario.nombre,
                          style: TextStyle(
                            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(height: heightA * 0.035),
                        /* 
                        Text('PLACEHOLDER_APELLIDOS',
                          style: TextStyle(
                            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold
                          ),
                        ),
                          */
                        SizedBox(height: heightA * 0.035),

                        Row(
                          children: [

                            SizedBox(width: widthA * 0.02),

                            Text(globales.nombreCurso),

                            SizedBox(width: widthA * 0.2),

                            Text(globales.estadoCurso)
                          ],
                        )
                      ],
                    ),
                  ),

                ],
 
              ),
            ),

            //Container que equivale a una zona en base a la altura de la pantalla que contiene una lista horizontal de opciones 
            Container(
              margin: EdgeInsets.all(8),
              height: heightA*0.2,
              width: widthA,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                //control de tamaño y espaciado de los elementos del scroll horizontal
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 225,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
                itemCount: opciones.length,
                itemBuilder: ((_, index) {
                  //este container es cada una de las opciones que podemos pulsar desde el perfil principal
                  return GestureDetector(
                    onTap: () {

                      globales.redireccion = opciones[index].ruta;
                      Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));
                      
                    },
                    child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2
                      )
                    ),
                    
                    //icono y texto dentro del cuadrado
                    child: Column(
                      children: [
                        SizedBox(height: 20),

                        Container(
                          height: 80,
                          width: 80,
                          child: opciones[index].icono,
                        ),

                        SizedBox(height: 10),

                        Text(opciones[index].nombre),

                      ],
                    ),
                  ),
                  );
                })),
            ),

            //Division opciones scroll horizontal / Eventos scroll vertical
            Divider(thickness: 5,),

            Container(
              margin: EdgeInsets.all(5),
              child: Text('PRÓXIMOS EVENTOS',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
            ),

            //Lista con cada una de las cartas de evento construidas con un builder
            //A la espera de poder recoger datos que nos indiquen los próximos eventos
            Container(
              width: widthA,
              height: heightA*0.25,
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
                              width: widthA*0.2,
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                              height: heightA*0.1,
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
                              height: heightA*0.1,
                              width: widthA*0.6,
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
                              child: Icon(Icons.calendar_month,
                                size: 40,
                                color: Color.fromARGB(255, 72, 122, 216)
                                ),
                            ) 
                          ],
                        ),
                      );
                    }
                    
                    )
                    
                  ),
                ),

                //TODO cambiarlo por algo mas visualmente atractivo
                //Boton para ver la pagina del calendario
                Container(
                  height: heightA*0.05,
                  margin: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 72, 122, 216)
                          ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ))
                      ),
                      onPressed: (){
                        
                        globales.redireccion="calendario";
                        Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: Text('Ver calendario completo',
                        style: TextStyle(
                          color: Colors.white
                        ),)),
                  )
                )
              ]
            ),

          
        ),
      );
    
  }
  
  // @override
  // Future<void> initState() async {
  //   // TODO: implement initState
  //   recuperarDatosAlumno(globales.nombreUsuario);
  //   super.initState();
  // }
  

  // // Método para recuperar datos del alumno //
  // Future<void> recuperarDatosAlumno(String nombreUsuario) async{

  //   Uri myUri = Uri.parse('${urlApiAlumnoDatos}'+'${nombreUsuario}');

  //       // Llamada a la api, guardo su respuesta en la variable respuestaApi //
  //     // para luego poder parsearla y trabajar con ella //
  //     final respuestaApi=await http.get(myUri);
     
  //     try{
  //       Alumno alumnoRecuperado = Alumno.devolverAlumno(respuestaApi.body);
  //       alumnoUsuario.id=alumnoRecuperado.id;
  //       alumnoUsuario.nombre= alumnoRecuperado.nombre;
  //       alumnoUsuario.idCurso= alumnoRecuperado.idCurso;
  //       alumnoUsuario.idEmpresa= alumnoRecuperado.idEmpresa;
  //       alumnoUsuario.idEstudios=alumnoRecuperado.idEstudios;
  //       alumnoUsuario.carta=alumnoRecuperado.carta;
  //       alumnoUsuario.inicioPr=alumnoRecuperado.inicioPr;
  //       alumnoUsuario.finPr=alumnoRecuperado.finPr;
  //       alumnoUsuario.usuario=alumnoRecuperado.usuario;
        

  //     }catch(excepcion){

  //       print(excepcion);
  //       print("NO SE HAN RECUPERADO LOS DATOS DEL ALUMNO");
      

  //     }
      

  // }
  
}

//CLASES QUE DEFINEN LOS ELEMENTOS DE AMBAS LISTAS//

//Lista vertical
class Carta{
  String dia;
  String mes;
  String descripcion;

  Carta(
    {required this.dia,
    required this.mes,
    required this.descripcion}
  );
}

//Lista horizontal
class Opcion{
  String nombre;
  Icon icono;
  String ruta;

  Opcion(
    {required this.nombre,
    required this.icono,
    required this.ruta}
  );
}