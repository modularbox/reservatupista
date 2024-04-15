import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'popup_expulsar_socio.dart';

class DatosSocio2Widget extends StatefulWidget {
  const DatosSocio2Widget({super.key});

  @override
  State<DatosSocio2Widget> createState() => _DatosSocio2WidgetState();
}

class _DatosSocio2WidgetState extends State<DatosSocio2Widget> {
  final datos = [
    "Nombre: ",
    "Nivel: ",
    "DNI: ",
    "Dirección: ",
    "Partidas jugadas: ",
    "Posición: ",
    "Horario: ",
    "Email: ",
    "Teléfono: ",
    "Fecha de alta: ",
  ];
  final datosSubtitulos = [
    "José Durán García",
    "4.00",
    "123456789A",
    "Calle Falsa nº1",
    "48",
    "Revés",
    "Mañana",
    "email@reservatupista.com",
    "654321987",
    "12/04/2024"
  ];
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Text getTexto(String info) {
    return Text(
      info,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
          fontFamily: 'Readex Pro',
          letterSpacing: 0,
          decoration: TextDecoration.none),
    );
  }

  Text getTextoCabecera(String cabecera) {
    var pesoLetrasCabecera = FontWeight.bold;
    return Text(
      cabecera,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
          fontFamily: 'Readex Pro',
          letterSpacing: 0,
          fontWeight: pesoLetrasCabecera,
          decoration: TextDecoration.none),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 500,
              height: 700,
              constraints: BoxConstraints(
                maxWidth: 700,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: Color(0x33000000),
                    offset: Offset(
                      0,
                      5,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 12, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nick',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                            decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1, -1),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 44,
                              fillColor:
                                  FlutterFlowTheme.of(context).errorGeneral,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 12, 0, 12),
                                child: Text(
                                  'Datos personales:',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0,
                                          decoration: TextDecoration.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ...List.generate(
                            datos.length,
                            ((i) => buildTituloySubtitulo(
                                datos[i], datosSubtitulos[i]))),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 2, 0, 2),
                                  child: getTextoCabecera("Le quedan: "),
                                ),
                                Text(
                                  '12 días',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFE62310),
                                          letterSpacing: 0,
                                          decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 5, 0, 2),
                              child: getTextoCabecera("Bonos: "),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              buildBono("Descuento:", "3€"),
                              buildBono("Descuento:", "5%"),
                              buildBono("Partidas:", "3"),
                              buildBono("Descuento", "5€"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildBoton(
                                "Mensaje",
                                Icon(
                                  Icons.message_rounded,
                                  size: 15,
                                ),
                                LightModeTheme().successGeneral),
                            buildBoton(
                                "Email",
                                Icon(
                                  Icons.email_rounded,
                                  size: 15,
                                ),
                                LightModeTheme().successGeneral)
                          ],
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),

                          //
                          //Preguntar a Miguel
                          //

                          /*Función dinámica
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0, 0)
                                      .resolve(Directionality.of(context)),
                                  child: ExpulsarSocioWidget(),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          */
                          child: buildBoton(
                              "Expulsar",
                              Icon(
                                Icons.dangerous,
                                size: 15,
                              ),
                              LightModeTheme().errorGeneral)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTituloySubtitulo(String titulo, String subtitulo) {
    return Align(
      alignment: AlignmentDirectional(-1, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 2, 0, 2),
              child: getTextoCabecera(titulo),
            ),
            getTexto(subtitulo),
          ],
        ),
      ),
    );
  }

  Widget buildBono(String tipo, String digito) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Material(
        color: Colors.transparent,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryText,
              width: 2,
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                  child: Text(
                    tipo,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 10,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Text(
                  digito,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 20,
                        letterSpacing: 0,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBoton(String label, Icon icono, Color color) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: label,
      icon: icono,
      options: FFButtonOptions(
        height: 40,
        width: 150,
        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: color,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0,
            ),
        elevation: 3,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
