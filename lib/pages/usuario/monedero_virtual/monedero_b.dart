import 'package:get/get.dart';
import './monedero_c.dart';

class MonederoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonederoController>(() => MonederoController());
  }
}
