import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../flutter_flow/flutter_flow_animations.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import 'link_dialog.dart';

// ignore: must_be_immutable
class TerminosCondicionesDialog extends StatelessWidget {
  TerminosCondicionesDialog(this.animTerminos, this.checkboxTerminos,
      this.focusedColor, this.validateTerminos, this.palomita,
      {super.key, this.paddingTop});
  AnimationController animTerminos;
  double? paddingTop;
  RxBool checkboxTerminos;
  Color focusedColor;
  RxBool validateTerminos;
  Color palomita;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, top: paddingTop ?? 0.0),
      child: VibratingWidget(
        controller: animTerminos,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                unselectedWidgetColor:
                    FlutterFlowTheme.of(context).secondaryText,
              ),
              child: Obx(() => Checkbox(
                    value: checkboxTerminos.value,
                    onChanged: (newValue) async {
                      checkboxTerminos.value = newValue!;
                    },
                    activeColor: focusedColor,
                    side: validateTerminos.value
                        ? BorderSide(color: FlutterFlowTheme.of(context).error)
                        : null,
                    checkColor: palomita,
                  )),
            ),
            10.0.sw,
            BtnIcon(
              onPressed: () => Get.dialog(LinkDialog(
                alertTitle: richTitleLink('¿Deseas ir al enlace externo?',
                    fontSize: 20.0),
                alertSubtitle: richSubtitleLink(
                    'https://reservatupista.com/politica-de-privacidad-proteccion-de-datos-y-politica-de-cookies'),
              )),
              borderRadius: 12,
              padding: const EdgeInsets.all(0),
              icon: Text(
                'He leído y acepto los\nTérminos y Condiciones de Servicio.',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
