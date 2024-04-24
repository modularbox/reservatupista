import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/privacidad/privacidad_c.dart';

class PrivacidadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacidadController>(() => PrivacidadController());
  }
}
