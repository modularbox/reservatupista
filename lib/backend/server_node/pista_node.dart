import 'dart:convert';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/app/routes/models/message_error.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/routes/models/mis_pistas_model.dart';
import '../../app/routes/models/usuario_model.dart';
import 'datos_server.dart';

class PistaProvider extends GetConnect {
  late String token;
  late int idClub;
  final url = '${DatosServer().urlServer}/pista';

  Future<void> initialize() async {
    final storage = await SharedPreferences.getInstance();
    token = storage.token.read();
    idClub = storage.idClub.read();
  }

  // Get request
  Future<Response> getCountPistas(String deporte) =>
      get('$url/$idClub/total_pistas/?deporte=$deporte',
          headers: {"Authorization": "Bearer $token"});

  // Get Verificar si existe el nick
  Future<Response> crearPista(Map<String, dynamic> body) => post(
        '$url/$idClub',
        body,
        headers: {"Authorization": "Bearer $token"},
        contentType: 'application/json',
      );

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
  // Put Modificar datos
  Future<Response> modificarUser(int id, List datos, List<String> idsDatos) =>
      put(
        '$url/usuario',
        {"id": 1.toString(), "datos": datos, "ids_datos": idsDatos},
        headers: {
          "Authorization": "Bearer $token",
        },
        contentType: 'application/json',
      );
  // Get request
  Future<Response> deleteUser(String id, String token, String user) =>
      delete('$url/$user',
          headers: {"Authorization": "Bearer $token", 'id$user': id});

  // Get Mis Pistas
  Future<Response> getMisPista(String deporte, String diaSemana) =>
      get('$url/$idClub/?deporte=$deporte&dia_semana=$diaSemana',
          headers: {"Authorization": "Bearer $token"});
}

class PistaNode {
  final provider = PistaProvider();

  Future<MessageError> crearPista(Map<String, dynamic> body) async {
    try {
      await provider.initialize();
      final response = await provider.crearPista(body);
      print(response.body);
      if (response.statusCode == 200) {
        return MessageError.fromJson(response.body);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return MessageError(message: 'Error al Agregar la Pista', code: 501);
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

  /// Obtener el total de pistas
  Future<int?> getCountPistas(String deporte) async {
    print("ENTEJBFJ");
    print(deporte);
    try {
      await provider.initialize();
      final response = await provider.getCountPistas(deporte);
      print(response.body);
      if (response.statusCode == 200) {
        return response.body['total'];
      }
    } catch (error, stack) {
      print(stack);
      print('Error al usuario kjj: $error');
    }
    return null;
  }

  /// Obtener el total de pistas
  Future<dynamic> getMisPista(String deporte, String diaSemana) async {
    print("Entro en get mis pistas");
    try {
      await provider.initialize();
      final response = await provider.getMisPista(deporte, diaSemana);
      if (response.statusCode == 200) {
        return MisPistas.fromList(response.body['datos']);
      } else {
        return MessageError.fromJson(response.body);
      }
    } catch (error, stack) {
      print(stack);
      print('Error al usuario kjj: $error');
      return MessageError(message: 'Error al obtener mis pistas', code: 501);
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
    try {
      await provider.initialize();
      final url = Uri.parse('${DatosServer().urlServer}/usuario');
      // Crear una solicitud multipart
      print(usuario.toString());
      print(datosModificados.toString());
      var request = http.put(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
              {"id": id, "datos": usuario, "ids_datos": datosModificados}));

      // Enviar la solicitud
      var response = await request;
      print(response.body);
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
