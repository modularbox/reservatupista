// ignore_for_file: constant_identifier_names
abstract final class DatosServer {
  // static const String urlServer = 'http://localhost:3000';
  static const String urlServer = 'https://apidevelop.reservatupista.com';
  static const String urlImageUsuario = '$urlServer/images_usuario';
  static const String urlImageProveedor = '$urlServer/images_proveedor';
  static const String urlImagePistas = '$urlServer/images_pista';
  static const String urlImageOnline = '$urlServer/images_online';

  static String datosParseados(List<dynamic> listTypes) {
    List<String> newList = [];
    for (var element in listTypes) {
      newList.add(element.toString().split('.')[1]);
    }
    return newList.join(', ');
  }

  static String pista(String imageName) {
    return '$urlImagePistas/$imageName.png';
  }

  static String usuario(String imageName) {
    return '$urlImageUsuario/$imageName.png';
  }

  static String proveedor(String imageName) {
    return '$urlImageProveedor/$imageName.png';
  }

  static String online(String imageName) {
    return '$urlImageOnline/$imageName.png';
  }
}

extension EnumExt on TypeDatosServerProveedor {
  String get val => toString().split('.')[1];
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
  dinero_total,
}

enum TypeDatosServerProveedor {
  id_proveedor,
  tipo,
  cif_nif,
  codigo_iban,
  certificado_cuenta,
  nombre,
  apellidos,
  fijo,
  email,
  lada,
  telefono,
  direccion_fiscal,
  localidad_fiscal,
  provincia_fiscal,
  comunidad_fiscal,
  contrasena,
  foto,
  fecha_registro,
  validate_email,
  codigo_postal_fiscal
}

enum TypeDatosServerClub {
  id_club,
  nombre,
  codigo_postal,
  direccion,
  localidad,
  provincia,
  comunidad
}

const id_usuario = 'id_usuario';
const id_reserva = 'id_reserva';
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
const dinero_pagado = 'dinero_pagado';
// Tablas reservas_pistas_usuarios
const reservas_pistas_usuarios = 'reservas_pistas_usuarios';

const id_pista = 'id_pista';
const fecha_reserva = 'fecha_reserva';
const timestamp = 'timestamp';
const hora_inicio = 'hora_inicio';
const hora_fin = 'hora_fin';
const id_tarifa = 'id_tarifa';
const id_tarifa_general = 'id_tarifa_general';
const id_tarifa_especifca = 'id_tarifa_especifca';
const coste_total_reserva = 'coste_total_reserva';
const referencia = 'referencia';
const reservas_pistas = 'reservas_pistas';
// final reservas_pistas = {
//   "id_pista": 0,
//   "fecha_reserva": "2024-04-20",
//   "timestamp": "2024-04-22 09:35:17",
//   "hora_inicio": "04:00:00",
//   "hora_fin": "04:00:00",
//   "id_tarifa": 0,
//   "id_tarifa_general": null,
//   "id_tarifa_especifca": null,
//   "coste_total_reserva": 0,
//   "referencia": 'egiauisgfui'
// };
