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
