import 'package:aulanosa_app/alumno/menu_principal_alumno.dart';
import 'package:aulanosa_app/comun/widget/keyword_closed.dart';
import 'package:aulanosa_app/comun/widget/password_text_form_field.dart';
import 'package:aulanosa_app/globals/variable_global.dart';
import 'package:aulanosa_app/objetosNecesarios/alumno.dart';
import 'package:aulanosa_app/objetosNecesarios/curso.dart';
import 'package:aulanosa_app/objetosNecesarios/usuario.dart';
import 'package:aulanosa_app/pantallas/cambioContrasena.dart';
import 'package:aulanosa_app/pantallas/main_screen.dart';
import 'package:aulanosa_app/util/metodosCompartidos.dart';
import 'package:aulanosa_app/util/notificaciones.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:aulanosa_app/globals/variable_global.dart' as globales;

// Variable para controlar la vision de la contraseña //
bool verContrasena = true;

// Variable para aceptar el inicio de sesion en función a la comprobación de contraseña //
bool contrasenaCorrecta = false;

// Variable que contiene el url del endpoint de la API para consultar usuarios por su nombre //
// Este endpoint me devuelve todo el objeto usuario de la bbdd, con su correspondiente contraseña //
// Esta contraseña es la que comparo con la contraseña introducida por el usuario por pantalla //
// Además tambien recojo la variable "roll" de la API para enviar al usuario a las páginas de admin o de alumno //
// A esta variable le concateno el nombre del usuario que estoy buscando //
String urlComprobarUsuario = "http://10.0.2.2:8080/api/usuario/nombreEs/";

// Variable que guarda la url para la direccion de la API de //
// recuperacion de datos del alumnno en funcion a su nombre de usuario//
String urlApiAlumnoDatos = "http://10.0.2.2:8080/api/alumno/usuario/";

// recuperacion de datos del curso del alumno //
String urlCursoAlumno = "http://10.0.2.2:8080/api/curso/";

// Variable para guardar la contraseña de usuario que inserta el usuario //
String contrasena = "";

class Login extends StatefulWidget {
  Login2 createState() => Login2();
}

class Login2 extends State<Login> {
  //variables de tamaño de pantalla, alto y ancho//
  var size, heightA, widthA;
  final formKey = GlobalKey<FormState>();
  //boleano que se pone a true si le hemos dado una vez al boton del login
  bool esperarLogin = false;
  // Variable para guardar el nombre de usuario que insertar el usuario //
  String nombreUsuario = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const textFormBackgroundColor = Color.fromARGB(255, 206, 206, 206);

    /* //AL ENTRAR A LA CLASE, GUARDA EL TAMAÑO DE LA PANTALLA, ANCHO Y ALTO//
    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });*/

    return Scaffold(
        //propiedad del scaffold para evitar que al abrir el teclado todo se mueva de sitio

        //cuerpo principal de toda la pantalla del login
        body: KeyboardCloser(
            child: SingleChildScrollView(
      child: Column(
        children: [
          //parte superior de la pantalla con fondo azul que contiene el logo de AulaNosa
          const _HeaderSection(),
          const SizedBox(height: 32),
          

          //formulario donde ponemos nuestro usuario y contraseña
          Form(
                key: formKey,
                child: Column(
                  children: [
                    //columna con el texto 'usuario' y su respectivo cuadro de texto
                    FractionallySizedBox(
                      widthFactor: .75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //texto 'usuario'
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Usuario",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          TextFormField(
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              fillColor: textFormBackgroundColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            onSaved: (value) {
                              nombreUsuario = value!;
                            },
                            // validator: (value) {
                            //     if(value!.isEmpty){

                            //         return 'Campo vacio';
                            //     }

                            //   if(value.length < 3){
                            //       return 'Campo no válido';
                            //     }
                            //   },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.03,
                    ),

                    //columna con el texto 'contraseña' y su respectivo cuadro de texto
                    FractionallySizedBox(
                      widthFactor: .75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //texto 'contraseña'
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Contraseña",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          PasswordTextFormField(

                            style: const TextStyle(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              fillColor: textFormBackgroundColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            onSaved: (value) {
                              contrasena = value!;
                            },
                          ),
                        ],
                      ),
                    ),

                    // Espaciador entre containers //
                    SizedBox(
                      height: size.height * 0.065,
                    ),

                    //boton de iniciar sesión
                    InkWell(
                      onTap: () async {
                        if (!esperarLogin) {
                          esperarLogin = true;
                          // ignore: unrelated_type_equality_checks
                          formKey.currentState!.save();

                          await comprobarUsuario(nombreUsuario, context);
                          globales.nombreUsuario = nombreUsuario;

                          if (globales.roll == "ALUMNO") {
                            await recuperarDatosAlumno(nombreUsuario);
                            await recuperarDatosCurso(alumnoUsuario.idCurso);

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          } else if (globales.roll == "ADMIN") {
                            await metodosCompartidos().recuperarEmpresas();
                            await metodosCompartidos().recuperarCursos();
                            await metodosCompartidos().recuperarAlumnosExternos();
                            await metodosCompartidos().recuperarAlumnos();
                            await metodosCompartidos().recuperarEstudios();
                            await metodosCompartidos().recuperarMensajes();

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          }
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 72, 122, 216),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.circular(20),
                            )),
                        alignment: Alignment.center,
                        height: size.height * 0.08,
                        width: size.width * 0.5,
                        child: const Text(
                          "Iniciar sesión",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    // Espaciador entre containers //
                    SizedBox(height: size.height * 0.025),

                    //boton de cambio de contraseña //
                    InkWell(
                      onTap: () {
                        // Este boton llama a otra pantalla para cambiar la contraseña del usuario //
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => cambioContrasena(),
                            ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: size.height * 0.065,
                        width: size.width * 0.45,
                        child: const Text(
                          "Cambiar Contraseña",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )),
        ],
      ),
    )));
  }

  // Función que varia la visibilidad de la contraseña //
  void visionContrasena() {
    setState(() {
      verContrasena = !verContrasena;
    });
  }

  // Método para comprobar que el usuario y la contraseña que se introduce son correctos //
  // Si son correctos guarda su roll para enviarle a una pantalla o a otra //
  // Devuelve un boleano en funcion a si esta comprobacion es positiva o no //

  Future<void> comprobarUsuario(
      String nombreUsuario, BuildContext context) async {
    // Variable entera que devuelvo en funcion al roll cuando la contraseña es correcta //

    // Parseo del url de la api a uri //
    // La concatenacion de ('${urlComprobarUsuario}'+ '${nombreUsuario}') es //
    // el url de la API el nombre de usuario que nos introduce por formulario //

    Uri myUri = Uri.parse('${urlComprobarUsuario}' + '${nombreUsuario}');

    // Llamada a la api, guardo su respuesta en la variable respuestaApi //
    // para luego poder parsearla y trabajar con ella //
    final respuestaApi = await http.get(myUri);

    try {
      Usuario usuarioEntrada = Usuario.devolverUsuario(respuestaApi.body);
      if (usuarioEntrada.password == contrasena) {
        // Actualizo la variable global de roll del usuario para ahora en la siguiente ventana//
        globales.roll = usuarioEntrada.rol;
      } else {
        globales.roll = "";
        Notififcaciones().contrasenaIncorrecta(context);
        esperarLogin = false;
      }
    } catch (excepcion) {
      print(excepcion);
      Notififcaciones().usuarioIncorrecto(context);
      esperarLogin = false;
    }

    // RETORNA 0 EN CASO DE ERROR: SI LA CONTRASEÑA ES INCORRECTA O SI EL NOMBRE DE USUARIO NO EXISTE //
  }

  // Método para recuperar datos del alumno //
  Future<void> recuperarDatosAlumno(String nombreUsuario) async {
    Uri myUri = Uri.parse('${urlApiAlumnoDatos}' + '${nombreUsuario}');

    // Llamada a la api, guardo su respuesta en la variable respuestaApi //
    // para luego poder parsearla y trabajar con ella //
    final respuestaApi = await http.get(myUri);

    try {
      Alumno alumnoRecuperado = Alumno.devolverAlumno(respuestaApi.body);
      alumnoUsuario.id = alumnoRecuperado.id;
      alumnoUsuario.nombre = alumnoRecuperado.nombre;
      alumnoUsuario.idCurso = alumnoRecuperado.idCurso;
      alumnoUsuario.idEmpresa = alumnoRecuperado.idEmpresa;
      alumnoUsuario.idEstudios = alumnoRecuperado.idEstudios;
      alumnoUsuario.carta = alumnoRecuperado.carta;
      alumnoUsuario.inicioPr = alumnoRecuperado.inicioPr;
      alumnoUsuario.finPr = alumnoRecuperado.finPr;
      alumnoUsuario.usuario = alumnoRecuperado.usuario;
    } catch (excepcion) {
      print(excepcion);
    }
  }

  // Método para recuperar datos del alumno //
  Future<void> recuperarDatosCurso(int idCurso) async {
    Uri myUri = Uri.parse('${urlCursoAlumno}' + '${idCurso}');

    // Llamada a la api, guardo su respuesta en la variable respuestaApi //
    // para luego poder parsearla y trabajar con ella //
    final respuestaApi = await http.get(myUri);

    try {
      Curso cursoRecuperado = Curso.devolverCurso(respuestaApi.body);
      globales.nombreCurso = cursoRecuperado.nombre;
      if (cursoRecuperado.estado == "a") {
        globales.estadoCurso = "Activo";
      } else if (cursoRecuperado.estado == "b") {
        globales.estadoCurso = "Inactivo";
      }
    } catch (excepcion) {
      print(excepcion);
    }
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 72, 122, 216),
      ),
      child: Column(
        children: [
          //logo aula nosa
          Container(
            //color: Colors.yellow,
            margin: const EdgeInsets.only(top: 10),

            height: size.height * 0.3,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo.png",
                width: size.width * 0.7,
                height: size.height * 0.3,
              ),
            ),
          ),
          //texto bienvenida
          const Text("Bienvenidos a Aula Nosa",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }
}
