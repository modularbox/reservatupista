import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/amigos/anadiramigo_c.dart';

class AnadirAmigosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnadirAmigosController>(() => AnadirAmigosController());
  }
}
