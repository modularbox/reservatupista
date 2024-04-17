import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/backend/server_node/pista_node.dart';
import 'package:reservatu_pista/flutter_flow/form_field_controller.dart';
import 'package:reservatu_pista/utils/format_date.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../routes/models/mis_pistas_model.dart';
import 'Socio.dart';

class MisSociosController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final unfocusNode = FocusNode();
  final List socios = [
    Socio(
        "José Martinez Durán",
        "NickUno",
        "123456789A",
        "4.00",
        "Calle Falsa nº1",
        43,
        "Revés",
        "Mañana",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080",
        true),
    Socio(
        "José Martinez Durán",
        "NickUno",
        "123456789A",
        "4.00",
        "Calle Falsa nº1",
        43,
        "Revés",
        "Mañana",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080",
        true),
    Socio(
        "Manolo Martinez Soria",
        "NickDos",
        "123456789A",
        "4.00",
        "Calle Falsa nº1",
        7,
        "Revés",
        "Mañana",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxmYWNlJTIwY2xvc2UlMjB8ZW58MHx8fHwxNzExNDY5NTAwfDA&ixlib=rb-4.0.3&q=80&w=1080",
        true),
    Socio(
        "Isabel García García",
        "NickTres",
        "123456789A",
        "4.25",
        "Calle Falsa nº1",
        24,
        "Revés",
        "Mañana",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxmYWNlJTIwY2xvc2UlMjB1cHxlbnwwfHx8fDE3MTE0Njk1NzZ8MA&ixlib=rb-4.0.3&q=80&w=400",
        true),
    Socio(
        "José Martinez Durán",
        "NickUno",
        "123456789A",
        "4.00",
        "Calle Falsa nº1",
        43,
        "Revés",
        "Mañana",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080",
        false),
    Socio(
        "Isabel García García",
        "NickCuatro",
        "123456789A",
        "4.25",
        "Calle Falsa nº1",
        2,
        "Revés",
        "Mañana",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOHx8ZmFjZSUyMGNsb3NlJTIwdXB8ZW58MHx8fHwxNzExNDY5NTc2fDA&ixlib=rb-4.0.3&q=80&w=400",
        false)
  ];
  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarController;
  String? Function(BuildContext, String?)? searchBarControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(50, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(50, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(50, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(50, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  /// Initialization and disposal methods.
  @override
  void onInit() async {
    super.onInit();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  void onCambiarChip(List<String>? val) {
    choiceChipsValue = val?.firstOrNull;
  }

  void onChangedCheckbox(bool? newValue) {
    checkboxValue1 = newValue!;
  }

  void onChangedCheckbox2(bool? newValue) {
    checkboxValue1 = newValue!;
  }

  void onChangedCheckbox3(bool? newValue) {
    checkboxValue1 = newValue!;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchBarFocusNode?.dispose();
    searchBarController?.dispose();
  }
}
