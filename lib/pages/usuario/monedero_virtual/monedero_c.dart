// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/controllers/db_alvaro_c.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'dart:math';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:http/http.dart' as http;
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import 'package:reservatu_pista/web/web.dart';

enum TypeHistorial { reserva, recarga, tranferencia, all }

class MonederoController extends GetxController
    with GetTickerProviderStateMixin {
  // Conexion a la base de datos local
  final DBService db = Get.find();
  final DBAlvaroController db2 = Get.find();
  final historial_reservas = StateRx(Rx<List<dynamic>>([]));
  final historial_recargas = StateRx(Rx<List<dynamic>>([]));
  final historial_todo = StateRx(Rx<List<dynamic>>([]));
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
  // Limite de peticiones para cambiar el estado del monedero
  final peticiones = 0.obs;

  /// Todo del alert recargas
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    try {
      await db.getMoney();
      await mostrarHistorialTodo();
      copiaDineroTotal = db.dineroTotal;
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
    debounce(peticiones, (val) async {
      if (val > 0) {
        await db.getMoney();
        if (copiaDineroTotal != db.dineroTotal) {
          peticiones.value = 0;
        }
        if (val > 9) {
          peticiones.value = 0;
          return;
        }
        peticiones.value++;
      }
    }, time: const Duration(seconds: 30));
  }

  void onConfirmar() {
    if (money > 0) {
      ReservarPistaController reservarPistaController =
          Get.find(tag: 'reserva');
      recargarMonedero(money, reservarPistaController);
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
      // Iniciar peticiones
      peticiones.value = 1;
      if (isSafari()) {
        await openUrlInSafari(
            'https://tpv.modularbox.com/pago_tpv?cantidad=$dinero&num_operacion=$numOperacion');
      } else {
        launchURL(
            'https://tpv.modularbox.com/pago_tpv?cantidad=$dinero&num_operacion=$numOperacion');
      }
      Get.back();
    } catch (e, stack) {
      print("recargarMOndedor");
      print(e);
      print(stack);
      rethrow;
    }
  }

  Future<void> mostrarHistorialTodo() async {
    try {
      historial_todo.loading();
      dynamic response = await db2.obtenerHistorialTodo(db.idUsuario);
      if (response.length == 0) {
        historial_todo.empty();
      } else {
        historial_todo.success(response);
      }
    } catch (e, stack) {
      print(e);
      print(stack);
      historial_todo.empty();
    }
  }

  Future<void> mostrarHistorialReservas() async {
    try {
      historial_reservas.loading();
      dynamic response = await db2.obtenerHistorialReservas(db.idUsuario);
      if (response.length == 0) {
        historial_reservas.empty();
      } else {
        historial_reservas.success(response);
      }
    } catch (e, stack) {
      print(e);
      print(stack);
      historial_reservas.empty();
    }
  }

  Future<void> mostrarHistorialRecargas() async {
    try {
      historial_recargas.loading();
      dynamic response = await db2.obtenerHistorialRecargas(db.idUsuario);
      if (response.length == 0) {
        historial_recargas.empty();
      } else {
        historial_recargas.success(response);
      }
    } catch (e, stack) {
      print(e);
      print(stack);
      historial_recargas.empty();
    }
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
          }));
    }
    return response;
  }

  String _padNumber(int number) {
    return number.toString().padLeft(2, '0');
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
