import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  Login2 createState() => Login2();
}

class Login2 extends State<Login>{
  var size, heightA, widthA;
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {

    setState(() {
      size = MediaQuery.of(context).size;
      heightA = size.height;
      widthA = size.width;
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: heightA,
        width: widthA,

        child: Column(

          children: [
            Container(
              width: widthA,
              height: heightA*0.3,
              color: Colors.blue,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/logo.png", width: 1123*0.3, height: 794*0.3,),
              ),
            ),

            Container(
              width: widthA,
              height: heightA*0.7,
              //color: Colors.blue,
              child: Form(
                key: formKey,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(height: 50,),

                    Text("Usuario"),
                    TextFormField(

                    ),

                    SizedBox(height: 50,),

                    Text("Contraseña"),
                    TextFormField(

                    ),

                    SizedBox(height: 50,),

                    InkWell(
                      onTap: () {
                        
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 200,
                        color: Colors.grey,
                        child: Text("Iniciar sesión"),
                      ),
                    ),
                  ],
                )
              ),
            ),


          ],

        )
      ),

      
    );
  }
}