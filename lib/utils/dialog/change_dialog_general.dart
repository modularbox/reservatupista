import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/dialog/general_dialog_movil.dart';
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
      return GeneralDialogMovil(
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

class TypeGeneralDialog {
  /// Indicates an error dialog by providing an error icon.
  static const int ERROR = 0;

  /// Indicates a success dialog by providing a success icon.
  static const int SUCCESS = 1;

  /// Indicates a warning dialog by providing a warning icon.
  static const int WARNING = 2;
}
