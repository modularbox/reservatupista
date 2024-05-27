import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_bonos/widgets/comprar_bonos.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mis_bonos_c.dart';

class MisBonosPage extends GetView<MisBonosController> {
  const MisBonosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Mis bonos',
        page: TypePage.None,
        child: Expanded(child: _MisBonosWidgetState()));
  }
}

class _MisBonosWidgetState extends GetView<MisBonosController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: LightModeTheme().primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(7, 15, 7, 8),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Container(
                              height: 320,
                              decoration: BoxDecoration(
                                color: LightModeTheme().secondaryBackground,
                                boxShadow: const [
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
                                  color: LightModeTheme().primaryText,
                                  width: 2,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0, -1),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1646649853703-7645147474ba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMnx8cGFkZWx8ZW58MHx8fHwxNzExNTM0MTgyfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0, -1),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 5, 0, 0),
                                      child: Text(
                                        'Ayto Riolobos',
                                        style: LightModeTheme()
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: LightModeTheme()
                                                  .secondaryBackground,
                                              fontSize: 25,
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 1),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 10, 15),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.12,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        LightModeTheme().info,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                      color: LightModeTheme()
                                                          .primaryText,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0, 5, 0, 0),
                                                        child: Text(
                                                          'Descuento:',
                                                          style:
                                                              LightModeTheme()
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          '5%',
                                                          style:
                                                              LightModeTheme()
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        40,
                                                                    letterSpacing:
                                                                        0,
                                                                  ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.12,
                                                  decoration: BoxDecoration(
                                                    color: LightModeTheme()
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                      color: LightModeTheme()
                                                          .primaryText,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0, 5, 0, 0),
                                                        child: Text(
                                                          'Bono:',
                                                          style:
                                                              LightModeTheme()
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  3, 3, 3, 0),
                                                          child: Text(
                                                            'Bono 10 partidas por las mañanas',
                                                            style:
                                                                LightModeTheme()
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          14,
                                                                      letterSpacing:
                                                                          0,
                                                                    ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0, 3, 0, 0),
                                                          child: Text(
                                                            'Quedan 3',
                                                            style:
                                                                LightModeTheme()
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          13,
                                                                      letterSpacing:
                                                                          0,
                                                                    ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 7, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 2,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.4,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.12,
                                                    decoration: BoxDecoration(
                                                      color: LightModeTheme()
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      border: Border.all(
                                                        color: LightModeTheme()
                                                            .primaryText,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0, 5, 0, 0),
                                                          child: Text(
                                                            'Descuento:',
                                                            style:
                                                                LightModeTheme()
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0, 0),
                                                          child: Text(
                                                            '3€',
                                                            style:
                                                                LightModeTheme()
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          40,
                                                                      letterSpacing:
                                                                          0,
                                                                    ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 2,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.4,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.12,
                                                    decoration: BoxDecoration(
                                                      color: LightModeTheme()
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      border: Border.all(
                                                        color: LightModeTheme()
                                                            .primaryText,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: LightModeTheme()
                                                          .secondaryBackground,
                                                      borderRadius: 0,
                                                      borderWidth: 1,
                                                      buttonSize: 40,
                                                      fillColor: LightModeTheme()
                                                          .secondaryBackground,
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: LightModeTheme()
                                                            .primaryText,
                                                        size: 50,
                                                      ),
                                                      onPressed: () async {
                                                        Get.to(
                                                            ComprarBonosWidget());
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0, -1),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 30, 0, 0),
                                      child: Text(
                                        'Riolobos',
                                        style: LightModeTheme()
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: LightModeTheme()
                                                  .secondaryBackground,
                                              fontSize: 25,
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 1),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}