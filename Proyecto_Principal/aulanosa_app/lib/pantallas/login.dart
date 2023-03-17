import 'package:aulanosa_app/alumno/menu_principal_alumno.dart';
import 'package:aulanosa_app/globals/variable_global.dart';
import 'package:aulanosa_app/objetosNecesarios/usuario.dart';
import 'package:aulanosa_app/pantallas/cambioContrasena.dart';
import 'package:aulanosa_app/pantallas/main_screen.dart';
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
String urlComprobarUsuario="http://10.0.2.2:8080/api/usuario/nombreEs/";


// Variable para guardar la contraseña de usuario que inserta el usuario //
String contrasena ="";


class Login extends StatefulWidget{
  Login2 createState() => Login2();
}


class Login2 extends State<Login>{
  //variables de tamaño de pantalla, alto y ancho//
  var size, heightA, widthA;
  final formKey = GlobalKey<FormState>();
  // Variable para guardar el nombre de usuario que insertar el usuario //
  String nombreUsuario ="";

  @override
  Widget build(BuildContext context) {
    
    //AL ENTRAR A LA CLASE, GUARDA EL TAMAÑO DE LA PANTALLA, ANCHO Y ALTO//
    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });

    return Scaffold(
      //propiedad del scaffold para evitar que al abrir el teclado todo se mueva de sitio
      resizeToAvoidBottomInset: false,

      //cuerpo principal de toda la pantalla del login
      body: Container(
        height: heightA,
        width: widthA,
        child: Column(
          children: [

            //parte superior de la pantalla con fondo azul que contiene el logo de AulaNosa
            Container(
              width: widthA,
              height: heightA*0.4,
              
              decoration: const BoxDecoration(
                color:Color.fromARGB(255, 72, 122, 216),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                        
                  //logo aulanosa
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/logo.png", width: 1123*0.25, height: 794*0.25,),
                  ),

                   SizedBox(height: heightA*0.01,),

                  //texto bienvenida
                  const Text("Bienvenidos a Aula Nosa", style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),

            //formulario donde ponemos nuestro usuario y contraseña
            Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 50),

                  //columna con el texto 'usuario' y su respectivo cuadro de texto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      //texto 'usuario'
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: const Text("Usuario", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
                      ),
              
                      Stack(
                        children: [
                          //cuadro de texto para el usuario
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 206, 206, 206),
                              borderRadius:  BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20)
                              )
                            ),
                            height: heightA*0.05,
                            width: widthA*0.7,
                          ),
                          Container(
                            width: widthA*0.6,
                            margin: EdgeInsets.only(left: widthA*0.04),
                            alignment: Alignment.center,
                            child:TextFormField(
                               style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                              decoration: const InputDecoration(
                                border: InputBorder.none
                              ),
                               onSaved: (value){
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
                          ),   
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 25,),

                  //columna con el texto 'contraseña' y su respectivo cuadro de texto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      //texto 'contraseña'
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: const Text("Contraseña", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
                      ),

                      Stack(
                        children: [
                          //cuadro de texto para la contraseña //
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 206, 206, 206),
                              borderRadius:  BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20)
                              )
                            ),
                            height: heightA*0.05,
                            width: widthA*0.7,
                          ),

                          // Campo donde rellena el usuario los datos, en este caso la contraseña //
                          Container(
                            width: widthA*0.6,
                            margin: EdgeInsets.only(left: widthA*0.04),
                            alignment: Alignment.center,
                            child:TextFormField(
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                              decoration: const InputDecoration(
                                border: InputBorder.none
                              ),
                              onSaved: (value){
                                contrasena = value!;
                              },
                              obscureText: verContrasena,
                            ),  
                          ),

                          // Container del icono del ojo para cambiar la visibilidad de la contraseña //
                          Container(
                            margin: EdgeInsets.only(left: widthA*0.59),
                            child: IconButton(
                              iconSize: 25,
                              icon: const Icon(Icons.visibility),
                              // En este onPressed llamo a la función que cambia la visibilidad de la contraseña //
                              onPressed: () {
                                visionContrasena();
                              },
                            )   
                          ) 
                        ],
                      ), 
                    ],
                  ),

                  // Espaciador entre containers //
                  const SizedBox(height: 50,),

                  //boton de iniciar sesión
                  InkWell(
                    onTap: () async {

                      // ignore: unrelated_type_equality_checks
                      // Posibilidades de vuelta de la funcion //
                      // Si devuelve true la comprobación ha sido correcta //
                      // Y se a actualizado la variable global roll para arrastrarla al resto de clases //
                      // Si devuelve false, la comprobación ha sido incorrecta //
                      // No actualiza la variable global roll y muestra una notificación al usuario por pantalla //
                      // La siguiente linea de codigo guarda los datos recogidos por teclado //
                      formKey.currentState!.save();
                      
                      // Variable para comparar el retorno (roll) de la API para enviar a una pantalla o a otra //
                      /*bool comprobarRoll= await comprobarUsuario(nombreUsuario, context);

                      if(comprobarRoll==true){
                        // MIRAR QUE NAVIGATOR HACER EN FUNCION A LA CLASE PRINCIPAL //
                        Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()),);
                      }
                      */
                      await comprobarUsuario(nombreUsuario, context);
                      if(globales.roll!=""){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()),);
                      }
                    },
                    child: Container(
                      decoration:  const BoxDecoration(
                        color: Color.fromARGB(255, 72, 122, 216),
                        borderRadius:  BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        )
                      ),
                      alignment: Alignment.center,
                      height: 60,
                      width: 200,
                      child: const Text("Iniciar sesión", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),

                  // Espaciador entre containers //
                  const SizedBox(height: 20),

                  //boton de cambio de contraseña //
                  InkWell(
                    onTap: () {
                    // Este boton llama a otra pantalla para cambiar la contraseña del usuario //
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>cambioContrasena(),));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      child: const Text("Cambiar Contraseña", style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              )
            ),
          ],
        )
      ), 
    );
  }
  // Función que varia la visibilidad de la contraseña //
  void visionContrasena(){
    setState(() {
      verContrasena=!verContrasena;
    });
    
  }

  // Método para comprobar que el usuario y la contraseña que se introduce son correctos //
  // Si son correctos guarda su roll para enviarle a una pantalla o a otra //
  // Devuelve un boleano en funcion a si esta comprobacion es positiva o no //

  Future <void> comprobarUsuario(String nombreUsuario,BuildContext context) async{
      // Variable entera que devuelvo en funcion al roll cuando la contraseña es correcta //
     

      // Parseo del url de la api a uri //
      // La concatenacion de ('${urlComprobarUsuario}'+ '${nombreUsuario}') es //
      // el url de la API el nombre de usuario que nos introduce por formulario //
       
      Uri myUri = Uri.parse('${urlComprobarUsuario}'+ '${nombreUsuario}');

      // Llamada a la api, guardo su respuesta en la variable respuestaApi //
      // para luego poder parsearla y trabajar con ella //
      final respuestaApi=await http.get(myUri);

      //
      try{
        Usuario usuarioEntrada = Usuario.devolverUsuario(respuestaApi.body);
        if(usuarioEntrada.password==contrasena){
          
          // Actualizo la variable global de roll del usuario para ahora en la siguiente ventana//
          globales.roll=usuarioEntrada.rol;
          /*
          if(usuarioEntrada.rol=="ADM"){ 
              
              print(globales.roll);
              return 1;

          // COMPROBAR COMO LE LLAMAN AL ROLL EDITOR EN LA API //
          // ESTOS ROLLES AUN NO TIENEN NOMENCLATURA //
          }else if(usuarioEntrada.rol=="editor"){
              
              return 1;
          }else if(usuarioEntrada.rol=="alumno"){
           
              return 1;
          }
          */
        }else{
          globales.roll="";
        }
      }catch(excepcion){
        print(excepcion);
        Notififcaciones().errorInicioSesion(context);

      }
        
      // RETORNA 0 EN CASO DE ERROR: SI LA CONTRASEÑA ES INCORRECTA O SI EL NOMBRE DE USUARIO NO EXISTE //
      
      
  }


  
}

