import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/chat/chat_individual/chat_individual_c.dart';

class ChatIndividualBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatIndividualController>(() => ChatIndividualController());
  }
}
