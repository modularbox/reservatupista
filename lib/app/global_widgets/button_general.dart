import 'package:flutter/material.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';

class ButtonGeneral extends StatefulWidget {
  const ButtonGeneral(
      {super.key,
      this.child,
      this.prefixIcon,
      this.suffixIcon,
      this.text,
      this.borderColor,
      this.borderRadius,
      this.borderWidth,
      this.buttonSize,
      this.width,
      this.height,
      this.fillColor,
      this.disabledColor,
      this.disabledIconColor,
      this.hoverColor,
      this.hoverIconColor,
      this.onPressed,
      this.padding,
      this.iconSize,
      this.iconColor,
      this.size,
      this.showLoadingIndicator = false,
      this.isProveedor = false});

  final Widget? child;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? text;
  final double? borderRadius;
  final double? buttonSize;
  final double? width;
  final double? height;
  final Color? fillColor;
  final Color? disabledColor;
  final Color? disabledIconColor;
  final Color? hoverColor;
  final Color? hoverIconColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool showLoadingIndicator;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;
  final Size? size;
  final Function()? onPressed;
  final bool isProveedor;

  @override
  State<ButtonGeneral> createState() => _ButtonGeneralState();
}

class _ButtonGeneralState extends State<ButtonGeneral> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: widget.fillColor ??
              (widget.isProveedor
                  ? Colores.proveedor.primary
                  : Colores.usuario.primary),
          child: BtnIcon(
              onPressed: widget.onPressed,
              height: widget.height ?? 50,
              width: widget.width,
              hoverColor: widget.hoverColor ?? (Colors.black26),
              padding: widget.padding ??
                  const EdgeInsets.symmetric(horizontal: 20.0),
              // fillColor: widget.fillColor ??
              //     (widget.isProveedor
              //         ? Colores.proveedor.primary
              //         : Colores.usuario.primary),
              fillColor: Colors.transparent,
              borderColor: Colors.transparent,
              borderWidth: 1,
              borderRadius: 12,
              icon: buildWidget())),
    );
  }

  /// Verificar si existen y cambiar de widget
  Widget buildWidget() {
    if (widget.child != null) {
      return widget.child!;
    }
    if (widget.prefixIcon != null) {
      return buildIconPrefix();
    }
    if (widget.suffixIcon != null) {
      return buildIconSufix();
    }
    return buildText();
  }

  /// Solo si hay prefixicon or sufixx icon
  Widget buildIconPrefix() {
    return Row(children: [widget.prefixIcon!, 8.0.sw, buildText()]);
  }

  Widget buildIconSufix() {
    return Row(children: [buildText(), 8.0.sw, widget.suffixIcon!]);
  }

  Widget buildText() {
    return Text(
      widget.text ?? 'Registrate',
      style: LightModeTheme().bodyLarge.copyWith(
        fontFamily: 'Readex Pro',
        color: LightModeTheme().tertiary,
        shadows: [
          const Shadow(
            blurRadius: 5.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}
