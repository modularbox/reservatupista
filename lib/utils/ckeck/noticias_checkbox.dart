import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../flutter_flow/flutter_flow_animations.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiasCheckbox extends StatefulWidget {
  final AnimationController animTerminos;
  final Color focusedColor;
  final Color palomita;
  final double? paddingTop;
  final bool saltoLinea;
  final void Function(bool?) onChanged;
  final bool initialValue;

  const NoticiasCheckbox({
    required this.animTerminos,
    required this.focusedColor,
    required this.palomita,
    required this.onChanged,
    this.paddingTop,
    this.saltoLinea = false,
    this.initialValue = false,
    super.key,
  });

  @override
  _NoticiasCheckboxState createState() => _NoticiasCheckboxState();
}

class _NoticiasCheckboxState extends State<NoticiasCheckbox> {
  late RxBool checkboxTerminos;
  final RxBool validateTerminos = false.obs;

  @override
  void initState() {
    super.initState();
    checkboxTerminos = widget.initialValue.obs;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      TextFormField(
        validator: (value) {
          if (!checkboxTerminos.value) {
            validateTerminos.value = true;
            widget.animTerminos.forward();
          }
          return null;
        },
        decoration: const InputDecoration(
          border: InputBorder.none, // Quitar el borde del TextFormField
          contentPadding: EdgeInsets.zero, // Eliminar el padding
        ),
        style: const TextStyle(height: 0), // Hacer el texto invisible
      ),
      Padding(
          padding: EdgeInsets.only(
              left: 5.0, top: widget.paddingTop ?? 0.0, right: 5),
          child: VibratingWidget(
            controller: widget.animTerminos,
            child: Obx(
              () => Container(
                decoration: validateTerminos.value
                    ? BoxDecoration(
                        border:
                            Border.all(width: 2, color: widget.focusedColor),
                        borderRadius: BorderRadius.circular(10.0))
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        unselectedWidgetColor: LightModeTheme().secondaryText,
                      ),
                      child: Obx(() => buildCheckbox()),
                    ),
                    10.0.sw,
                    BtnIcon(
                      onPressed: () async {
                        final urlPoliticaPrivacidad = Uri.parse(
                            'https://reservatupista.com/politica-de-privacidad-proteccion-de-datos-y-politica-de-cookies');
                        final canLaunch =
                            await canLaunchUrl(urlPoliticaPrivacidad);
                        if (canLaunch) {
                          launchUrl(urlPoliticaPrivacidad);
                        }
                      },
                      borderRadius: 12,
                      width: MediaQuery.sizeOf(context).width >= 600
                          ? 460
                          : MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(0),
                      icon: Text(
                        'Permítanos mantenerle informado. ¿Acepta recibir nuestras noticias y actualizaciones por correo?.',
                        maxLines: 4,
                        textAlign: TextAlign.start,
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: LightModeTheme().primary,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
    ]);
  }

  Widget buildCheckbox() {
    return Checkbox(
      value: checkboxTerminos.value,
      onChanged: (val) async {
        checkboxTerminos.toggle();
        if (validateTerminos.value) {
          validateTerminos.toggle();
        }
        widget.onChanged(val);
      },
      activeColor: widget.focusedColor,
      side: validateTerminos.value
          ? BorderSide(color: widget.focusedColor)
          : null,
      checkColor: widget.palomita,
    );
  }
}
