import 'package:get/get.dart';
import 'package:reservatu_pista/app/routes/models/usuario_model.dart';
import 'package:reservatu_pista/backend/server_node.dart/datos_server.dart';
import 'package:reservatu_pista/backend/server_node.dart/usuario_node.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBService extends GetxService {
  // Base de datos en web
  late SharedPreferences storage;
  // Variable para almacenar el servicio
  int idUsuario = 0;
  int idProveedor = 0;
  String tokenUsuario = '';
  String tokenProveedor = '';
  String fotoProveedor = '';
  String nick = '';
  String fotoUsuario = '';
  final _dineroTotal = 0.obs;
  int get dineroTotal => _dineroTotal.value;
  set dineroTotal(int value) => _dineroTotal.value = value;
  bool cargarVariables = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("onInit");
    if (cargarVariables) {
      getDB();
    }
  }

  // Método para incrementar el contador
  Future<void> getDB() async {
    print("GETDB");
    try {
      storage = await SharedPreferences.getInstance();
      idUsuario = storage.idUsuario.read() ?? idUsuario;
      idProveedor = storage.idProveedor.read() ?? idProveedor;
      tokenUsuario = storage.tokenUsuario.read() ?? tokenUsuario;
      tokenProveedor = storage.tokenProveedor.read() ?? tokenProveedor;
      fotoProveedor = storage.fotoProveedor.read() ?? fotoProveedor;
      nick = storage.nick.read() ?? nick;
      fotoUsuario = storage.fotoUsuario.read() ?? fotoUsuario;
      cargarVariables = false;
    } catch (e) {
      print(e);
    }
  }

  // Obtener el dinero del usuario
  Future<void> getMoney() async {
    try {
      final storage = await SharedPreferences.getInstance();
      final List<String> listTypes = [dinero_total, foto];
      final result = await UsuarioNode().getUsuarioDatos(
          storage.idUsuario.read(), storage.tokenUsuario.read(), listTypes);
      if (result is UsuarioModel) {
        dineroTotal = result.dineroTotal;
      }
    } catch (e, stack) {
      print('e  $e');
    }
  }
}
