import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class ConfirmarPagoWidget extends StatefulWidget {
  const ConfirmarPagoWidget({super.key});

  @override
  State<ConfirmarPagoWidget> createState() => _ConfirmarPagoWidgetState();
}

class _ConfirmarPagoWidgetState extends State<ConfirmarPagoWidget> {
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
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Container(
            width: 400,
            height: 270,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
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
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Confirmación de cobro',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 25,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Text(
                                'Forma de pago:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              'Precio:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
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
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Text(
                                'Efectivo',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              '4€',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
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
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Confirmar',
                              options: FFButtonOptions(
                                height: 40,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                color:
                                    FlutterFlowTheme.of(context).successGeneral,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 18,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.94, -0.88),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).errorGeneral,
                    borderRadius: 20,
                    borderWidth: 0,
                    buttonSize: 40,
                    fillColor: FlutterFlowTheme.of(context).errorGeneral,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
      ],
    );
  }
}
