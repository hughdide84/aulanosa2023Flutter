import 'package:aulanosa_app/objetosNecesarios/empresa.dart';
import 'package:http/http.dart' as http;
import 'package:aulanosa_app/globals/variable_global.dart' as globales;
String urlListaEmpresas="http://10.0.2.2:8080/api/empresa";


class metodosCompartidos{

// Método para recuperar la lista de empresas //
  Future<void> recuperarEmpresas() async {
    
    Uri myUri = Uri.parse('${urlListaEmpresas}');

    final respuestaApi = await http.get(myUri);

    try{
      globales.listaEmpresas= Empresa.devolverListaEmpresas(respuestaApi.body);
      print(globales.listaEmpresas);
      

    }catch(excepcion){
      print(excepcion);
    }
    
  }

}
