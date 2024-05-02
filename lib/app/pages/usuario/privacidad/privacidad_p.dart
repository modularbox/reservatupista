import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'privacidad_c.dart';
export 'menu_privacidad_model.dart';

class MenuPrivacidadWidget extends GetView<PrivacidadController> {
  const MenuPrivacidadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Privacidad',
        page: TypePage.None,
        child: Expanded(child: _MenuPrivacidadWidgetState()));
  }
}

class _MenuPrivacidadWidgetState extends GetView<PrivacidadController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PrivacidadController get _model => controller;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: LightModeTheme().primaryBackground,
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
                      alignment: const AlignmentDirectional(0, 0),
                      child: Text(
                        'Privacidad',
                        textAlign: TextAlign.center,
                        style: LightModeTheme().headlineLarge.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                      child: Text(
                        'Selecciona qué información deseas que sea visible en tu perfil público.',
                        style: LightModeTheme().bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            decoration: const BoxDecoration(),
                          ),
                          Text(
                            'Amigos',
                            style: LightModeTheme().titleLarge.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 20, 0),
                            child: Text(
                              'Público',
                              style: LightModeTheme().titleLarge.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: LightModeTheme().primaryBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: LightModeTheme().primaryText,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Nick',
                                  style: LightModeTheme().titleMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: LightModeTheme().primaryText,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                              Switch(
                                value: true,
                                onChanged: (newValue) async {},
                                activeColor: LightModeTheme().successGeneral,
                                activeTrackColor: const Color(0xFFDAF8E8),
                                inactiveTrackColor: const Color(0xFFFBDAD7),
                                inactiveThumbColor:
                                    LightModeTheme().errorGeneral,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 0),
                                child: Switch(
                                  value: true,
                                  onChanged: (newValue) async {},
                                  activeColor: LightModeTheme().successGeneral,
                                  activeTrackColor: const Color(0xFFDAF8E8),
                                  inactiveTrackColor: const Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      LightModeTheme().errorGeneral,
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
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: LightModeTheme().primaryBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: LightModeTheme().primaryText,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Imagen',
                                  style: LightModeTheme().titleMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: LightModeTheme().primaryText,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                              Switch(
                                value: true,
                                onChanged: (newValue) async {},
                                activeColor: LightModeTheme().successGeneral,
                                activeTrackColor: const Color(0xFFDAF8E8),
                                inactiveTrackColor: const Color(0xFFFBDAD7),
                                inactiveThumbColor:
                                    LightModeTheme().errorGeneral,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 0),
                                child: Switch(
                                  value: true,
                                  onChanged: (newValue) async {},
                                  activeColor: LightModeTheme().successGeneral,
                                  activeTrackColor: const Color(0xFFDAF8E8),
                                  inactiveTrackColor: const Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      LightModeTheme().errorGeneral,
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
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: LightModeTheme().primaryBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: LightModeTheme().primaryText,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Nombre',
                                  style: LightModeTheme().titleMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: LightModeTheme().primaryText,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                              Switch(
                                value: true,
                                onChanged: (newValue) async {},
                                activeColor: LightModeTheme().successGeneral,
                                activeTrackColor: const Color(0xFFDAF8E8),
                                inactiveTrackColor: const Color(0xFFFBDAD7),
                                inactiveThumbColor:
                                    LightModeTheme().errorGeneral,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 0),
                                child: Switch(
                                  value: true,
                                  onChanged: (newValue) async {},
                                  activeColor: LightModeTheme().successGeneral,
                                  activeTrackColor: const Color(0xFFDAF8E8),
                                  inactiveTrackColor: const Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      LightModeTheme().errorGeneral,
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
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: LightModeTheme().primaryBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: LightModeTheme().primaryText,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Teléfono',
                                  style: LightModeTheme().titleMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: LightModeTheme().primaryText,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                              Switch(
                                value: true,
                                onChanged: (newValue) async {},
                                activeColor: LightModeTheme().successGeneral,
                                activeTrackColor: const Color(0xFFDAF8E8),
                                inactiveTrackColor: const Color(0xFFFBDAD7),
                                inactiveThumbColor:
                                    LightModeTheme().errorGeneral,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 0),
                                child: Switch(
                                  value: true,
                                  onChanged: (newValue) async {},
                                  activeColor: LightModeTheme().successGeneral,
                                  activeTrackColor: const Color(0xFFDAF8E8),
                                  inactiveTrackColor: const Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      LightModeTheme().errorGeneral,
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
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: LightModeTheme().primaryBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: LightModeTheme().primaryText,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Dirección',
                                  style: LightModeTheme().titleMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: LightModeTheme().primaryText,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                              Switch(
                                value: true,
                                onChanged: (newValue) async {},
                                activeColor: LightModeTheme().successGeneral,
                                activeTrackColor: const Color(0xFFDAF8E8),
                                inactiveTrackColor: const Color(0xFFFBDAD7),
                                inactiveThumbColor:
                                    LightModeTheme().errorGeneral,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 0),
                                child: Switch(
                                  value: true,
                                  onChanged: (newValue) async {},
                                  activeColor: LightModeTheme().successGeneral,
                                  activeTrackColor: const Color(0xFFDAF8E8),
                                  inactiveTrackColor: const Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      LightModeTheme().errorGeneral,
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
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: LightModeTheme().primaryBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: LightModeTheme().primaryText,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Nivel',
                                  style: LightModeTheme().titleMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: LightModeTheme().primaryText,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                              Switch(
                                value: true,
                                onChanged: (newValue) async {},
                                activeColor: LightModeTheme().successGeneral,
                                activeTrackColor: const Color(0xFFDAF8E8),
                                inactiveTrackColor: const Color(0xFFFBDAD7),
                                inactiveThumbColor:
                                    LightModeTheme().errorGeneral,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 0),
                                child: Switch(
                                  value: true,
                                  onChanged: (newValue) async {},
                                  activeColor: LightModeTheme().successGeneral,
                                  activeTrackColor: const Color(0xFFDAF8E8),
                                  inactiveTrackColor: const Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      LightModeTheme().errorGeneral,
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
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: LightModeTheme().primaryBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: LightModeTheme().primaryText,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Localidad',
                                  style: LightModeTheme().titleMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: LightModeTheme().primaryText,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                              Switch(
                                value: true,
                                onChanged: (newValue) async {},
                                activeColor: LightModeTheme().successGeneral,
                                activeTrackColor: const Color(0xFFDAF8E8),
                                inactiveTrackColor: const Color(0xFFFBDAD7),
                                inactiveThumbColor:
                                    LightModeTheme().errorGeneral,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 0),
                                child: Switch(
                                  value: true,
                                  onChanged: (newValue) async {},
                                  activeColor: LightModeTheme().successGeneral,
                                  activeTrackColor: const Color(0xFFDAF8E8),
                                  inactiveTrackColor: const Color(0xFFFBDAD7),
                                  inactiveThumbColor:
                                      LightModeTheme().errorGeneral,
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
                    Container(
                      height: 45,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
