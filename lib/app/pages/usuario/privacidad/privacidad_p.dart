import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:reservatu_pista/app/pages/usuario/privacidad/menu_privacidad_model.dart';
import 'package:reservatu_pista/app/pages/usuario/privacidad/privacidad_c.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
export 'menu_privacidad_model.dart';

class MenuPrivacidadWidget extends GetView<PrivacidadController> {
  const MenuPrivacidadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Historial',
        page: TypePage.None,
        child: Expanded(child: _MenuPrivacidadWidgetState()));
  }
}

class _MenuPrivacidadWidgetState extends GetView<PrivacidadController> {
  late MenuPrivacidadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
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
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                        child: Text(
                          'Selecciona qué información deseas que sea visible en tu perfil público.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0,
                                  ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Text(
                                'Público',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
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
                                  activeColor: FlutterFlowTheme.of(context)
                                      .successGeneral,
                                  activeTrackColor: Color(0xFFDAF8E8),
                                  inactiveTrackColor: Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context).errorGeneral,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Switch(
                                    value: _model.switchValue2 ??= true,
                                    onChanged: (newValue) async {},
                                    activeColor: FlutterFlowTheme.of(context)
                                        .successGeneral,
                                    activeTrackColor: Color(0xFFDAF8E8),
                                    inactiveTrackColor: Color(0xFFFBDAD7),
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .errorGeneral,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: LightModeTheme().secondaryText,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
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
                                  activeColor: FlutterFlowTheme.of(context)
                                      .successGeneral,
                                  activeTrackColor: Color(0xFFDAF8E8),
                                  inactiveTrackColor: Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context).errorGeneral,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Switch(
                                    value: _model.switchValue4 ??= true,
                                    onChanged: (newValue) async {},
                                    activeColor: FlutterFlowTheme.of(context)
                                        .successGeneral,
                                    activeTrackColor: Color(0xFFDAF8E8),
                                    inactiveTrackColor: Color(0xFFFBDAD7),
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .errorGeneral,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: LightModeTheme().secondaryText,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
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
                                  value: _model.switchValue5 ??= true,
                                  onChanged: (newValue) async {},
                                  activeColor: FlutterFlowTheme.of(context)
                                      .successGeneral,
                                  activeTrackColor: Color(0xFFDAF8E8),
                                  inactiveTrackColor: Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context).errorGeneral,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Switch(
                                    value: _model.switchValue6 ??= true,
                                    onChanged: (newValue) async {},
                                    activeColor: FlutterFlowTheme.of(context)
                                        .successGeneral,
                                    activeTrackColor: Color(0xFFDAF8E8),
                                    inactiveTrackColor: Color(0xFFFBDAD7),
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .errorGeneral,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: LightModeTheme().secondaryText,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
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
                                  value: _model.switchValue7 ??= true,
                                  onChanged: (newValue) async {},
                                  activeColor: FlutterFlowTheme.of(context)
                                      .successGeneral,
                                  activeTrackColor: Color(0xFFDAF8E8),
                                  inactiveTrackColor: Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context).errorGeneral,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Switch(
                                    value: _model.switchValue8 ??= true,
                                    onChanged: (newValue) async {},
                                    activeColor: FlutterFlowTheme.of(context)
                                        .successGeneral,
                                    activeTrackColor: Color(0xFFDAF8E8),
                                    inactiveTrackColor: Color(0xFFFBDAD7),
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .errorGeneral,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: LightModeTheme().secondaryText,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
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
                                  value: _model.switchValue9 ??= true,
                                  onChanged: (newValue) async {},
                                  activeColor: FlutterFlowTheme.of(context)
                                      .successGeneral,
                                  activeTrackColor: Color(0xFFDAF8E8),
                                  inactiveTrackColor: Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context).errorGeneral,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Switch(
                                    value: _model.switchValue10 ??= true,
                                    onChanged: (newValue) async {},
                                    activeColor: FlutterFlowTheme.of(context)
                                        .successGeneral,
                                    activeTrackColor: Color(0xFFDAF8E8),
                                    inactiveTrackColor: Color(0xFFFBDAD7),
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .errorGeneral,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: LightModeTheme().secondaryText,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
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
                                  value: _model.switchValue11 ??= true,
                                  onChanged: (newValue) async {},
                                  activeColor: FlutterFlowTheme.of(context)
                                      .successGeneral,
                                  activeTrackColor: Color(0xFFDAF8E8),
                                  inactiveTrackColor: Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context).errorGeneral,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Switch(
                                    value: _model.switchValue12 ??= true,
                                    onChanged: (newValue) async {},
                                    activeColor: FlutterFlowTheme.of(context)
                                        .successGeneral,
                                    activeTrackColor: Color(0xFFDAF8E8),
                                    inactiveTrackColor: Color(0xFFFBDAD7),
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .errorGeneral,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: LightModeTheme().secondaryText,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
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
                                  value: _model.switchValue13 ??= true,
                                  onChanged: (newValue) async {},
                                  activeColor: FlutterFlowTheme.of(context)
                                      .successGeneral,
                                  activeTrackColor: Color(0xFFDAF8E8),
                                  inactiveTrackColor: Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context).errorGeneral,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Switch(
                                    value: _model.switchValue14 ??= true,
                                    onChanged: (newValue) async {},
                                    activeColor: FlutterFlowTheme.of(context)
                                        .successGeneral,
                                    activeTrackColor: Color(0xFFDAF8E8),
                                    inactiveTrackColor: Color(0xFFFBDAD7),
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .errorGeneral,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: LightModeTheme().secondaryText,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
