// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_import, annotate_overrides, unused_import

import 'package:animate_do/animate_do.dart';
import 'package:aulanosa_app/objetosNecesarios/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

//Pagina de mensajeria del alumno
class Mensajeria_alumno extends StatefulWidget {
  Mensajeria_alumno2 createState() => Mensajeria_alumno2();
}

class Mensajeria_alumno2 extends State<Mensajeria_alumno> {
  var size, heightA, widthA;

  bool correoActivo = false;
  

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 48, 92, 174),
      title: Text('Mensajeria'),
      leading: MenuWidget(),
    ),
    body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: cuerpoMensajeria(),
    )

  );

  Widget cambioCuerpo(){
    if(!correoActivo){
      return cuerpoMensajeria();
    }else{
      return cuerpoCorreo();
    }
  }

  Widget cuerpoMensajeria(){
    return Container(

      color: Color.fromARGB(255, 233, 233, 233),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: Stack(
        children: [

          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text("RECIBIDOS", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ),

              
            ],

          ),

          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                setState(() {
                  correoActivo = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 48, 92, 174),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(bottom: 20, right: 20),
                height: (MediaQuery.of(context).size.height)*0.1,
                width: (MediaQuery.of(context).size.width)*0.4,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                  children: [
                    Icon(Icons.email_outlined, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Redactar", style: TextStyle(color: Colors.white, fontSize: 16),)
                  ],
                ),
              ),
            )
          ),

          cuerpoCorreo()
        ],
      ),

    );
  }

  Widget cuerpoCorreo(){
    if(correoActivo){
      return SlideInUp(
        duration: Duration(milliseconds: 130),
        from: MediaQuery.of(context).size.height,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 207, 207, 207),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //Center Column contents horizontally,
            children: [

              InkWell(
                onTap: () {
                  setState(() {
                    correoActivo = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(Icons.clear_outlined, color: Colors.black, size: 30,),
                ),
              ),

              Column(
                
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Text("Para", style: TextStyle(fontSize: 17),),
                      )
                    ],
                  ),

                  Divider(
                    thickness: 2,
                  ),

                  Row(
                    children:  [
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Text("De", style: TextStyle(fontSize: 17),),
                      )
                    ],
                  ),

                  Divider(
                    thickness: 2,
                  ),
                  
                  Row(
                    children:  [
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Text("Asunto", style: TextStyle(fontSize: 17),),
                      )
                    ],
                  ),

                  Divider(
                    thickness: 2,
                  ),
                ],
              ),


              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(top:20, left: 10),
                  child: Text("Escribe tu correo", style: TextStyle(fontSize: 15),),
                ),
              ),

             


              Align(
                alignment: Alignment.center,
                child: Container(
                  width: (MediaQuery.of(context).size.width)*0.95,
                  child: TextField(

                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              )


              // Container(
              //   margin: EdgeInsets.only(top: 10),
              //   decoration: const BoxDecoration(
              //     boxShadow: <BoxShadow>[
              //       BoxShadow(
              //         color: Colors.black54,
              //         blurRadius: 6.0,
              //         offset: Offset(0.0, 0.75)
              //       )
              //     ],
              //     color: Colors.white
              //   ),
              //   height:(MediaQuery.of(context).size.height)*0.3,
              //   width: (MediaQuery.of(context).size.width)*0.95,   
              // )
            ],
          ),
        ),
      );
    }else{
      return Container(

      );
    }
  }
  
}