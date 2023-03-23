import 'package:aulanosa_app/globals/variable_global.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:aulanosa_app/util/metodosCompartidos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aulanosa_app/globals/variable_global.dart' as globales;

//Pagina para editar/mostrar AdminProyectos
class AdminProyectos extends StatefulWidget {
  const AdminProyectos({super.key});

  @override
  State<AdminProyectos> createState() => _AdminProyectosState();
}

class _AdminProyectosState extends State<AdminProyectos> {

   //variables de tamaño de pantalla, alto y ancho//
  var size, heightA, widthA;
  //String? cicloElegido = '2ºDAM';

  @override
  Widget build(BuildContext context){

    //AL ENTRAR A LA CLASE, GUARDA EL TAMAÑO DE LA PANTALLA, ANCHO Y ALTO//
    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });


    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Gestión Proyectos'),
      leading: MenuWidget(),
    ),
       body: Container(
        width: widthA,
        height: heightA,
        child: Column(
          
          children: [

            //listview de los ciclos en si
            Align(
              alignment: Alignment.center,
              child: Container(
                width: widthA,
                height: heightA * 0.05,
                margin: EdgeInsets.all(5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listaEstudios.length,
                  itemBuilder: ((context, index) {
                    return TextButton(
                      onPressed:(() {
                       print(listaEstudios[index]);
                      }),
                      child: Text(globales.listaEstudios[index].nombre)
                      );
                      })    
                )
            ),
            ),

            Divider(
              thickness: 5,
            ),

            //LISTVIEW DE TODOS LOS AÑOS
            Container(
              width: widthA,
              height: heightA * 0.78,
              child: 
                ListView.builder(
                  itemCount: listaCursosProyecto.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Color.fromARGB(255, 48, 92, 174),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ExpansionTile(
                              //COLOCAR AQUI CADA CURSO RECIBIDO DE LA API QUE REALICE PROYECTOS//
                              title: Text(listaCursosProyecto[index].nombre,
                               style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                               textAlign: TextAlign.center),
                              leading: Icon(Icons.arrow_drop_down_outlined),
                              trailing: Icon(Icons.arrow_drop_down_outlined),
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: globales.listaAlumnosExternos.length,
                                    itemBuilder: ((context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(left: 2, top: 5, right: 2),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2
                                          )
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                              dialogoEmergente(context);
                                          },
                                          child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          // AQUI VA EL NOMBRE DEL ALUMNO //
                                          child: Text(globales.listaAlumnosExternos[index].nombre,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24
                                          ),
                                          ),
                                        ),
                                        )
                                      );
                                    }) 
                                    ),
                                )
                              ],
                              ),
                              
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              
            ),
            /*
             Container(
                width: 20,
                height: 20,
                color: Colors.blue,
                child:IconButton(

                onPressed: ()async{
                  
                    await metodosCompartidos().recuperarAlumnos();
                
                  
                      },
                  icon: Icon(Icons.abc)) ,)
                  */
          ],
        ),
      )
    );
    
  }
    

 
}


void dialogoEmergente(BuildContext context){

  Widget botonOk = TextButton(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(
        Color.fromARGB(255, 48, 92, 174)
      )
    ),
    onPressed: (() {
      Navigator.of(context).pop();
    }),
    child: Text('OK',
      style: TextStyle(
        color: Colors.white
      )
    )
    );

    AlertDialog ventanaEmergente = AlertDialog(
      content: Text('La información del proyecto de un alumno'),
      actions: [botonOk],
    );
    
    showDialog(
      context: context,
      builder: (BuildContext context){
        return ventanaEmergente;
      }
    );


}



// Align(
                  //   alignment: Alignment.center,
                  //   child: DropdownButton<String>(
                  //     value: cicloElegido,
                  //     items: ciclos.map((item) => DropdownMenuItem(
                  //       value: item,
                  //       child: Text(item)))
                  //         .toList(),
                  //       onChanged: ((item) => setState (() => cicloElegido = item)),
                  //   ),
                  // ),