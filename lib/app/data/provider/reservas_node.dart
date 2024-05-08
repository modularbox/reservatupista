import 'package:get/get_connect/connect.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'datos_server.dart';

class ReservasProvider extends GetConnect {
  late String token;
  late int idUser;
  final url = DatosServer.urlServer;

  Future<void> initialize() async {
    final storage = await SharedPreferences.getInstance();
    idUser = storage.idUsuario.read();
  }

  Future<dynamic> obtenerPlazasLibres(
      String idPista, String fecha, String horaInicio) async {
    try {
      await initialize();
      print({
        'id_pista': idPista,
        'fecha': fecha,
        'hora_inicio': horaInicio,
        'id_usuario': idUser
      });
      final response = await post('$url/usuario/obtener_plazas_libres', {
        'id_pista': idPista,
        'fecha': fecha,
        'hora_inicio': horaInicio,
        'id_usuario': idUser
      });
      if (response.statusCode == 200) {
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

  Future<bool> cancelarReserva(String idReserva) async {
    try {
      final response = await delete('$url/usuario/eliminar_reserva',
          headers: {'idreserva': idReserva});
      print('obtenerPlazasLibres ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error, stack) {
      print('Error eliminar la reserva: $error');
      print(stack);
      return false;
    }
  }
}
