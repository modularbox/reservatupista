import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/chat/chat_grupo/chat_grupo_c.dart';

class ChatGrupoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatGrupoController>(() => ChatGrupoController());
  }
}
