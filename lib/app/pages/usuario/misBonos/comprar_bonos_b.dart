import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/historial/historial_c.dart';
import 'package:reservatu_pista/app/pages/usuario/misBonos/comprar_bonos_c.dart';

class ComprarBonosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComprarBonosController>(() => ComprarBonosController());
  }
}
