import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/mis_reservas_c%20copy.dart';
import 'mis_reservas_c.dart';

class MisReservasBinding2 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MisReservasController2>(() => MisReservasController2());
    Get.put<DBService>(DBService());
  }
}
