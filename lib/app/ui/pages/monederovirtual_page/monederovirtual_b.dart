import 'package:get/get.dart';
import 'monederovirtual_c.dart';

class MonederoVirtualBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonederoVirtualController>(() => MonederoVirtualController());
  }
}
