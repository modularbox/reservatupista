import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../app/routes/models/message_error.dart';
import '../../app/routes/models/proveedor_model.dart';
import 'datos_server.dart';

class ProveedorNode {
  String getImageProveedorNode(String fotoName) {
    return '${DatosServer().urlServer}/images_proveedor/$fotoName.png';
  }

  Future<dynamic> iniciarSesion(List datos) async {
    try {
      final url =
          Uri.parse('${DatosServer().urlServer}/proveedor/iniciar_sesion');
      // Crear una solicitud multipart
      var request = http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "datos": datos,
          }));

      // Enviar la solicitud
      print("-eo-eo-");
      var response = await request;
      print(response.body);
      if (response.statusCode == 200) {
        return ProveedorModel.fromRawJson(response.body);
      } else {
        return MessageError.fromRawJson(response.body);
      }
    } catch (error, stack) {
      print('Error al proveedor anadida: $error');
      print(stack);
      return MessageError(
          message: 'Ocurrio un error intentalo mas tarde.', code: 500);
    }
  }

  Future<void> anadirProveedorNode(List proveedor) async {
    try {
      final url = Uri.parse('${DatosServer().urlServer}/proveedor');

      var request = http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "proveedor": proveedor,
          }));

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        print('proveedor anadida correctamente');
      } else {
        // Manejar el caso en el que la carga no fue exitosa
        print(
            'Error al proveedor anadida. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al proveedor anadida: $error');
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
      int id, String token, List<TypeDatosServerProveedor> listTypes) async {
    try {
      final url = Uri.parse('${DatosServer().urlServer}/proveedor/datos');
      // Crear una solicitud multipart
      final response = await http.get(url, headers: {
        "authorization": "Bearer $token",
        "idproveedor": id.toString(),
        "datos": DatosServer().datosProveedor(listTypes)
      });

      if (response.statusCode == 200) {
        print(response.body == '{}');
        print('get datos proveedor correctamente');
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
      // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZFByb3ZlZWRvciI6MiwiaWF0IjoxNzEwNzkzMTUyLCJleHAiOjE3MTA3OTY3NTJ9.Sxez-AcFfsXFotgspjCkVL93yL3pGUeMwCHxXdxMynY
      // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZFByb3ZlZWRvciI6MiwiaWF0IjoxNzEwNzkzMTUyLCJleHAiOjE3MTA3OTY3NTJ9.Sxez-AcFfsXFotgspjCkVL93yL3pGUeMwCHxXdxMynY
    }
    return null;
  }
}

//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZFByb3ZlZWRvciI6MiwiaWF0IjoxNzEwODAwMzA3LCJleHAiOjE3MTA4MDM5MDd9.24G0RW4UF5CCZOrOU9NAODyv3BHHIxEyFzRXpf4hUFk
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZFByb3ZlZWRvciI6MiwiaWF0IjoxNzEwODAwMzA3LCJleHAiOjE3MTA4MDM5MDd9.24G0RW4UF5CCZOrOU9NAODyv3BHHIxEyFzRXpf4hUFk