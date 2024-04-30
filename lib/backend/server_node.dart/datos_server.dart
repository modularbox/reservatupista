// ignore_for_file: constant_identifier_names

class DatosServer {
  // String urlServer = 'http://192.168.1.134:3000';
  String urlServer = 'https://apidevelop.reservatupista.com';

  String datos(List<TypeDatosServer> listTypes) {
    List<String> newList = [];
    for (var element in listTypes) {
      newList.add(element.toString().substring('TypeDatosServer.'.length));
    }
    return newList.join(', ');
  }
}

enum TypeDatosServer {
  id_usuario,
  nombre,
  apellidos,
  sexo,
  DNI,
  lada,
  telefono,
  email,
  empadronamiento,
  comunidad_de_vecinos,
  direccion,
  codigo_postal,
  localidad,
  provincia,
  comunidad,
  nick,
  nivel,
  posicion,
  marca_pala,
  modelo_pala,
  juegos_semana,
  contrasena,
  foto,
  fecha_registro,
  validate_email,
  dinero_total
}

const id_usuario = 'id_usuario';
const nombre = 'nombre';
const apellidos = 'apellidos';
const sexo = 'sexo';
const DNI = 'DNI';
const lada = 'lada';
const telefono = 'telefono';
const email = 'email';
const empadronamiento = 'empadronamiento';
const comunidad_de_vecinos = 'comunidad_de_vecinos';
const direccion = 'direccion';
const codigo_postal = 'codigo_postal';
const localidad = 'localidad';
const provincia = 'provincia';
const comunidad = 'comunidad';
const nick = 'nick';
const nivel = 'nivel';
const posicion = 'posicion';
const marca_pala = 'marca_pala';
const modelo_pala = 'modelo_pala';
const juegos_semana = 'juegos_semana';
const contrasena = 'contrasena';
const foto = 'foto';
const fecha_registro = 'fecha_registro';
const validate_email = 'validate_email';
const dinero_total = 'dinero_total';
