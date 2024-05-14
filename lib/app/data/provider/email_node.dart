import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/models/usuario_model.dart';
import 'datos_server.dart';

class EmailProvider extends GetConnect {
  final url = DatosServer.urlServer;
  final urlMail = DatosServer.urlMail;
  final urlWeb = DatosServer.urlWeb;

  // Validar el email del usuario
  Future<MessageError> validarEmail(String email, bool isProveedor) async {
    if (isProveedor) {}
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

// Enviar Email usuario
  Future<bool> enviarEmail(String email, String nombre) async {
    try {
      final response = await post(
          '${DatosServer.urlPruebas}/email',
          {
            "nombre": nombre,
            "correo": email,
            "link": "$urlWeb/#/validar_email?email=$email&user=0"
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
}
