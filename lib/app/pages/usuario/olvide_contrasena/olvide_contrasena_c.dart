import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:reservatupista/app/utils/dialog/rich_alert.dart';
// import '../utils/resend/resend.dart';

class OlvideContrasenaController extends GetxController {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey0 = GlobalKey();
  bool validatorForm = false;
  RxBool stateEmail = false.obs;
  void restartValidate(String value) {
    if (value.isEmpty && validatorForm) {
      formKey0.currentState!.validate();
    }
  }

  // final resend = Resend(apiKey: 're_JD38dZYR_MXbwZkGi7MbUaeu7GvJZ8ytd');

  void resendSendEmail() async {
    if (formKey0.currentState!.validate()) {
      print("No esta validadp");
      try {
        // final state = await resend.sendEmail(
        //   from: 'onboarding@resend.dev',
        //   to: [emailController.text],
        //   subject: 'Envio de email desde ap reservatupista',
        //   text: 'Puedes restablecer tu contrasena.',
        // );
        stateEmail.value = true;
        // print(state);
      } catch (e) {
        print("wetyufufui");
        print(e.toString());
        // Get.dialog(RichAlertDialog(
        //   alertTitle: richTitle("Recuperar Contraseña"),
        //   alertSubtitle: richSubtitle(
        //       "Error: Algo ocurrio al enviar el email. Vuelva a intentarlo mas tarde."),
        //   alertType: RichAlertType.WARNING,
        //   textButton: "Cerrar",
        //   onPressed: () => Get.back(),
        // ));
      }
    }
    // resend.sendEmail(
    //   from: 'onboarding@resend.dev',
    //   to: [emailController.text],
    //   subject: 'Envio de email desde ap reservatupista',
    //   text: 'Puedes restablecer tu contrasena.',
    // );
  }
}
