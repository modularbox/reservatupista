import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../flutter_flow/flutter_flow_animations.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class TerminosCondicionesDialog extends StatelessWidget {
  TerminosCondicionesDialog(this.animTerminos, this.focusedColor, this.palomita,
      {super.key, this.paddingTop, this.saltoLinea = false, this.value});
  final AnimationController animTerminos;
  final double? paddingTop;
  final RxBool checkboxTerminos = false.obs;
  final Color focusedColor;
  final RxBool validateTerminos = false.obs;
  final Color palomita;
  final bool saltoLinea;
  final bool? value;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      TextFormField(
        validator: (value) {
          if (!checkboxTerminos.value) {
            validateTerminos.value = true;
            animTerminos.forward();
            return '';
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
          padding: EdgeInsets.only(left: 5.0, top: paddingTop ?? 0.0, right: 5),
          child: VibratingWidget(
            controller: animTerminos,
            child: Obx(
              () => Container(
                decoration: validateTerminos.value
                    ? BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
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
                      child: Obx(buildCheckbox),
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
                      padding: const EdgeInsets.all(0),
                      icon: Text(
                        MediaQuery.of(context).size.width <= 600
                            ? 'He leído y acepto los\nTérminos y Condiciones de Servicio.'
                            : 'He leído y acepto los Términos y Condiciones de Servicio.',
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
      },
      activeColor: focusedColor,
      side: validateTerminos.value
          ? BorderSide(color: LightModeTheme().error)
          : null,
      checkColor: palomita,
    );
  }
}
