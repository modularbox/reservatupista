// ignore_for_file: constant_identifier_names

class DatosServer {
  // String urlServer = 'http://192.168.0.209:3000';
  // String urlServer = 'https://api.reservatupista.com';
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
  dinero_total,
}
