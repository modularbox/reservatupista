import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_pistas/detalles_reserva/Widgets/confirmacion_cobro.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class CobroWidget extends StatefulWidget {
  const CobroWidget({super.key});

  @override
  State<CobroWidget> createState() => _CobroWidgetState();
}

class _CobroWidgetState extends State<CobroWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.7,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 1,
            decoration: BoxDecoration(
              color: LightModeTheme().secondaryBackground,
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: LightModeTheme().primaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x3B1D2429),
                    offset: Offset(
                      0.0,
                      -3,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) => Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 20),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          Get.to(const ConfirmarPagoWidget());
                                        },
                                        text: 'Tarjeta',
                                        icon: Icon(
                                          Icons.credit_card,
                                          color: LightModeTheme().primaryText,
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40,
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 0, 0),
                                          iconPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                          color: LightModeTheme()
                                              .secondaryBackground,
                                          textStyle: LightModeTheme()
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0,
                                              ),
                                          elevation: 3,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) => Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 20),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment:
                                                    const AlignmentDirectional(
                                                            0, 0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                child:
                                                    const ConfirmarPagoWidget(),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        text: 'Efectivo',
                                        icon: Icon(
                                          Icons.euro,
                                          color: LightModeTheme().primaryText,
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40,
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 0, 0),
                                          iconPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                          color: LightModeTheme()
                                              .secondaryBackground,
                                          textStyle: LightModeTheme()
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0,
                                              ),
                                          elevation: 3,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(
                                                          0, 0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child:
                                                  const ConfirmarPagoWidget(),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      text: 'Bono',
                                      icon: Icon(
                                        Icons.star_border,
                                        color: LightModeTheme().primaryText,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        color: LightModeTheme()
                                            .secondaryBackground,
                                        textStyle: LightModeTheme()
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0,
                                            ),
                                        elevation: 3,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.94, -0.88),
                      child: FlutterFlowIconButton(
                        borderColor: LightModeTheme().errorGeneral,
                        borderRadius: 20,
                        borderWidth: 0,
                        buttonSize: 40,
                        fillColor: LightModeTheme().errorGeneral,
                        icon: Icon(
                          Icons.close,
                          color: LightModeTheme().secondaryBackground,
                          size: 24,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
