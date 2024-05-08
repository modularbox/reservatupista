import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/components/alert_recargar/alert_recargar_widget.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'monedero_c.dart';

class MonederoPage extends GetView<MonederoController> {
  const MonederoPage({super.key});
  MonederoController get self => controller;
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
    Widget buildBtnOption(String title, TypeHistorial typeHistorial) {
      Color isType = (title == 'Recargas')
          ? Colors.green
          : (title == 'Reservas')
              ? Colors.red
              : Colors.blue;
      bool isTypeHistorial = controller.type != typeHistorial;
      return FFButtonWidget(
          text: title,
          onPressed: () {
            controller.type = typeHistorial;
          },
          options: FFButtonOptions(
              textStyle: TextStyle(
                  color: isTypeHistorial ? Colors.blue : Colors.white),
              borderSide: isTypeHistorial
                  ? const BorderSide(color: Colors.blue, width: 2)
                  : null,
              color: isTypeHistorial ? Colors.white : isType,
              borderRadius: BorderRadius.circular(30)));
    }

    return NavbarYAppbarUsuario(
      title: 'Monedero Virtual',
      page: TypePage.Monedero,
      child: Expanded(
        child: ResponsiveWeb(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 0.0),
                child: Container(
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 0.0),
                        spreadRadius: 1.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: 250,
                          height: 65.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 28.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Obx(() => Text(
                                    controller.db.dineroTotal.euro,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFF14181B),
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  )),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                self.money = 0;
                                await showAlignedDialog(
                                  context: context,
                                  // isGlobal: true,
                                  isGlobal: true,
                                  avoidOverflow: false,
                                  builder: (dialogContext) {
                                    return const Material(
                                      color: Color.fromARGB(0, 163, 0, 0),
                                      child: AlertRecargarWidget(),
                                    );
                                  },
                                ).then((value) => {});
                              },
                              text: 'Recargar', //alvaro
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF46EF98),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(controller
                            .animationsMap['columnOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ).animateOnPageLoad(
                    controller.animationsMap['containerOnPageLoadAnimation']!),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 25, 8, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    buildBtnOption('Reservas', TypeHistorial.reserva),
                    buildBtnOption('Recargas', TypeHistorial.tranferencia),
                    buildBtnOption('Todo', TypeHistorial.all),
                  ].divide(const SizedBox(width: 10.0)),
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 12.0, 0.0, 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        controller.type != TypeHistorial.reserva
                            ? buildReserva(context)
                            : const SizedBox(),
                        controller.type != TypeHistorial.tranferencia
                            ? buildTransferencia(context)
                            : const SizedBox(),
                        // buildTransferencia(),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTransferencia(BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
    child: Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color(0xFFE74C3C),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 5.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          2.0, 0.0, 2.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/icon_monedero_virtual.png',
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '3vndv0eb' /* Reserva de pista */,
                            ),
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                            ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '088p3ttw' /* Pista Padel #1 */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'gz0qmisy' /* Lunes 3 Enero 2024 */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '3rydlm4r' /* Hora: 11:34 */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'tgp5papj' /* - 1,50 € */,
                  ),
                  textAlign: TextAlign.end,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Outfit',
                        color: const Color(0xFFE74C3C),
                        fontSize: 18.0,
                      ),
                ),
                Container(
                  height: 15.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'b8mc21qx' /* Monedero
                      Virtual */
                    ,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildReserva(BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
    child: Container(
      width: double.infinity,
      alignment: Alignment.center,
      constraints: const BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color(0xFF00BC13),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 5.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          2.0, 0.0, 2.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/icon_recarga.png',
                          width: 38.0,
                          height: 38.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'g0yapamj' /* Recarga */,
                            ),
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                            ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '3rs8cnun' /* Lunes 8 Enero 2024 */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'yhtwqot0' /* Hora: 11:34 */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '7fb17ptw' /* + 100,00 € */,
                    ),
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: const Color(0xFF00BC13),
                          fontSize: 18.0,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ms78u1cd' /* Tarjeta */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
