import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/widgets/select_c.dart';
import 'reservar_pista_c2.dart';

class ReservarPistaBinding2 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservarPistaController2>(() => ReservarPistaController2());
    Get.lazyPut<SelectController>(() => SelectController());
  }
}
