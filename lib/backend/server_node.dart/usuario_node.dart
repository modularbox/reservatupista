import 'dart:convert';
import 'package:get/get_connect/connect.dart';
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

class UsuarioProvider extends GetConnect {
  late String _token;
  final url = DatosServer().urlServer;
  UsuarioProvider() {
    _initialize(); // Llama al método _initialize en el constructor
  }

  Future<void> _initialize() async {
    // Llama a una función asíncrona para obtener el token
    // _token = await _getTokenFromServer();
  }
  // Get request
  Future<Response> getUser(int id) => get('http://youapi/users/$id');
  // Get request
  Future<Response> deleteUser(String id, String token, String user) =>
      delete('$url/$user',
          headers: {"Authorization": "Bearer $token", 'id$user': id});
}

class UsuarioNode {
  final usuarioProvider = UsuarioProvider();
  Future<dynamic> delete(String id, String token, String user) async {
    try {
      var response = await usuarioProvider.deleteUser(id, token, user);
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print('Error al eliminar la cuenta: $error');
      print(stack);
      return MessageError(message: 'Error al Eliminar la Cuenta', code: 501);
    }
  }

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
      var response = await request;
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return UsuarioModel.fromRawJson(response.body);
      } else {
        return MessageError.fromRawJson(response.body);
      }
    } catch (error, stack) {
      print('Error al iniciar Sesion: $error');
      print(stack);
      return MessageError(message: 'Error al Iniciar Sesion', code: 501);
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

  Future<UsuarioModel?> getUsuario(
      int id, String token, List<TypeDatosServer> listTypes) async {
    try {
      final url = Uri.parse('${DatosServer().urlServer}/usuario/datos');
      print(token);
      print(DatosServer().datos(listTypes));
      // Crear una solicitud multipart
      final response = await http.get(url, headers: {
        "Authorization": "Bearer $token",
        "idusuario": id.toString(),
        "datos": DatosServer().datos(listTypes)
      });
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body == '{}');
        print('get datos usuario correctamente');
        return UsuarioModel.fromRawJson(response.body);
      } else {
        final messageError = MessageError.fromRawJson(response.body);
        print(messageError.message);
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al obtener datos del usuario. Código: ${messageError.code}');
      }
    } catch (error, stack) {
      print(stack);
      print('Error al usuario kjj: $error');
    }
    return null;
  }
}
