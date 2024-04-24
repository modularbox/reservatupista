import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/anadirclub_c.dart';

class AnadirClubBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnadirClubController>(() => AnadirClubController());
  }
}
