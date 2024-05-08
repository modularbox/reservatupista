import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/execute_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_pistas_usuarios.dart';
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

  Future<ReservasPistasUsuarios?> getPistas(
      String table, String select, Map<String, dynamic> query) async {
    try {
      final response = await post(
        '$url/execute',
        {
          'table': reservas_pistas_usuarios,
          'select': [id_reserva, dinero_pagado].join(', '),
          'where': '$id_usuario = ?',
          'where_datos': [db.idUsuario]
        },
        contentType: 'application/json',
      );
      if (response.statusCode == 200) {
        final result =
            ExecuteModel<ReservasPistasUsuarios>.fromJsonReservasPistasUsuarios(
                response.body);
        final idReservas = result.datos.map((e) => e.idReserva).toList();
        final responseReservasUsuarios = await post(
          '$url/execute',
          {
            'table': reservas_pistas,
            'select':
                [id_pista, hora_inicio, fecha_reserva, referencia].join(', '),
            'where':
                '${List.generate(idReservas.length, (index) => id_reserva).join(' = ? || ')} = ?',
            'where_datos': idReservas
          },
          contentType: 'application/json',
        );
        print(responseReservasUsuarios.body);
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

final reservaspistasUsuarios = {
  "id_reserva": 158,
  "dinero_pagado": 200,
  "id_usuario": 28,
  "id_pista": 9,
  "hora_inicio": "04:00:00",
  "fecha_reserva": "2024-05-03T22:00:00.000Z",
  "referencia": "RIDOO627AP",
  "deporte": "Padel",
  "num_pista": 1,
  "nombre_patrocinador": "Patrocinador2",
  "capacidad": 4,
  "nombre": "Nombre Comercio",
  "foto": "1713266859653"
};

const query = '''
SELECT reservas_pistas_usuarios.id_reserva, 
reservas_pistas_usuarios.dinero_pagado, 

reservas_pistas.id_pista, reservas_pistas.hora_inicio, reservas_pistas.fecha_reserva, reservas_pistas.referencia,
pistas.deporte, pistas.num_pista, pistas.nombre_patrocinador, pistas.capacidad,
clubes.nombre, 
proveedores.foto
FROM reservas_pistas_usuarios
INNER JOIN reservas_pistas ON reservas_pistas_usuarios.id_reserva = reservas_pistas.id_reserva
INNER JOIN pistas ON reservas_pistas.id_pista = pistas.id_pista
INNER JOIN clubes ON pistas.id_club = clubes.id_club
INNER JOIN proveedores ON clubes.id_proveedor = proveedores.id_proveedor;
''';
