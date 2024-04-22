import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/amigos/amigos_c.dart';

class AmigosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AmigosController>(() => AmigosController());
  }
}
