import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas_page/detalles_reserva/detalles_reserva_c.dart';

class DetallesReservaClienteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetallesReservaController>(() => DetallesReservaController());
  }
}
