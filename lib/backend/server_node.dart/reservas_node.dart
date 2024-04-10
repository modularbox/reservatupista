import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:reservatu_pista/app/routes/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'datos_server.dart';

class ReservasProvider extends GetConnect {
  late String token;
  late int idUser;
  final url = DatosServer().urlServer;

  Future<void> initialize() async {
    final storage = await SharedPreferences.getInstance();
    idUser = storage.idUsuario.read();
  }

  // Obtener las plazas libres de las pistas
  Future<Response> obtenerPlazasLibres(
          String idPista, String fecha, String horaInicio) =>
      post('$url/usuario/obtener_plazas_libres', {
        'id_pista': idPista,
        'fecha': fecha,
        'hora_inicio': horaInicio,
        'id_usuario': idUser
      });
}

class ReservasNode {
  final provider = ReservasProvider();

  Future<dynamic> obtenerPlazasLibres(
      String idPista, String fecha, String horaInicio) async {
    try {
      await provider.initialize();
      final response =
          await provider.obtenerPlazasLibres(idPista, fecha, horaInicio);
      print('obtenerPlazasLibres ${jsonEncode(response.body)}');
      if (response.statusCode == 200) {
        print('obtenerPlazasLibres ${response.body}');
        return ReservasUsuarios.fromJson(response.body);
      } else {
        return false;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return false;
    }
  }
}
