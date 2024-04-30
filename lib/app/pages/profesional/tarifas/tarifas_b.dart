import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/tarifas/tarifas_c.dart';

class TarifasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TarifasController>(() => TarifasController());
  }
}
