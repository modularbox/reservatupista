import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/execute_model.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import '../models/mis_reservas_usuario_model.dart';
import 'datos_server.dart';

class ExecuteProvider extends GetConnect {
  DBService db = Get.find();
  final url = DatosServer.urlServer;

  Future<dynamic> misReservas(String deporte) async {
    try {
      print({
        'id_usuario': db.idUsuario.toString(),
        'deporte': deporte,
      });
      final response = await get(
        '$url/reserva',
        query: {
          'id_usuario': db.idUsuario.toString(),
          'deporte': deporte,
        },
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        final result = ExecuteModel<
                MisReservasUsuarioModel>.fromJsonMisReservasUsuarioModel(
            response.body);
        return result.datos;
      } else {
        return null;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return null;
    }
  }
}
