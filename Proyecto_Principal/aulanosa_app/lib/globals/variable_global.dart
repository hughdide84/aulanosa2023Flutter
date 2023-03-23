// Variable global que transporta entre clases la información del roll del usuario //
import 'package:aulanosa_app/objetosNecesarios/alumno.dart';
import 'package:aulanosa_app/objetosNecesarios/alumnos_externos.dart';
import 'package:aulanosa_app/objetosNecesarios/curso.dart';
import 'package:aulanosa_app/objetosNecesarios/empresa.dart';
import 'package:aulanosa_app/objetosNecesarios/estudio.dart';

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

// Variable global que contiene la lista de cursos //
late List<Curso> listaCursos;
late List<Curso> listaCursosProyecto;

// Variable para los nombres de los cursos //
//late List<String> listaNombresCurso;

// Variable global que contiene la lista de estudios //
late List<Estudios> listaEstudios;

// Variable para los nombres de los estudios //
//late List<String> listaNombresEstudio;

// Variable para el id de Usuario 
late int idUsuario;

// Variable para guardar el idCurso
late int idCurso;

// Variable para guardar el idEstudio
late int idEstudio;

// Variables previas a la actualizacion de datos en la lista de alumnos //
// HECHO ASI PARA EVITAR LA CARGA DE TANTA INFORMACION EN EL LOGIN // 
// ESTA PARTE HA QUEDADO SIN HACER GRACIAS A LOS CAMBIOS DE WPF EN LA API //
// Variables default para curso, empresa y estudios //
Curso curso = Curso(id: 0,estado: 'a', inicio: DateTime.now() , fin: DateTime.now() ,nombre: "default");

Empresa empresa = Empresa (id: 0,idCurso: 1,idEstudios: 0,tutor1: "default",tutor2: "default",tutor3: "default",cif: "000000",direccionSocial: "default",nombre: "default",planIndividual: "default",contacto: "default",representante: "default",convenio: "default",direccionTrabajo: "default",hojaActividades: "default");

Estudios estudios = Estudios(id: 0,nombre: "default",fct: true,pext:true );

Alumno alumno1 = Alumno(carta: "a", curso: curso,empresa:empresa,idCurso: 0,idEmpresa: 0,idEstudios: 0,nombre: "default",estudios: estudios,cv: "default",finPr: DateTime.now(),id: 0,inicioPr: DateTime.now(),usuario: "default");


// Variable que recupera una lista de alumnos //
  List <Alumno> listaAlumnos= [
    alumno1,
    alumno1,
    alumno1,
  ];

// ESTO ES UNA "COSITA xd" QUE PIDIO EL EQUIPO DEL WPF Y NOS HEMOS TENIDO QUE ADAPTAR, BASICAMENTE DENTRO DE ALUMNO
// METEN 3 OBJETOS MAS Y SUERTE PARA EL RESTO QUE TRABAJAMOS CONTRA LA API, GRACIAS :) //







