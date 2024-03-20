// ignore_for_file: constant_identifier_names

class DatosServer {
  // String urlServer = 'http://192.168.1.134:3000';
  String urlServer = 'https://api.reservatupista.com';

  String datos(List<TypeDatosServer> listTypes) {
    List<String> newList = [];
    for (var element in listTypes) {
      newList.add(element.toString().substring('TypeDatosServer.'.length));
    }
    return newList.join(', ');
  }

  String datosProveedor(List<TypeDatosServerProveedor> listTypes) {
    List<String> newList = [];
    for (var element in listTypes) {
      newList.add(
          element.toString().substring('TypeDatosServerProveedor.'.length));
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

enum TypeDatosServerProveedor {
  id_proveedor,
  tipo,
  cif_nif,
  direccion_fiscal,
  localidad_fiscal,
  provincia_fiscal,
  comunidad_fiscal,
  codigo_iban,
  certificado_cuenta,
  nombre,
  apellidos,
  fijo,
  email,
  lada,
  telefono,
  nombre_comercial,
  direccion,
  localidad,
  provincia,
  comunidad,
  contrasena,
  foto,
  fecha_registro,
  codigo_postal_fiscal,
  validate_email,
  codigo_postal,
}
