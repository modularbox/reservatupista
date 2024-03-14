import 'package:get/get.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '../../../../utils/btn_icon.dart';
import '../../../widgets/terminos_condiciones.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/list_inputs.dart';
import '../../../../constants.dart';

import 'anadir_pista_c.dart';
export 'anadir_pista_model.dart';

// ignore: must_be_immutable
class AnadirPistaWidget extends StatelessWidget {
  AnadirPistaWidget({super.key});
  AnadirPistaController self = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return NavbarYAppbarProfesional(
      title: 'Añadir Pista',
      page: TypePage.ReservarPista,
      child: Expanded(
        child: SingleChildScrollView(
          controller: self.scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: (MediaQuery.sizeOf(context).width >= 640 &&
                          MediaQuery.sizeOf(context).width <= 740)
                      ? MediaQuery.sizeOf(context).width * 0.9
                      : (MediaQuery.sizeOf(context).width >= 741 &&
                              MediaQuery.sizeOf(context).width <= 1140)
                          ? MediaQuery.sizeOf(context).width * 0.75
                          : MediaQuery.sizeOf(context).width * kWidthPercentage,
                  child: Form(
                    key: self.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: SingleChildScrollView(child: ListInputs()),
                    ),
                  ),
                ),
              ),
              10.0.sh,
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      // _model.formKey.currentState!.validate();
                      // anims.horaInicio.forward();
                      self.crearPista();
                      // anadirPistaNode();
                    },
                    text: 'Crear Pista',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).btnGeneral,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              15.0.sh,
            ],
          ),
        ),
      ),
    );
  }
}
