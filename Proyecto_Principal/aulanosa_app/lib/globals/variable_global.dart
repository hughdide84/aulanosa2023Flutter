// Variable global que transporta entre clases la información del roll del usuario //
import 'package:aulanosa_app/objetosNecesarios/alumno.dart';
import 'package:aulanosa_app/objetosNecesarios/alumnos_externos.dart';
import 'package:aulanosa_app/objetosNecesarios/curso.dart';
import 'package:aulanosa_app/objetosNecesarios/empresa.dart';
import 'package:aulanosa_app/objetosNecesarios/estudio.dart';
import 'package:aulanosa_app/objetosNecesarios/mensaje.dart';

String roll="";

bool inicializado=false;


String redireccion="";

// Variable para guardar el nombre de usuario //
String nombreUsuario ="";

// Variable para guardar el nombre del curso del alumno //
String nombreCurso="";

// Variable que guarda el estado del curso //
String estadoCurso="Sin Info";


// Variable global que contiene la lista de empresas //
late List<Empresa> listaEmpresas;


// Variable global que contiene la lista de alumnos externos //
late List<AlumnoExterno> listaAlumnosExternos;

// Variable global que contiene la lista de alumnos //
late List<Alumno> listaAlumnos;

// Variable global que contiene la lista de cursos //
late List<Curso> listaCursos;
late List<Curso> listaCursosProyecto;

// Variable para los nombres de los cursos //
//late List<String> listaNombresCurso;

// Variable global que contiene la lista de estudios //
late List<Estudio> listaEstudios;

// Variable para los nombres de los estudios //
//late List<String> listaNombresEstudio;

// Variable para el id de Usuario 
late int idUsuario;

// Variable para guardar el idCurso
late int idCurso;

// Variable para guardar el idEstudio
late int idEstudio;


// Variable mensaje que va a ser placeholder //
Mensaje mensaje = Mensaje(id:0, idUsuario: 0, asunto: "Default", texto: "Default", fecha: DateTime.now());
// Variable para mensajes 
List<Mensaje>listaMensajes=[
  mensaje,
  mensaje,
  mensaje,
];
