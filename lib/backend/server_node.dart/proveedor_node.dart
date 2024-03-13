import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../app/routes/models/message_error.dart';
import '../../app/routes/models/proveedor_model.dart';
import 'datos_server.dart';

class ProveedorNode {
  String getImageProveedorNode(String fotoName) {
    return '${DatosServer().urlServer}/images_proveedor/$fotoName.png';
  }

  Future<dynamic> iniciarSesion(List datos) async {
    try {
      final url =
          Uri.parse('${DatosServer().urlServer}/proveedor/iniciar_sesion');
      // Crear una solicitud multipart
      var request = http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "datos": datos,
          }));

      // Enviar la solicitud
      print("jkbsdjkbdkj");
      var response = await request;
      print(response.body);
      if (response.statusCode == 200) {
        return ProveedorModel.fromRawJson(response.body);
      } else {
        return MessageError.fromRawJson(response.body);
      }
    } catch (error, stack) {
      print('Error al proveedor anadida: $error');
      print(stack);
      return MessageError(
          message: 'Ocurrio un error intentalo mas tarde.', code: 500);
    }
  }

  Future<void> anadirProveedorNode(List proveedor) async {
    try {
      final url = Uri.parse('${DatosServer().urlServer}/proveedor');

      var request = http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "proveedor": proveedor,
          }));

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        print('proveedor anadida correctamente');
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al proveedor anadida. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al proveedor anadida: $error');
    }
  }

  Future<void> modificarUsuarioNode(
      int id, List usuario, List<String> datosModificados) async {
    try {
      final url = Uri.parse('${DatosServer().urlServer}/usuario');
      // Crear una solicitud multipart
      print(usuario.toString());
      var request = http.put(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
            "datosUsuario": usuario,
            "datosModificados": datosModificados
          }));

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        print('usuario modificado correctamente');
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al usuario modificado. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al usuario modificado: $error');
    }
  }

  Future<ProveedorModel?> getProveedorNode(String id) async {
    try {
      final url = Uri.parse('${DatosServer().urlServer}/proveedor');
      // Crear una solicitud multipart
      var request = http.get(url);

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        print(response.body == '{}');
        print('get datos Proveedor correctamente');
        return ProveedorModel.fromRawJson(response.body);
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al Proveedor hgvh. Código de estado: ${response.statusCode}');
      }
    } catch (error, stack) {
      print(stack);
      print('Error al Proveedor kjj: $error');
    }
    return null;
  }
}
