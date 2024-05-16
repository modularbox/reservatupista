import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_model.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/execute_node.dart';
import 'package:reservatu_pista/app/data/provider/reservas_node.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_pistas/mis_pistas_c.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/utils/dialog/change_dialog_general.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';

extension IterableExtension<E> on List<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int index) f) sync* {
    var index = 0;
    for (final element in this) {
      yield f(element, index++);
    }
  }
}

class MisReservasController extends GetxController
    with GetSingleTickerProviderStateMixin {
  /// Base de datos local
  DBService db = Get.find();

  /// Obtencion de los datos de la api
  StateRx<List<MiReserva>> misReservas = StateRx(Rx<List<MiReserva>>([]));

  /// Obtener las reservas
  final misReservasUsuario = StateRx(Rx<List<MisReservasUsuarioModel>>([]));
  // Lista de reservas de usuarios
  final List<ReservasUsuarios> listReservasUsuarios = [];

  /// Controlador para las animaciones
  final animationPistaDeporte = AnimationInfo(
    trigger: AnimationTrigger.onPageLoad,
    effects: [
      FadeEffect(
        curve: Curves.linear,
        delay: 0.ms,
        duration: 400.ms,
        begin: 0.0,
        end: 1.0,
      ),
      MoveEffect(
        curve: Curves.linear,
        delay: 0.ms,
        duration: 400.ms,
        begin: const Offset(50.0, 0.0),
        end: const Offset(0.0, 0.0),
      ),
    ],
  );

  /// Controlador para cambiar de deporte
  final _deporte = 'Padel'.obs;
  String get deporte => _deporte.value;
  set deporte(String value) => _deporte.value = value;
  // Global key para el cambio del deporte
  List<GlobalKey> deporteKey = List.generate(16, (index) => GlobalKey());
  // Mostrar el width una vez que cargue la pantalla
  Rx<List<double>> deportesWidth =
      Rx<List<double>>(List.generate(16, (index) => 30.0));

  @override
  void onReady() async {
    try {
      await db.getDB();
      cargarDatos();
    } catch (e) {
      print(e);
    }
    super.onReady();
  }

  /// Initialization and disposal methods.
  @override
  void onInit() async {
    super.onInit();
    // Actualizar: Actualizar el tamano de los deportes al tamano de la imagen y del texto
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Verifica si el contexto de la GlobalKey es nulo
      final List<double> newDeportesWidth = [];
      for (var i = 0; i < deporteKey.length; i++) {
        if (deporteKey[i].currentContext != null) {
          // Obtiene el ancho del widget utilizando el contexto de la GlobalKey
          double width = deporteKey[i].currentContext!.size!.width;
          newDeportesWidth.add(width);
        }
      }
      deportesWidth.value = newDeportesWidth;
    });
    // Mandar llamar a la api cargar datos cada vez que se cambie el estado del deporte
    debounce(_deporte, (val) => cargarDatos(),
        time: const Duration(milliseconds: 100));
  }

  /// Método para cargar datos
  Future<void> cargarDatos() async {
    try {
      misReservasUsuario.loading();
      final result = await ExecuteProvider().misReservas(deporte);
      if (result is List<MisReservasUsuarioModel>) {
        if (result.isEmpty) {
          misReservasUsuario.empty();
          return;
        }
        for (var i = 0; i < result.length; i++) {
          final element = result[i];
          result[i].reservasUsuarios = await obtenerPlazasLibres(
              element.idPista.toString(),
              element.fechaReserva.formatReserva,
              element.horaInicio);
        }
        misReservasUsuario.success(result);
      }
    } catch (e) {}
  }

  /// Ver cuando pulsa en algun deporte
  void onPressDeporte(String val) => {deporte = val};

  Future<void> eliminarReserva(String idReserva) async {
    try {
      final resultEliminarReserva =
          await ReservasProvider().cancelarReserva(idReserva);
      print(resultEliminarReserva);
      if (!resultEliminarReserva) {
        print('NOOOOOOO SE HA CANCELAD');
        Get.dialog(ChangeDialogGeneral(
          alertTitle: richTitle("Reserva NO Cancelada"),
          alertSubtitle: richSubtitle(
              'La reserva no se ha podido cancelar ya que el tiempo de cancelación de reservas de esta pista es inferior al tiempo que queda para la partida'),
          textButton: "Cerrar",
          alertType: TypeGeneralDialog.WARNING,
          onPressed: () => Get.back(),
        ));
      } else {
        Get.dialog(ChangeDialogGeneral(
            alertTitle: richTitle("RESERVA CANCELADA"),
            alertSubtitle:
                richSubtitle('¡ENHORABUENA!. LA RESERVA SE HA CANCELADO.'),
            textButton: "Cerrar",
            alertType: TypeGeneralDialog.SUCCESS,
            onPressed: () => {
                  Get.back(),
                  Get.back(),
                }));
      }

      await cargarDatos();
    } catch (e) {
      Get.dialog(ChangeDialogGeneral(
        alertTitle: richTitle("Reserva NO Cancelada"),
        alertSubtitle: richSubtitle('Ha habido un error interno en la app.'),
        textButton: "Cerrar",
        alertType: TypeGeneralDialog.ERROR,
        onPressed: () => Get.back(),
      ));
      throw e;
    }
  }

  Future<ReservasUsuarios?> obtenerPlazasLibres(
      String idPista, String fecha, String horaInicio) async {
    try {
      final result = await ReservasProvider()
          .obtenerPlazasLibres(idPista, fecha, horaInicio);
      if (result is ReservasUsuarios) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
