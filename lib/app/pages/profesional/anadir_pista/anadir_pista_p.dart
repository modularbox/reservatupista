import 'package:get/get.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/list_inputs.dart';
import 'anadir_pista_c.dart';

// ignore: must_be_immutable
class AnadirPistaPage extends GetView<AnadirPistaController> {
  AnadirPistaPage({super.key});
  AnadirPistaController get self => controller;
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
      title: 'Crear Pista',
      page: TypePage.ReservarPista,
      child: Expanded(
        child: SingleChildScrollView(
          controller: self.scrollController,
          child: ResponsiveWeb(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: self.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: const Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: SingleChildScrollView(child: ListInputs()),
                  ),
                ),
                10.0.sh,
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 10.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: self.crearPista,
                      text: 'Crear Pista',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: LightModeTheme().successGeneral,
                        textStyle: LightModeTheme().titleSmall.override(
                              fontFamily: 'Readex Pro',
                              color: LightModeTheme().primaryText,
                            ),
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                80.0.sh
              ],
            ),
          ),
        ),
      ),
    );
  }
}
