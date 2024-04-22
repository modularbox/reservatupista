import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/misBonos/mis_bonos_c.dart';

class MisBonosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MisBonosController>(() => MisBonosController());
  }
}
