import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/mis_clubes_c.dart';

class BuscarClubController extends GetxController {
  List clubes = MisClubesController().clubes.obs;
}
