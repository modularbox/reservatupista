import 'package:reservatu_pista/app/pages/usuario/privacidad/menu_privacidad_model.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
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
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              iconTheme: IconThemeData(color: Color(0xFFFF0000)),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 61,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              title: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        'Privacidad',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 24, 0),
                          child: badges.Badge(
                            badgeContent: Text(
                              '1',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                            ),
                            showBadge: true,
                            shape: badges.BadgeShape.circle,
                            badgeColor: FlutterFlowTheme.of(context).primary,
                            elevation: 4,
                            padding: EdgeInsets.all(8),
                            position: badges.BadgePosition.topEnd(),
                            animationType: badges.BadgeAnimationType.scale,
                            toAnimate: true,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Icon(
                                    Icons.notifications_none,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Icon(
                                    Icons.chat_bubble_outline_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/logo_reservatupista.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: true,
              elevation: 0,
            )
          ],
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
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue1 = newValue!);
                                  },
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
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.switchValue2 = newValue!);
                                    },
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
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue3 = newValue!);
                                  },
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
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.switchValue4 = newValue!);
                                    },
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
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue5 = newValue!);
                                  },
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
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.switchValue6 = newValue!);
                                    },
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
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue7 = newValue!);
                                  },
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
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.switchValue8 = newValue!);
                                    },
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
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue9 = newValue!);
                                  },
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
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.switchValue10 = newValue!);
                                    },
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
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue11 = newValue!);
                                  },
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
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.switchValue12 = newValue!);
                                    },
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
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue13 = newValue!);
                                  },
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
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.switchValue14 = newValue!);
                                    },
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
