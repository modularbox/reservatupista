import 'package:get/get.dart';
import 'reserva_compartida_c.dart';

class ReservaCompartidaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservaCompartidaController>(
        () => ReservaCompartidaController());
  }
}
