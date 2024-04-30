class DatosServer {
  // String urlServer = 'http://localhost:3000';
  String urlServer = 'https://apidevelop.reservatupista.com';

  String datosParseados(List<dynamic> listTypes) {
    List<String> newList = [];
    for (var element in listTypes) {
      newList.add(element.toString().split('.')[1]);
    }
    return newList.join(', ');
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
