import 'package:get/get.dart';
import 'tarifas_c.dart';

class COPIARARCHIVOSBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<COPIARARCHIVOSController>(() => COPIARARCHIVOSController());
  }
}
