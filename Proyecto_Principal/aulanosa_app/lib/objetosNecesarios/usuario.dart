import 'dart:convert';

// Clase que contiene el objeto usuario con los métodos para pasar de Json a usuario y de usuario a Json //

/*
Con esto puedo parsear de Usuario a Json y de Json a Usuario
*/
Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

List<Usuario> usuariosFromJson(String str) =>
    List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String usuarioToJson(Usuario data) => json.encode(data.toJson());


class Usuario {
    Usuario({
        required this.id,
        required this.nombre,
        required this.password,
        required this.email,
        required this.rol,
    });
    
    int id;
    String nombre;
    String password;
    String email;
    String rol;


  // Métodos para devolver objetos usuario pasandole el string que formateo desde el json de la api //
  static Usuario devolverUsuario(String datos){
    return usuarioFromJson(datos);
  } 

  static List<Usuario> devolverListaUsuarios(String datos){
    return  usuariosFromJson(datos);
  } 

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nombre: json["nombre"],
        password: json["password"],
        email: json["email"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "password": password,
        "email": email,
        "rol": rol,
    };
}