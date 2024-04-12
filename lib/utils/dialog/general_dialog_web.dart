import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../sizer.dart';

class GeneralDialogWeb extends StatefulWidget {
  /// The title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Usually has a bigger fontSize than the [alertSubtitle].
  final Text alertTitle;

  /// The subtitle of the dialog is displayed in a medium-sized font beneath
  /// the title of the dialog.
  ///
  /// Usually has a smaller fontSize than the [alertTitle]
  final Text alertSubtitle;

  /// The type of dialog, whether warning, success or error.
  final int alertType;

  /// The (optional) actions to be performed in the dialog is displayed
  /// the subtitle of the dialog. If no values are provided, a default
  /// [Button] widget is rendered.
  ///
  /// Typically a [List<Widget>] widget.
  final List<Widget> actions;

  /// Specifies how blur the screen overlay effect should be.
  /// Higher values mean more blurred overlays.
  final double blurValue;

  // Specifies the opacity of the screen overlay
  final double backgroundOpacity;

  /// (Optional) User defined icon for the dialog. Advisable to use the
  /// default icon matching the dialog type.
  final Icon? dialogIcon;
  final void Function()? onPressed;
  final String textButton;

  GeneralDialogWeb({
    Key? key,
    required this.alertTitle,
    required this.alertSubtitle,
    required this.alertType,
    required this.textButton,
    this.actions = const [],
    this.onPressed,
    this.blurValue = 3.0,
    this.backgroundOpacity = 0.2,
    this.dialogIcon,
  }) : super(key: key);

  createState() => _GeneralDialogWebState();
}

class _GeneralDialogWebState extends State<GeneralDialogWeb> {
  final Map<int, AssetImage> _typeAsset = {
    TypeGeneralDialogWeb.ERROR: const AssetImage("assets/images/error.png"),
    TypeGeneralDialogWeb.SUCCESS: const AssetImage("assets/images/success.png"),
    TypeGeneralDialogWeb.WARNING: const AssetImage("assets/images/warning.png"),
  };

  final Map<int, Color> _typeColor = {
    TypeGeneralDialogWeb.ERROR: Colors.red,
    TypeGeneralDialogWeb.SUCCESS: Colors.green,
    TypeGeneralDialogWeb.WARNING: Colors.blue,
  };

  final double dialogHeight = 100.h * (2 / 6);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.blurValue,
          sigmaY: widget.blurValue,
        ),
        child: Container(
          height: 100.h,
          color: Colors.white.withOpacity(widget.backgroundOpacity),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      child: SizedBox(
                        height: dialogHeight,
                        width: 90.w,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: dialogHeight / 4),
                              widget.alertTitle,
                              SizedBox(height: dialogHeight / 10),
                              widget.alertSubtitle,
                              SizedBox(height: dialogHeight / 10),
                              widget.actions.isNotEmpty
                                  ? _buildActions()
                                  : defaultAction(_typeColor[widget.alertType],
                                      widget.onPressed, widget.textButton),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: (Get.height / 2) - (dialogHeight / 2 + 50),
                      child: widget.dialogIcon ?? _defaultIcon(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildActions() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.actions,
      ),
    );
  }

  Image _defaultIcon() {
    if (_typeAsset.containsKey(widget.alertType)) {
      return Image(
        image: _typeAsset[widget.alertType]!,
        width: 100.h / 10,
        height: 100.h / 10,
      );
    } else {
      throw Exception("Invalid alertType");
    }
  }
}

Container defaultAction(Color? color, void Function()? onPressed, String text) {
  return Container(
    alignment: Alignment.center,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2.0,
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

Text richTitle(String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 24.0),
  );
}

Text richSubtitle(String subtitle) {
  return Text(
    subtitle,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Colors.grey,
    ),
  );
}

class TypeGeneralDialogWeb {
  /// Indicates an error dialog by providing an error icon.
  static const int ERROR = 0;

  /// Indicates a success dialog by providing a success icon.
  static const int SUCCESS = 1;

  /// Indicates a warning dialog by providing a warning icon.
  static const int WARNING = 2;
}
