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

  // Enviar Email usuario
  Future<bool> enviarEmail(String email, String nombre) async {
    try {
      final response = await post(
          '$urlMail/reservatupista_alta',
          {
            "esProveedor": 'true',
            "correo": email,
            "link": "$urlWeb/#/validar_email?email=$email&user=1",
            "message":
                "<h1> Pulsa el siguiente link para validar tu correo: <a href='$urlWeb/#/validar_email?email=$email&user=1'>link</a> </h1>",
            "asunto": "Registro Proveedor"
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
