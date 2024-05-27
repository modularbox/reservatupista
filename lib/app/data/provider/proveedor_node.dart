import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/app/data/models/club_model.dart';
import 'package:reservatu_pista/app/data/models/message_error.dart';
import 'package:reservatu_pista/app/data/models/proveedor_model.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'datos_server.dart';

class ProveedorProvider extends GetConnect {
  late String token;
  late int idClub;
  final url = DatosServer.urlServer;
  final urlMail = DatosServer.urlMail;
  final urlWeb = DatosServer.urlWeb;

  Future<void> initialize() async {
    final storage = await SharedPreferences.getInstance();
    token = storage.tokenProveedor.read();
    idClub = storage.idClub.read();
  }

  // Validar el email del usuario
  Future<MessageError> validarEmail(String email) async {
    try {
      final response = await put(
          '$url/proveedor/validar_email',
          {
            "email": email,
          },
          contentType: 'application/json');
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(
          message: 'Error al Validar Email Proveedor', code: 501);
    }
  }

  Future<MessageError> modificarContrasena(
      int id, String tokenUser, List datos, List<String> idsDatos) async {
    try {
      await initialize();
      final response = await put(
        '$url/proveedor',
        {"id": id, "datos": datos, "ids_datos": idsDatos},
        headers: {
          "Authorization": "Bearer $tokenUser",
        },
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        print(response.body);
        throw MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      throw MessageError(
          message: 'Error al Modificar la Contraseña', code: 501);
    }
  }

  /// Modificar los datos del usuario
  Future<MessageError> modificar(
      int? id, List datos, List<String> idsDatos) async {
    try {
      await initialize();
      final response = await put(
        '$url/proveedor',
        {"id": id, "datos": datos, "ids_datos": idsDatos},
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
            message: 'Ocurrio un error al actualizar el Proveedor');
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Modificar Proveedor', code: 501);
    }
  }

  // Enviar Email usuario
  Future<bool> enviarEmail(String email, String nombre) async {
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
        <h1>¡Bienvenido a ReservaTuPista!</h1>
      </div>
      <div class="content">
        <p>Hola $nombre,</p>
        <p>
          Gracias por registrarte en ReservaTuPista. Estamos encantados de
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

  Future<ClubModel?> getClub(List<String> listTypes) async {
    try {
      await initialize();
      printError(info: listTypes.join(', '));
      final response = await get('$url/proveedor/club', headers: {
        "Authorization": "Bearer $token",
        "id": idClub.toString(),
        "datos": listTypes.join(', ')
      });
      if (response.statusCode == 200) {
        print(response.body);
        return ClubModel.fromJson(response.body);
      } else {
        final messageError = MessageError.fromJson(response.body);
        print(messageError.message);
        // Manejar el caso en el que la carga no fue exitosa
        print('Error al obtener datos del club. Código: ${messageError.code}');
      }
    } catch (error, stack) {
      print(stack);
      print('Error al proveedor kjj: $error');
    }
    return null;
  }

  // Post request
  Future<dynamic> iniciarSesion(List datos) async {
    try {
      final response = await post(
        '$url/proveedor/iniciar_sesion',
        {
          "datos": datos,
        },
        contentType: 'application/json',
      );
      print(response.body);
      if (response.statusCode == 200) {
        return ProveedorModel.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Iniciar Sesion', code: 501);
    }
  }

  // Anadir proveedor y el club
  Future<MessageError> registrarProveedor(
      List proveedor, List club, List localidad) async {
    try {
      final response = await post(
        '$url/proveedor',
        {"proveedor": proveedor, "club": club, "localidad": localidad},
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error) {
      return MessageError(message: 'Error al Registrar Proveedor', code: 501);
    }
  }

  // Obtener los clubes de multiples localidades
  Future<dynamic> obtenerClubes(List<String> codigosPostales) async {
    try {
      final response = await post(
        '$url/usuario/obtener_clubes',
        {"codigos_postales": codigosPostales},
        contentType: 'application/json',
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (error) {
      return MessageError(message: 'Error al Registrar Proveedor', code: 501);
    }
  }

  // Get request
  Future<Response> deleteUser(String id, String token, String user) =>
      delete('$url/$user',
          headers: {"Authorization": "Bearer $token", 'id$user': id});
}

class ProveedorNode {
  final proveedorProvider = ProveedorProvider();
  String getImageNode(String fotoName) {
    return '${DatosServer.urlServer}/images_proveedor/$fotoName.png';
  }

  Future<dynamic> iniciarSesion(List datos) async {
    try {
      final response = await proveedorProvider.iniciarSesion(datos);
      if (response.statusCode == 200) {
        return ProveedorModel.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(error);
      print(stack);
      return MessageError(message: 'Error al Iniciar Sesion', code: 501);
    }
  }

  Future<void> modificarUsuarioNode(
      int id, List usuario, List<String> datosModificados) async {
    try {
      final url = Uri.parse('${DatosServer.urlServer}/usuario');
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
      final url = Uri.parse('${DatosServer.urlServer}/proveedor');
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

  Future<ProveedorModel?> getProveedor(
      int id, List<TypeDatosServerProveedor> listTypes) async {
    try {
      final url = Uri.parse('${DatosServer.urlServer}/proveedor/datos');
      // Crear una solicitud multipart
      final response = await http.get(url, headers: {
        "authorization": "Bearer token",
        "idproveedor": id.toString(),
        "datos": DatosServer.datosParseados(listTypes)
      });

      if (response.statusCode == 200) {
        print(response.body);
        return ProveedorModel.fromRawJson(response.body);
      } else {
        final messageError = MessageError.fromRawJson(response.body);
        print(messageError.message);
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al obtener datos del proveedor. Código: ${messageError.code}');
      }
    } catch (error, stack) {
      print(stack);
      print('Error al proveedor kjj: $error');
    }
    return null;
  }
}
