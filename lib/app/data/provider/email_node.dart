import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/models/usuario_model.dart';
import 'datos_server.dart';

class EmailProvider extends GetConnect {
  final url = DatosServer.urlServer;
  final urlPruebas = DatosServer.urlPruebas;
  final urlMail = DatosServer.urlMail;
  final urlWeb = DatosServer.urlWeb;

  // Enviar Email usuario
  Future<bool> enviarEmailRegistro(
      String email, String nombre, bool esProveedor) async {
    try {
      print('Send Email');
      final response = await post(
          '$urlMail/reservatupista_alta',
          {
            "esProveedor": 'true',
            "correo": email,
            "link": "$urlWeb/#/validar_email?email=$email&user=1",
            "message": '''
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bienvenido a ReservaTuPista</title>
    <style>
      body {
          font-family: monospace, Helvetica, Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
      }
      .container {
        width: 100%;
        max-width: 600px;
        margin: 0 auto;
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      .header {
        text-align: center;
        padding: 10px 0;
        background-color: #007bff;
        color: #ffffff;
        border-radius: 8px 8px 0 0;
      }
      .header h1 {
        margin: 0;
        font-size: 24px;
      }
      .content {
        margin: 20px 0;
      }
      .content p {
        font-size: 16px;
        line-height: 1.6;
        color: #333333;
      }
      .button {
        display: block;
        width: 200px;
        margin: 20px auto;
        padding: 15px;
        text-align: center;
        background-color: #007bff;
        color: #ffffff !important;
        text-decoration: none;
        border-radius: 5px;

      }
      .footer {
        text-align: center;
        font-size: 12px;
        color: #999999;
        margin: 20px 0 0;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="header">
        <h1>¡Bienvenido a Reservatupista!</h1>
      </div>
      <div class="content">
        <p>Hola $nombre,</p>
        <p>
          Gracias por registrarte en Reservatupista. Estamos encantados de
          tenerte con nosotros. Ahora puedes reservar tus pistas de deportes
          favoritas de manera rápida y sencilla.
        </p>
        <p>
          Para empezar, por favor verifica tu cuenta haciendo clic en el
          siguiente botón:
        </p>
        <a href="$urlWeb/#/validar_email?email=$email&user=1" class="button">Verificar Cuenta</a>
        <p>
          Si tienes alguna pregunta o necesitas ayuda, no dudes en contactarnos.
        </p>
        <p>¡Nos vemos en la pista!</p>
        <p>Saludos,<br />El equipo de ReservaTuPista</p>
      </div>

      <p style="font-weight: 900;"> Este es un mensaje automático, por favor no responda a este correo.</p>
      <p
        style="
          color: #708c91;
          text-decoration: none;
          font-size: 16px;
          text-align: center;
        "
      >
        <a
          href="https://web.reservatupista.com/#descarga"
          target="_blank"
          rel="noopener noreferrer"
          data-auth="NotApplicable"
          title="
Descárgate la app
"
          style="text-decoration: none !important; color: #2dbeff"
          data-linkindex="7"
          >Descárgate la app </a
        >
     
      </p>
      <p
        style="
          color: #708c91;
          text-decoration: none;
          font-size: 12px;
        "
      >
       Te informamos de que seguirás recibiendo mensajes relacionados
        con tus reservas de pistas o cuando tengas notificaciones de la app. Para saber más sobre la forma
        en la que usamos tu información, puedes consultar nuestra política de
        protección de datos personales
        <a
          href="https://web.reservatupista.com/politica-de-privacidad-proteccion-de-datos-y-politica-de-cookies/"
          target="_blank"
          rel="noopener noreferrer"
          data-auth="NotApplicable"
          title="date de baja aquí"
          style="text-decoration: none !important; color: #2dbeff"
          data-linkindex="11"
          >aquí</a
        >. <br style="" /><br style="" />
      </p>
      <div class="footer">
        <p>&copy; 2024 Reservatupista. Todos los derechos reservados.</p>
      </div>
    </div>
  </body>
</html>
            ''',
            "asunto": "Registro Proveedor Reservatupista.com"
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
            'asunto': asunto,
            'link': 'https://api.reservatupista.com/email/otp'
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

// // Enviar Email usuario
//   Future<bool> enviarEmail(String email, String nombre) async {
//     try {
//       final response = await post(
//           '${DatosServer.urlPruebas}/email',
//           {
//             "nombre": nombre,
//             "correo": email,
//             "link": "$urlWeb/#/validar_email?email=$email&user=0"
//           },
//           contentType: 'application/json');
//       print(response.body);
//       // Enviar la solicitud
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         // Manejar el caso en el que la carga no fue exitosa
//         print(
//             'Error al usuario anadida. Código de estado: ${response.statusCode}');
//         throw '';
//       }
//     } catch (error) {
//       print('Error al usuario anadida: $error');
//       return false;
//     }
//   }

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
