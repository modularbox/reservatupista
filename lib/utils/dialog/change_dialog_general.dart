import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/dialog/general_dialog.dart';
import 'package:reservatu_pista/utils/dialog/general_dialog_web.dart';

class ChangeDialogGeneral extends StatelessWidget {
  final Text alertTitle;
  final Text alertSubtitle;
  final int alertType;
  final String textButton;
  final void Function()? onPressed;
  const ChangeDialogGeneral({
    super.key,
    required this.alertTitle,
    required this.alertSubtitle,
    required this.alertType,
    required this.textButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width <= 680) {
      return GeneralDialog(
        alertTitle: alertTitle,
        alertSubtitle: alertSubtitle,
        alertType: alertType,
        textButton: textButton,
        onPressed: onPressed,
      );
    } else {
      return GeneralDialogWeb(
        alertTitle: alertTitle,
        alertSubtitle: alertSubtitle,
        alertType: alertType,
        textButton: textButton,
        onPressed: onPressed,
      );
    }
  }
}
