import 'dart:convert';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/app/routes/models/message_error.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late String token;
  late int idUser;
  final url = DatosServer().urlServer;

  Future<void> initialize() async {
    final storage = await SharedPreferences.getInstance();
    token = storage.token.read();
    idUser = storage.idUsuario.read();
  }

  Future<void> _initialize() async {
    // Llama a una función asíncrona para obtener el token
    // _token = await _getTokenFromServer();
  }
  // Get request
  // Get request
  Future<Response> deleteUser(String id, String token, String user) =>
      delete('$url/$user',
          headers: {"Authorization": "Bearer $token", 'id$user': id});

  Future<Response> getUser(int id, List<TypeDatosServer> listTypes) =>
      get('$url/usuario/datos', headers: {
        "Authorization": "Bearer $token",
        "idusuario": id.toString(),
        "datos": DatosServer().datosParseados(listTypes)
      });

  // Put Modificar datos
  Future<Response> modificarUser(int id, List datos, List<String> idsDatos) =>
      put(
        '$url/usuario',
        {"id": idUser.toString(), "datos": datos, "ids_datos": idsDatos},
        headers: {
          "Authorization": "Bearer $token",
        },
        contentType: 'application/json',
      );
}

class UsuarioNode {
  final usuarioProvider = UsuarioProvider();

  final provider = UsuarioProvider();
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
      print('usuario.toString()');
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

  Future<MessageError> modificarUsuarioNode(
      int id, List usuario, List<String> datosModificados) async {
    try {
      await provider.initialize();
      final response =
          await provider.modificarUser(id, usuario, datosModificados);
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        print(response.body);
        return MessageError(
            code: response.body.code,
            message: 'Ocurrio un error al actualizar el Usuario');
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Modificar Usuario', code: 501);
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
      int id, List<TypeDatosServer> listTypes) async {
    try {
      await provider.initialize();
      final response = await provider.getUser(id, listTypes);
      if (response.statusCode == 200) {
        return UsuarioModel.fromJson(response.body);
      } else {
        final messageError = MessageError(
            code: response.body.code,
            message: 'Ocurrio un error al actualizar el Usuario');
        print(messageError.message);
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al obtener datos del ---ausuario. Código: ${messageError.code}');
      }
    } catch (error, stack) {
      print(stack);
      print('Error al usuario kjj: $error');
    }
    return null;
  }
}
