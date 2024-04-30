import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/routes/models/mis_reservas_model.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
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
  /// Obtencion de los datos de la api
  StateRx<List<MiReserva>> misReservas = StateRx(Rx<List<MiReserva>>([]));

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
  void onReady() {
    cargarDatos();
    super.onReady();
  }

  /// Initialization and disposal methods.
  @override
  void onInit() async {
    super.onInit();
    // Actualizar: Actualizar el tamano de los deportes al tamano de la imagen y del texto
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(milliseconds: 200), () {
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
    });
    // Mandar llamar a la api cargar datos cada vez que se cambie el estado del deporte
    debounce(_deporte, (val) => cargarDatos(),
        time: const Duration(milliseconds: 100));
  }

  /// Método para cargar datos
  void cargarDatos() {}

  /// Ver cuando pulsa en algun deporte
  void onPressDeporte(String val) => {deporte = val};
}
