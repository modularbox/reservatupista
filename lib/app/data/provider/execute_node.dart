import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reservatu_pista/app/data/models/execute_model.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';

class ExecuteProvider extends GetConnect {
  DBService db = Get.find();
  final url = DatosServer.urlServer;

  Future<dynamic> misReservas(String deporte,
      {int page = 1, int itemsPerPage = 10}) async {
    try {
      print({
        'id_usuario': db.idUsuario.toString(),
        'deporte': deporte,
        'page': page.toString(),
        'itemsPerPage': itemsPerPage.toString(),
      });
      print('misReservasResponse');
      final response = await get(
        '$url/reserva',
        query: {
          'id_usuario': db.idUsuario.toString(),
          'itemsPerPage': itemsPerPage.toString(),
          'page': page.toString()
        },
        contentType: 'application/json',
      );
      print('misReservasResponse2');
      print('misReservasResponse ${response.body}');
      print('misReservasResponse response.statusCode  ${response.statusCode}');

      if (response.statusCode == 200) {
        final result = ExecuteModel<
                MisReservasUsuarioModel>.fromJsonMisReservasUsuarioModel(
            response.body);
        print('entra response.statusCode == 200');
        return result.datos;
      } else {
        print('entra nulllllllllllllll');
        return null;
      }
    } catch (error, stack) {
      print('Error al saber si el usuario existe: $error');
      print(stack);
      return null;
    }
  }

  Future<dynamic> obtenerTotalReservas() async {
    try {
      print('obtenerTotalReservas');
      final response = await get(
        '$url/reserva/obtener_reservas_totales',
        query: {'id_usuario': db.idUsuario.toString()},
        contentType: 'application/json',
      );
      print('misReservasResponse2');
      print('misReservasResponse ${response.body['reservasTotales']}');
      if (response.statusCode == 200) {
        return response.body['reservasTotales'];
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
