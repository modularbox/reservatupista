import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_pistas/horas_pistas/horas_pistas_c.dart';

class HorasPistasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HorasPistasController>(() => HorasPistasController());
  }
}
