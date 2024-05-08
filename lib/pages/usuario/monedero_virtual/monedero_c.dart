// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/controllers/db_alvaro_c.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/utils/dialog/rich_alert_flutterflow.dart';
import 'dart:math';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:http/http.dart' as http;

enum TypeHistorial { reserva, tranferencia, all }

class MonederoController extends GetxController
    with GetTickerProviderStateMixin {
  // Conexion a la base de datos local
  DBService db = Get.find();
  DBAlvaroController db2 = Get.find();

  // Tipo en historial
  final Rx<TypeHistorial> _type = TypeHistorial.all.obs;
  get type => _type.value;
  set type(value) => _type.value = value;

  // Animaciones de monederos de virtual
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  /// Controllador de alert recarga widget
  final listaBitteles = [5, 50, 10, 100, 20, 200]
      .map((e) => Rx<ButtonDinero>(ButtonDinero(dinero: e * 100, image: '$e')))
      .toList();
  // Dinero a sumar en recargas
  final _money = 0.obs;
  int get money => _money.value;
  set money(int value) => _money.value = value;
  // Copia dinero total
  late int copiaDineroTotal;
  // Pedir el precio una vez haciendo la compra
  late Timer timer;

  /// Todo del alert recargas
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    try {
      await db.getMoney();
      copiaDineroTotal = db.dineroTotal;
      stopTimer();
    } catch (e) {
      print(e);
    }
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
    for (final element in listaBitteles) {
      final newController = AnimationController(vsync: this);
      element.value.animation.controller = newController;
    }
  }

  void onConfirmar() {
    if (money > 0) {
      ReservarPistaController reservarPistaController =
          Get.find(tag: 'reserva');
      Get.dialog(RichAlertFlutterFlow(
          alertType: TypeAlert.NONE,
          alertTitle: 'Recargar',
          alertSubtitle: '¿Estás seguro de recargar el Monedero Virtual?',
          textButton: 'Recargar',
          precio: money.euro,
          onPressed: () => recargarMonedero(money, reservarPistaController)));
    }
  }

  Future<void> recargarMonedero(
      int dinero, ReservarPistaController reservarPistaController) async {
    try {
      String numOperacion = generarNumeroOperacionUnico();

      await guardarUsuarioOperacion(
        numOperacion,
        dinero,
        reservarPistaController.fecha_seleccionada.value,
        reservarPistaController.hora_inicio_reserva_seleccionada.value,
        reservarPistaController.hora_fin_reserva_seleccionada.value,
        db.idUsuario,
        reservarPistaController.id_pista_seleccionada.value,
      );
      startTimer();
      await launchURL(
          'https://tpv.modularbox.com/pago_tpv?cantidad=$dinero&num_operacion=$numOperacion');
      Get.back();
      Get.back();
    } catch (e, stack) {
      print("recargarMOndedor");
      print(e);
      print(stack);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> mostrarHistorialReservas() async {
    http.Response? response = await db2.obtenerHistorialReservas(db.idUsuario);
    return [
      {'': 3}
    ];
  }

  String generarNumeroOperacionUnico(
      {bool esReservaConTarjeta = false, bool pisarReserva = false}) {
    DateTime now = DateTime.now();
    Random random = Random();
    int aleatorio = random.nextInt(999999);

    String formattedString =
        '${now.year}${_padNumber(now.month)}${_padNumber(now.day)}_${_padNumber(now.hour)}${_padNumber(now.minute)}${_padNumber(now.second)}_$aleatorio';
    if (esReservaConTarjeta) formattedString += '_reservaConTarjeta';
    if (pisarReserva) formattedString += '_pisarReserva';
    print('formattedString $formattedString');
    return formattedString;
  }

  Future<http.Response> guardarUsuarioOperacion(
      String numOperacion,
      int cantidad,
      DateTime fecha,
      String horaInicio,
      String horaFin,
      int idUsuario,
      int idPista,
      {bool reservaConTarjeta = false}) async {
    http.Response response;

    print('id_usuario.toString() ${idUsuario.toString()}');
    print('num_operacion $numOperacion');
    print('cantidad $cantidad');
    print('fecha $fecha');
    print('hora_inicio $horaInicio');
    print('hora_fin $horaFin');
    print('id_pista $idPista');
    print('reservaConTarjeta $reservaConTarjeta');
    if (reservaConTarjeta) {
      response = await http.post(
          Uri.parse('${DatosServer.urlServer}/usuario/guardar_operacion'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'id_usuario': idUsuario.toString(),
            'num_operacion': numOperacion,
            'cantidad': cantidad.toString(),
            'fecha': fecha.toString(),
            'hora_inicio': horaInicio,
            'hora_fin': horaFin,
            'reserva_con_tarjeta': 'true',
            'id_pista': idPista.toString()
            //estado es null al principio
          }));
    } else {
      response = await http.post(
          Uri.parse('${DatosServer.urlServer}/usuario/guardar_operacion'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'id_usuario': idUsuario.toString(),
            'num_operacion': numOperacion,
            'cantidad': cantidad.toString(),
            'fecha': fecha.toString(),
            'hora_inicio': horaInicio,
            'hora_fin': horaFin,
            'reserva_con_tarjeta': 'false',
            'id_pista': idPista.toString()
            //estado es null al principio
          }));
    }
    print('responseeeeeeeeeeeeeeeeeeee ${response.body}');
    return response;
  }

  String _padNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      print("Obtener precio cada segundo");
      try {
        await db.getMoney();
        if (copiaDineroTotal != db.dineroTotal) {
          stopTimer();
        }
      } catch (e) {
        print(e);
      }
    });
  }

  void stopTimer() {
    timer.cancel();
  }
}

class ButtonDinero {
  bool ativate = false;
  final animation = AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 130.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ]);
  final String image;
  final int dinero;
  ButtonDinero({required this.dinero, required this.image});
}
