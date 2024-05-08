import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'menu_privacidad_model.dart';
export 'menu_privacidad_model.dart';

class MenuPrivacidadWidget extends StatefulWidget {
  const MenuPrivacidadWidget({super.key});

  @override
  State<MenuPrivacidadWidget> createState() => _MenuPrivacidadWidgetState();
}

class _MenuPrivacidadWidgetState extends State<MenuPrivacidadWidget> {
  late MenuPrivacidadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuPrivacidadModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Privacidad',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                  child: Text(
                    'Selecciona qué información deseas que sea visible en tu perfil público.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(),
                      ),
                      Text(
                        'Amigos',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Text(
                          'Público',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Nick',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Switch(
                            value: _model.switchValue1 ??= true,
                            onChanged: (newValue) async {},
                            activeColor: LightModeTheme().accent2,
                            activeTrackColor: LightModeTheme().accent4,
                            inactiveTrackColor: LightModeTheme().accent4,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).errorGeneral,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Switch(
                              value: _model.switchValue2 ??= true,
                              onChanged: (newValue) async {},
                              activeColor: LightModeTheme().accent2,
                              activeTrackColor: LightModeTheme().accent4,
                              inactiveTrackColor: LightModeTheme().accent4,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).errorGeneral,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).accent3,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Imagen',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Switch(
                            value: _model.switchValue3 ??= true,
                            onChanged: (newValue) async {},
                            activeColor: LightModeTheme().accent2,
                            activeTrackColor: LightModeTheme().accent4,
                            inactiveTrackColor: Color(0xFFFBDAD7),
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).errorGeneral,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Switch(
                              value: _model.switchValue4 ??= true,
                              onChanged: (newValue) async {},
                              activeColor: LightModeTheme().accent2,
                              activeTrackColor: LightModeTheme().accent4,
                              inactiveTrackColor: Color(0xFFFBDAD7),
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).errorGeneral,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).accent3,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Nombre',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Switch(
                            value: _model.switchValue5 ??= false,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue5 = newValue!);
                            },
                            activeColor:
                                FlutterFlowTheme.of(context).successGeneral,
                            activeTrackColor: Color(0xFFDAF8E8),
                            inactiveTrackColor: Color(0xFFFBDAD7),
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).errorGeneral,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Switch(
                              value: _model.switchValue6 ??= false,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue6 = newValue!);
                              },
                              activeColor:
                                  FlutterFlowTheme.of(context).successGeneral,
                              activeTrackColor: Color(0xFFDAF8E8),
                              inactiveTrackColor: Color(0xFFFBDAD7),
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).errorGeneral,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).accent3,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Teléfono',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Switch(
                            value: _model.switchValue7 ??= false,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue7 = newValue!);
                            },
                            activeColor:
                                FlutterFlowTheme.of(context).successGeneral,
                            activeTrackColor: Color(0xFFDAF8E8),
                            inactiveTrackColor: Color(0xFFFBDAD7),
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).errorGeneral,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Switch(
                              value: _model.switchValue8 ??= false,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue8 = newValue!);
                              },
                              activeColor:
                                  FlutterFlowTheme.of(context).successGeneral,
                              activeTrackColor: Color(0xFFDAF8E8),
                              inactiveTrackColor: Color(0xFFFBDAD7),
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).errorGeneral,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).accent3,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Dirección',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Switch(
                            value: _model.switchValue9 ??= false,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue9 = newValue!);
                            },
                            activeColor:
                                FlutterFlowTheme.of(context).successGeneral,
                            activeTrackColor: Color(0xFFDAF8E8),
                            inactiveTrackColor: Color(0xFFFBDAD7),
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).errorGeneral,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Switch(
                              value: _model.switchValue10 ??= false,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.switchValue10 = newValue!);
                              },
                              activeColor:
                                  FlutterFlowTheme.of(context).successGeneral,
                              activeTrackColor: Color(0xFFDAF8E8),
                              inactiveTrackColor: Color(0xFFFBDAD7),
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).errorGeneral,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).accent3,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Nivel',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Switch(
                            value: _model.switchValue11 ??= false,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue11 = newValue!);
                            },
                            activeColor:
                                FlutterFlowTheme.of(context).successGeneral,
                            activeTrackColor: Color(0xFFDAF8E8),
                            inactiveTrackColor: Color(0xFFFBDAD7),
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).errorGeneral,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Switch(
                              value: _model.switchValue12 ??= false,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.switchValue12 = newValue!);
                              },
                              activeColor:
                                  FlutterFlowTheme.of(context).successGeneral,
                              activeTrackColor: Color(0xFFDAF8E8),
                              inactiveTrackColor: Color(0xFFFBDAD7),
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).errorGeneral,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).accent3,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Localidad',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Switch(
                            value: _model.switchValue13 ??= false,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue13 = newValue!);
                            },
                            activeColor:
                                FlutterFlowTheme.of(context).successGeneral,
                            activeTrackColor: Color(0xFFDAF8E8),
                            inactiveTrackColor: Color(0xFFFBDAD7),
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).errorGeneral,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Switch(
                              value: _model.switchValue14 ??= false,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.switchValue14 = newValue!);
                              },
                              activeColor:
                                  FlutterFlowTheme.of(context).successGeneral,
                              activeTrackColor: Color(0xFFDAF8E8),
                              inactiveTrackColor: Color(0xFFFBDAD7),
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).errorGeneral,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).accent3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
