import 'package:get/get.dart';
import './login_usuario_c.dart';
import 'login_responsive_c.dart';

class LoginUsuarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginUsuarioController>(() => LoginUsuarioController());
    Get.lazyPut<LoginResponsiveController>(() => LoginResponsiveController());
  }
}
