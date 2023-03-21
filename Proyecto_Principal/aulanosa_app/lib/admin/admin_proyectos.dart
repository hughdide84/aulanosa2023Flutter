import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


//Pagina para editar/mostrar AdminProyectos
class AdminProyectos extends StatefulWidget {
  const AdminProyectos({super.key});

  @override
  State<AdminProyectos> createState() => _AdminProyectosState();
}

class _AdminProyectosState extends State<AdminProyectos> {

   //variables de tamaño de pantalla, alto y ancho//
  var size, heightA, widthA;
  List<String>anhoCursos = ['2023', '2022', '2021', '2020', '2019', '2018', '2017', '2016', '2015'];
  List<String>ciclos = ['2ºDAM', '2ºDAW', '2ºCM'];
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

            Align(
              alignment: Alignment.center,
              child: Container(
                width: widthA,
                height: heightA * 0.05,
                margin: EdgeInsets.all(5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ciclos.length,
                  itemBuilder: ((context, index) {
                    return TextButton(
                      onPressed:(() {
                       print(ciclos[index]);
                      }),
                      child: Text(ciclos[index])
                      );
                      })    
                )
              
            ),
            ),

            Divider(
              thickness: 5,
            ),

            Container(
              width: widthA,
              height: heightA * 0.78,
              child: 
                ListView.builder(
                  itemCount: anhoCursos.length,
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
                              title: Text(anhoCursos[index],
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
                                    itemCount: 20,
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
                                            setState(() {
                                              dialogoEmergente(context);
                                            });
                                          },
                                          child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text('ALUMNO',
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
                              )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              
            ),
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

class ListaProyectos {
  
  ListaProyectos(this.documento, this.presentacion, this.notaDoc, this.notaPres, this.notaFinal);

final String documento;
final String presentacion;
final int notaDoc;
final int notaPres;
final int notaFinal;



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