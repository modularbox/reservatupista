import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../pages/usuario/reservar_pista/reservar_pista_c.dart';

class PagoTpvController extends GetxController {
  final _htmlContent = ''.obs;
  get htmlContent => _htmlContent.value;
  set htmlContent(value) => _htmlContent.value = value;
  ReservarPistaController claseReserva = Get.find();
  Future<dynamic> pagarTpv() async {
    try {
      int anio = claseReserva.fecha_seleccionada.value.year;
      int mes = claseReserva.fecha_seleccionada.value.month;
      int dia = claseReserva.fecha_seleccionada.value.day;
      DateTime fecha = DateTime(anio, mes, dia);
      String hora_inicio = claseReserva.hora_inicio_reserva_seleccionada.value;
      int id_usuario = claseReserva.storage.idUsuario.read();
      int id_pista = claseReserva.id_pista_seleccionada.value;
      print('id_pista $id_pista');
      print('anio $anio');
      print('mes $mes');
      print('dia $dia');
      print('hora_inicio $hora_inicio');
      final url = Uri.parse('https://tpv.modularbox.com/pago_tpv');
      final urlGuardarReservaPendiente = Uri.parse(
          'https://api.reservatupista.com/usuario/guardar_reserva_pendiente?id_usuario=$id_usuario&id_pista${id_pista}&fecha=${fecha}&hora_inicio=$hora_inicio');
      var requestGuardarReservaPendiente = http.get(
        url,
      );
      var request = http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "cantidad": 2000,
          }));

      // Enviar la solicitud
      var response = await request;
      if (response.statusCode == 200) {
        htmlContent = response.body;
        print(response.body);
      } else {
        print(response.body);
      }
    } catch (error) {
      print('Error al usuario anadida: $error');
    }
  }
}
