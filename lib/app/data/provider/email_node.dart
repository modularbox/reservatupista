import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/models/usuario_model.dart';
import 'datos_server.dart';

class EmailProvider extends GetConnect {
  final url = DatosServer.urlServer;
  final urlPruebas = DatosServer.urlPruebas;
  final urlMail = DatosServer.urlMail;
  final urlWeb = DatosServer.urlWeb;

  // Validar el email del usuario
  Future<dynamic> enviarOlvideContrasena(
      String correo, bool esProveedor, String nombre, String asunto) async {
    try {
      final response = await post(
          '$urlMail/reservatupista_reset_password',
          {
            'correo': correo,
            'esProveedor': esProveedor.toString(),
            'nombre': 'usuario',
            'asunto': asunto
          },
          contentType: 'application/json');
      if (response.statusCode == 200) {
        // return MessageError.fromJson(response.body);
      } else {
        // return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Validar el Email.', code: 501);
    }
  }

  // Validar el otp
  Future<dynamic> validarOTP(
      String correo, String otp, bool isProveedor) async {
    try {
      final response = await post('$url/email/validar_otp',
          {'correo': correo, 'otp': otp, 'esProveedor': isProveedor},
          contentType: 'application/json');
      printError(info: response.body.toString());
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Validar el OTP.', code: 501);
    }
  }

/*
 req.body.correo && 
 req.body.num_referencia && 
 req.body.fecha_inicio && 
 req.body.fecha_fin && 
 req.body.ubicacion && 
 req.body.deporte && 
 req.body.metodo_pago && 
 req.body.nombre && 
 req.body.num_participantes

 */
  // Enviar email reservas
  Future<dynamic> emailReservas(
    String correo,
    String numReferencia,
    String fecha,
    String fechaInicio,
    String fechaFin,
    String ubicacion,
    String deporte,
    String numPista,
    String metodoPago,
    String nombre,
    String numParticipantes,
  ) async {
    try {
      final response = await post(
          '$url/email/reserva_monedero',
          {
            'correo': correo,
            'num_referencia': numReferencia,
            'fecha': fecha,
            'hora_inicio': fechaInicio,
            'hora_fin': fechaFin,
            'ubicacion': ubicacion,
            'deporte': deporte,
            'num_pista': numPista,
            'metodo_pago': 'Monedero',
            'nombre': nombre,
            'num_participantes': numParticipantes,
          },
          contentType: 'application/json');
      printError(info: response.body.toString());
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Validar el OTP.', code: 501);
    }
  }

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
