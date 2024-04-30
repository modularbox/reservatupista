import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'monederovirtual_c.dart';

class MonederoVirtualBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonederoVirtualController>(() => MonederoVirtualController());
    Get.lazyPut<ReservarPistaController>(() => ReservarPistaController(),
        tag: 'reserva');
  }
}
