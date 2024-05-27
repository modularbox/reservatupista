import 'package:get/get.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../tarifas_pista_c.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClonarDias extends StatelessWidget {
  ClonarDias({super.key});
  TarifasPistaController self = Get.find();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: SizedBox(
            height: MediaQuery.sizeOf(context).height - 190,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [Positioned(bottom: 0, child: buildClonarDias())],
            )),
      ),
    );
  }

  Widget buildClonarDias() {
    return ResponsiveWeb(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            20.0.sh,
            Obx(buildListDias),
            20.0.sh,
            SizedBox(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                      onPressed: self.onChangeCopiarDatos,
                      text: '  Copiar  ',
                      options: FFButtonOptions(
                        color: Colors.green,
                        textStyle: LightModeTheme().bodyMedium,
                      )),
                  FFButtonWidget(
                      onPressed: self.onChangeClonarBorrar,
                      text: '  Borrar  ',
                      options: FFButtonOptions(
                        color: Colors.red,
                        textStyle: LightModeTheme().bodyMedium,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListDias() {
    final List<String> diasSelect = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
    diasSelect.removeAt(self.indexDias.value);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        diasSelect.length,
        (index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: BtnIcon(
            onPressed: () => self.onChangeClonarDia(index),
            icon: Text(diasSelect[index],
                style: LightModeTheme().titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: self.selectedDias.value[index]
                          ? Colors.black
                          : Colors.white,
                      fontSize: 12.0,
                    )),
            width: 40.0,
            height: 40.0,
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            fillColor: self.selectedDias.value[index]
                ? const Color(0xFF46EF98)
                : LightModeTheme().primary,
            borderColor: Colors.transparent,
            borderWidth: 1.0,
            borderRadius: 24.0,
          ),
        ),
      ),
    );
  }
}
