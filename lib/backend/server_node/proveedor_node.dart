import 'dart:convert';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/routes/models/club_model.dart';
import '../../app/routes/models/message_error.dart';
import '../../app/routes/models/proveedor_model.dart';
import 'datos_server.dart';

class ProveedorProvider extends GetConnect {
  late String token;
  final url = DatosServer().urlServer;

  Future<void> initialize() async {
    final storage = await SharedPreferences.getInstance();
    token = storage.token.read();
  }

  // Get request
  Future<Response> getUser(int id) => get('http://youapi/users/$id');

  // Get request
  Future<Response> getClub(int id, List<dynamic> listTypes) {
    print(token);
    return get('$url/proveedor/club', headers: {
      "authorization": "Bearer $token",
      "id": id.toString(),
      "datos": DatosServer().datosParseados(listTypes)
    });
  }

  // Post request
  Future<Response> iniciarSesion(List datos) => post(
        '$url/proveedor/iniciar_sesion',
        {
          "datos": datos,
        },
        contentType: 'application/json',
      );
  // Post request
  Future<Response> anadirProveedorAndClub(Map<String, dynamic> datos) => post(
        '$url/proveedor',
        datos,
        contentType: 'application/json',
      );
  // Get request
  Future<Response> deleteUser(String id, String token, String user) =>
      delete('$url/$user',
          headers: {"Authorization": "Bearer $token", 'id$user': id});
}

class ProveedorNode {
  final proveedorProvider = ProveedorProvider();
  String getImageNode(String fotoName) {
    return '${DatosServer().urlServer}/images_proveedor/$fotoName.png';
  }

  Future<dynamic> iniciarSesion(List datos) async {
    try {
      final response = await proveedorProvider.iniciarSesion(datos);
      print("dfsjbfdsijbfjdsibnfjds");
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
  // Future<dynamic> iniciarSesion(List datos) async {
  //     await usuarioProvider.initialize();
  //   try {
  //     final url =
  //         Uri.parse('${DatosServer().urlServer}/proveedor/iniciar_sesion');
  //     // Crear una solicitud multipart
  //     var request = http.post(url,
  //         headers: {"Content-Type": "application/json"},
  //         body: jsonEncode({
  //           "datos": datos,
  //         }));

  //     var response = await request;
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       return ProveedorModel.fromRawJson(response.body);
  //     } else {
  //       return MessageError.fromRawJson(response.body);
  //     }
  //   } catch (error, stack) {
  //     print('Error al proveedor anadida: $error');
  //     print(stack);
  //     return MessageError(
  //         message: 'Ocurrio un error intentalo mas tarde.', code: 500);
  //   }
  // }

  Future<MessageError> anadirProveedorNode(
      List proveedor, List club, List localidad) async {
    try {
      final response = await proveedorProvider.anadirProveedorAndClub(
          {"proveedor": proveedor, "club": club, "localidad": localidad});
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error) {
      return MessageError(message: 'Error al Registrar Proveedor', code: 501);
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

  Future<ProveedorModel?> getProveedorNode(String id) async {
    try {
      final url = Uri.parse('${DatosServer().urlServer}/proveedor');
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
      final url = Uri.parse('${DatosServer().urlServer}/proveedor/datos');
      // Crear una solicitud multipart
      final response = await http.get(url, headers: {
        "authorization": "Bearer token",
        "idproveedor": id.toString(),
        "datos": DatosServer().datosParseados(listTypes)
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

  Future<ClubModel?> getClub(
      int id, List<TypeDatosServerClub> listTypes) async {
    try {
      await proveedorProvider.initialize();
      final response = await proveedorProvider.getClub(id, listTypes);
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
}
