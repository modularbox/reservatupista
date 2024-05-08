import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/club_model.dart';
import 'package:reservatu_pista/app/data/provider/proveedor_node.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';

class PerfilProveedorController extends GetxController {
  final nombreClub = StateRx(''.obs);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    obtenerNombreClub();
  }

  void obtenerNombreClub() async {
    nombreClub.loading();
    final result = await ProveedorProvider().getClub(['nombre']);
    if (result is ClubModel) {
      nombreClub.success(result.nombre);
    }
  }
}
