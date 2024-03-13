import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/app/routes/models/message_error.dart';
import '../../app/routes/models/usuario_model.dart';
import 'datos_server.dart';

extension on String {
  bool toBool() {
    return (toLowerCase() == "true" || toLowerCase() == "1")
        ? true
        : (toLowerCase() == "false" || toLowerCase() == "0" ? false : false);
  }
}

class UsuarioNode {
  Future<dynamic> iniciarSesion(List usuario) async {
    try {
      final url =
          Uri.parse('${DatosServer().urlServer}/usuario/iniciar_sesion');
      // Crear una solicitud multipart
      print(usuario.toString());
      var request = http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "datos": usuario,
          }));

      // Enviar la solicitud
      print("jkbsdjkbdkj");
      var response = await request;
      print(response.body);
      if (response.statusCode == 200) {
        return UsuarioModel.fromRawJson(response.body);
      } else {
        return MessageError.fromRawJson(response.body);
      }
    } catch (error, stack) {
      print('Error al usuario anadida: $error');
      print(stack);
    }
  }

  Future<bool> getUsuarioExisteNick(String nick) async {
    final url = Uri.parse('${DatosServer().urlServer}/usuario_existe_nick');
    // Crear una solicitud multipart
    var request = http.get(url, headers: {'nick': nick});

    // Enviar la solicitud
    try {
      var response = await request;
      if (response.statusCode == 200) {
        print(response.body);
        return !response.body.toBool();
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al saber si el usuario existe. Código de estado: ${response.statusCode}');
        return false;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return false;
    }
  }

  String getImageUsuarioNode(String fotoName) {
    return '${DatosServer().urlServer}/images_usuario/$fotoName.png';
  }

  Future<void> anadirUsuarioNode(List usuario) async {
    try {
      final url = Uri.parse('${DatosServer().urlServer}/usuario');
      // Crear una solicitud multipart
      print(usuario.toString());
      var request = http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "usuario": usuario,
          }));

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        print('usuario anadida correctamente');
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al usuario anadida. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al usuario anadida: $error');
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

  Future<UsuarioModel?> getUsuarioNode(String id) async {
    try {
      final url = Uri.parse('${DatosServer().urlServer}/usuario');
      // Crear una solicitud multipart
      var request = http.get(url);

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        print(response.body == '{}');
        print('get datos usuario correctamente');
        return UsuarioModel.fromRawJson(response.body);
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al usuario hgvh. Código de estado: ${response.statusCode}');
      }
    } catch (error, stack) {
      print(stack);
      print('Error al usuario kjj: $error');
    }
    return null;
  }
}
