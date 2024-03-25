import 'package:get/get.dart';
import 'package:reservatu_pista/app/routes/database.dart';
import 'eliminar_cuenta_c.dart';

class EliminarCuentaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EliminarCuentaController>(() => EliminarCuentaController());
  }
}
