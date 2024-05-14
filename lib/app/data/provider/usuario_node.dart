import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/models/usuario_model.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'datos_server.dart';

class UsuarioProvider extends GetConnect {
  late String token;
  late int idUser;
  final url = DatosServer.urlServer;
  final urlMail = DatosServer.urlMail;
  final urlWeb = DatosServer.urlWeb;

  Future<void> initialize() async {
    final storage = await SharedPreferences.getInstance();
    token = storage.tokenUsuario.read();
    idUser = storage.idUsuario.read();
  }

  /// Modificar los datos del usuario
  Future<MessageError> modificarUsuario(
      List datos, List<String> idsDatos) async {
    try {
      await initialize();
      final response = await put(
        '$url/usuario',
        {"id": idUser.toString(), "datos": datos, "ids_datos": idsDatos},
        headers: {
          "Authorization": "Bearer $token",
        },
        contentType: 'application/json',
      );
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

  // Validar el email del usuario
  Future<MessageError> validarEmail(String email) async {
    try {
      final response = await put(
          '$url/usuario/validar_email',
          {
            "email": email,
          },
          contentType: 'application/json');
      printError(info: response.body.toString());
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Validar el Email.', code: 501);
    }
  }

// Registrar usuario
  Future<bool> registrarUsuario(List usuario) async {
    try {
      final response = await post(
        '$url/usuario',
        {
          "datos": usuario,
        },
        contentType: 'application/json',
      );
      // Enviar la solicitud
      if (response.statusCode == 200) {
        return true;
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al usuario anadida. Código de estado: ${response.statusCode}');
        throw '';
      }
    } catch (error) {
      print('Error al usuario anadida: $error');
      return false;
    }
  }

// Enviar Email usuario
  Future<bool> enviarEmail(String email, String nombre) async {
    print("dsfjhdsouihgfodisuhodfs");
    try {
      final response = await post(
          '$urlMail/reservatupista_alta',
          {
            "esProveedor": 'false',
            "correo": email,
            "link": "$urlWeb/#/validar_email?email=$email&user=0",
            "message":
                "<h1> Pulsa el siguiente link para validar tu correo: <a href='$urlWeb/#/validar_email?email=$email&user=0'>link</a> </h1>",
            "asunto": "Registro Usuario"
          },
          contentType: 'application/json');
      print(response.body);
      // Enviar la solicitud
      if (response.statusCode == 200) {
        return true;
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al usuario anadida. Código de estado: ${response.statusCode}');
        throw '';
      }
    } catch (error) {
      print('Error al usuario anadida: $error');
      return false;
    }
  }

  Future<bool> getUsuarioExisteNick(String nick) async {
    try {
      final response =
          await get('$url/usuario/existe_nick', headers: {'nick': nick});
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

  // Get Verificar si existe el email
  Future<Response> getUsuarioExisteEmail(String email) =>
      get('$url/usuario/existe_email', headers: {'emai': email});

  // Post request
  Future<dynamic> iniciarSesion(List datos) async {
    try {
      final response = await post(
        '$url/usuario/iniciar_sesion',
        {
          "datos": datos,
        },
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        print(response.body);
        return UsuarioModel.fromJson(response.body);
      } else {
        print(response.body);
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Iniciar Sesion', code: 501);
    }
  }

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
  // Get request
  Future<Response> deleteUser(String id, String token, String user) =>
      delete('$url/$user',
          headers: {"Authorization": "Bearer $token", 'id$user': id});

  Future<UsuarioModel?> getUsuarioDatos(List<String> listTypes) async {
    try {
      await initialize();
      print({
        "Authorization": "Bearer $token",
        "idusuario": idUser.toString(),
        "datos": '${listTypes.join(', ')}'
      });
      // Crear una solicitud multipart
      final response = await get('$url/usuario/datos', headers: {
        "Authorization": "Bearer $token",
        "idusuario": idUser.toString(),
        "datos": listTypes.join(', ')
      });
      if (response.statusCode == 200) {
        return UsuarioModel.fromJson(response.body);
      } else {
        final messageError = MessageError.fromJson(response.body);
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al obtener datos del usuario. Código: ${messageError.code}');
      }
    } catch (error, stack) {
      print(stack);
      print('Error al usuario getUsuarioDatos: $error');
    }
    return null;
  }

// Obtener los datos del usuario
  Future<UsuarioModel?> getUsuario(int id, List<String> listTypes) async {
    try {
      await initialize();
      print({
        "Authorization": "Bearer $token",
        "idusuario": id.toString(),
        "datos": listTypes.join(', ')
      });
      final response = await get('$url/usuario/datos', headers: {
        "Authorization": "Bearer $token",
        "idusuario": id.toString(),
        "datos": listTypes.join(', ')
      });
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
      print('Error al usuario getUsuario: $error');
    }
    return null;
  }
}

class UsuarioNode {
  final provider = UsuarioProvider();

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

  String getImageNode(String fotoName) {
    return '${DatosServer.urlServer}/images_usuario/$fotoName.png';
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
      final url = Uri.parse('${DatosServer.urlServer}/usuario');
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
      print('Error al usuario getUsuarioNode: $error');
    }
    return null;
  }
}
