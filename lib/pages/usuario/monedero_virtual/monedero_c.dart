import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/utils/buttons_sounds.dart';

class MonederoController extends GetxController
    with GetTickerProviderStateMixin {
  Map<String, dynamic> args = Get.arguments ?? {};
  List<bool> selectRecarga = [false, false, false, false, false, false];
  RxBool isFiltrar = false.obs;
  RxDouble moneyMonederoVirtual = 0.0.obs;

  /// Reproducir sonido de click al presionar un boton
  ClickButton clickButton = ClickButton();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  List<String> monto = [
    "- 9.00",
    "+ 100.00",
    "- 4.00",
    "- 20.00",
    "- 15.00",
    "- 100.00",
    "- 40.00",
    "+ 20.00",
    "- 0.00",
    "- 20.00",
    "- 40.00",
    "- 20.00",
  ];
  List<String> nameMonto = [
    "Comida Domicilio",
    "Recarga",
    "Lavandería",
    "Terapeuta Ocupacional",
    "Fisioterapeuta",
    "Psicólogo",
    "Podólogo",
    "Recarga",
    "Médico",
    "Ortoprotésico",
    "Peluquéro",
    "Trabajador Social",
  ];
  List<String> fecha = [
    "08/01/2024",
    "22/11/2023",
    "21/11/2023",
    "18/11/2023",
    "17/11/2023",
    "10/11/2023",
    "09/11/2023",
    "03/11/2023",
    "02/11/2023",
    "01/11/2023",
    "30/10/2023",
    "28/10/2023"
  ];
  List<String> horario = [
    "00:00",
    "12:32",
    "12:32",
    "12:32",
    "12:32",
    "12:32",
    "11:34",
    "8:09",
    "17:18",
    "20:32",
    "14:09",
    "21:25",
  ];
  List<String> nameIcon = [
    "comida_domicilio",
    "icon_recarga",
    "lavanderia",
    "terapeuta_ocupacional",
    "fisioterapeuta",
    "psicologo",
    "podologo",
    "icon_recarga",
    "medico",
    "material_ortoprotesico",
    "peluquero",
    "trabajador_social"
  ];
  List<String> typeTransfer = [
    "",
    "",
    "",
    "",
    "",
    "Bizum",
    "",
    "Transferencia",
    "",
    "",
    "",
    "",
    ""
  ];
  RxString filterMonedero = "Todo".obs;

  @override
  void onInit() {
    super.onInit();
    if (args['filterMonedero'] != null) {
      filterMonedero.value = args['filterMonedero'];
    }
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  void changeSelectRecarga(int position) {
    final List<bool> resetList = [false, false, false, false, false, false];
    resetList[position] = true;
    selectRecarga = resetList;
    update(['listRecarga']);
  }

  void filterOnPress(String text) {
    filterMonedero.value = text;
    Get.back();
  }

  @override
  void dispose() {
    print('dskfmkdf');
    clickButton.audioPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
