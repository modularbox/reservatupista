import 'dart:convert';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/app/routes/models/message_error.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/routes/models/usuario_model.dart';
import 'datos_server.dart';

class UsuarioProvider extends GetConnect {
  late String token;
  final url = DatosServer().urlServer;

  Future<void> initialize() async {
    final storage = await SharedPreferences.getInstance();
    token = storage.token.read();
  }

  // Get request
  Future<Response> getUser(int id, List<TypeDatosServer> listTypes) =>
      get('$url/usuario/datos', headers: {
        "Authorization": "Bearer $token",
        "idusuario": id.toString(),
        "datos": DatosServer().datosParseados(listTypes)
      });

  // Get Verificar si existe el nick
  Future<Response> getUsuarioExisteNick(String nick) =>
      get('$url/usuario/existe_nick', headers: {'nick': nick});

  // Get Verificar si existe el email
  Future<Response> getUsuarioExisteEmail(String email) =>
      get('$url/usuario/existe_email', headers: {'emai': email});

  // Post request
  Future<Response> iniciarSesionUser(List datos) => post(
        '$url/usuario/iniciar_sesion',
        {
          "datos": datos,
        },
        contentType: 'application/json',
      );
  // Get request
  Future<Response> deleteUser(String id, String token, String user) =>
      delete('$url/$user',
          headers: {"Authorization": "Bearer $token", 'id$user': id});
}

class UsuarioNode {
  final provider = UsuarioProvider();

  Future<bool> getUsuarioExisteNick(String nick) async {
    try {
      final response = await provider.getUsuarioExisteNick(nick);
      if (response.statusCode == 200) {
        return response.body == false;
      } else {
        return false;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return false;
    }
  }

  Future<bool> getUsuarioExisteEmail(String email) async {
    try {
      final response = await provider.getUsuarioExisteEmail(email);
      if (response.statusCode == 200) {
        return response.body == false;
      } else {
        return false;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return false;
    }
  }

  Future<UsuarioModel?> getUsuario(
      int id, List<TypeDatosServer> listTypes) async {
    try {
      await provider.initialize();
      final response = await provider.getUser(id, listTypes);
      if (response.statusCode == 200) {
        return UsuarioModel.fromJson(response.body);
      } else {
        final messageError = MessageError.fromJson(response.body);
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
  // Future<UsuarioModel?> getUsuario(
  //     int id, String token, List<TypeDatosServer> listTypes) async {
  //   try {
  //     final url = Uri.parse('${DatosServer().urlServer}/usuario/datos');
  //     print(token);
  //     // Crear una solicitud multipart
  //     final response = await http.get(url, headers: {
  //       "Authorization": "Bearer $token",
  //       "idusuario": id.toString(),
  //       "datos": DatosServer().datos(listTypes)
  //     });
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       print(response.body == '{}');
  //       print('get datos usuario correctamente');
  //       return UsuarioModel.fromRawJson(response.body);
  //     } else {
  //       final messageError = MessageError.fromRawJson(response.body);
  //       print(messageError.message);
  //       // Manejar el caso en el que la carga no fue exitosa
  //       print(
  //           'Error al obtener datos del usuario. Código: ${messageError.code}');
  //     }
  //   } catch (error, stack) {
  //     print(stack);
  //     print('Error al usuario kjj: $error');
  //   }
  //   return null;
  // }

  Future<dynamic> delete(String id, String token, String user) async {
    try {
      final response = await provider.deleteUser(id, token, user);
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error) {
      return MessageError(message: 'Error al Eliminar la Cuenta', code: 501);
    }
  }

  Future<dynamic> iniciarSesion(List datos) async {
    try {
      final response = await provider.iniciarSesionUser(datos);
      if (response.statusCode == 200) {
        return UsuarioModel.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Iniciar Sesion', code: 501);
    }
  }

  String getImageNode(String fotoName) {
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
