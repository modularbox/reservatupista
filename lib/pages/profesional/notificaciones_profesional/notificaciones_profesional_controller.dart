import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';

class NotificacionesProfesionalController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final unfocusNode = FocusNode();

  get searchBarFocusNode => null;

  get searchBarController => null;

  @override
  void onInit() async {
    super.onInit();

    var animationsMap;
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  void setBusquedaState() {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchBarFocusNode?.dispose();
    searchBarController?.dispose();
  }
}
