import 'package:reservatu_pista/app/pages/usuario/mis_clubes/anadirclub_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/detalles_clubs/detalles_club_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/mis_clubes_c.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:get/get.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class MisClubesWidget extends GetView<MisClubesController> {
  const MisClubesWidget({super.key});

  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Mis clubes',
        page: TypePage.MisReservas,
        child: Expanded(child: _MisClubesWidgetState()));
  }
}

class _MisClubesWidgetState extends GetView<MisClubesController> {
  MisClubesController get _model => controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Builder(
        builder: (context) {
          return SafeArea(
            top: false,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(1, 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 15, 7, 8),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: GestureDetector(
                            onTap: () => Get.to(DetalleClubWidget()),
                            child: Container(
                              height: 180,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(
                                      0.0,
                                      2,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1612534847738-b3af9bc31f0c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxwYWRlbHxlbnwwfHx8fDE3MTEzOTkyNDh8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 83,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.01, -0.75),
                                    child: Text(
                                      'Nombre club',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 25,
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0.56),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Text(
                                              'Riolobos',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 20,
                                                        letterSpacing: 0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            'Miembro desde hace 4 años',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 20,
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 15, 7, 8),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            height: 180,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x230E151B),
                                  offset: Offset(
                                    0.0,
                                    2,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 2,
                              ),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1601646761285-65bfa67cd7a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxwYWRlbHxlbnwwfHx8fDE3MTEzOTkyNDh8MA&ixlib=rb-4.0.3&q=80&w=400',
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 83,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.01, -0.75),
                                  child: Text(
                                    'Nombre club',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 25,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0.56),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: Text(
                                            'Riolobos',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 20,
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          'Miembro desde hace 4 años',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(1, 1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 60),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: 100,
                              borderWidth: 0,
                              buttonSize: 70,
                              fillColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 40,
                              ),
                              onPressed: () async {
                                Get.to(BuscarClubWidget());
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
