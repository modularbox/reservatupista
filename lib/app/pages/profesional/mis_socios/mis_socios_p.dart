import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/widgets/checker.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_choice_chips.dart';
import 'package:reservatu_pista/flutter_flow/form_field_controller.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import '../../../../backend/schema/enums/enums.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import 'mis_socios_c.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'widgets/popup_datos_socios2.dart';

class MisSociosPage extends GetView<MisSociosController> {
  MisSociosPage({super.key});
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
        title: 'Mis Pistas',
        page: TypePage.MisReservas,
        child: Expanded(child: ListaSociosWidget()));
  }
}

class ListaSociosWidget extends GetView<MisSociosController> {
  ListaSociosWidget({super.key});

  MisSociosController get _model => controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: LightModeTheme().primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 12, 8, 0),
                              child: TextFormField(
                                controller: _model.searchBarController,
                                focusNode: _model.searchBarFocusNode,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Buscar socio',
                                  labelStyle:
                                      LightModeTheme().labelMedium.override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: LightModeTheme().primaryText,
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                  hintStyle:
                                      LightModeTheme().labelMedium.override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: LightModeTheme().primaryText,
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: LightModeTheme().primaryText,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: LightModeTheme().proveedor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFFF5963),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFFF5963),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFF1F4F8),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 20, 24),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color(0xFF57636C),
                                    size: 16,
                                  ),
                                ),
                                style: LightModeTheme().bodyMedium.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0xFF14181B),
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                minLines: null,
                                validator: _model.searchBarControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 12, 12, 0),
                            child: BtnIcon(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 50,
                              icon: const Icon(
                                Icons.search_sharp,
                                color: Color(0xFF14181B),
                                size: 30,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                      child: FlutterFlowChoiceChips(
                        options: const [
                          ChipData('Nivel', null, null),
                          ChipData('Antigüedad', null, null),
                          ChipData('Tiempo restante', null, null)
                        ],
                        onChanged: (val) => _model.onCambiarChip(val),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: LightModeTheme().proveedor,
                          textStyle: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: LightModeTheme().info,
                                letterSpacing: 0,
                              ),
                          iconColor: LightModeTheme().info,
                          iconSize: 18,
                          elevation: 2,
                          borderColor: LightModeTheme().primaryText,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: LightModeTheme().secondaryBackground,
                          textStyle: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: LightModeTheme().secondaryText,
                                letterSpacing: 0,
                              ),
                          iconColor: LightModeTheme().secondaryText,
                          iconSize: 18,
                          elevation: 0,
                          borderColor: LightModeTheme().alternate,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        chipSpacing: 8,
                        rowSpacing: 12,
                        multiselect: false,
                        initialized: _model.choiceChipsValue != null,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController ??=
                            FormFieldController<List<String>>(
                          ['All'],
                        ),
                        wrapped: false,
                      ),
                    ),
                    buildSocio(
                        "José Martínez Durán",
                        "NickUno",
                        "Nivel: 4.00",
                        "Partidas jugadas: 48",
                        'https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080',
                        LightModeTheme().successGeneral,
                        1),
                    buildSocio(
                        "José Martínez Durán",
                        "NickUno",
                        "Nivel: 4.00",
                        "Partidas jugadas: 48",
                        'https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080',
                        LightModeTheme().successGeneral,
                        1),
                    buildSocio(
                        "José Martínez Durán",
                        "NickUno",
                        "Nivel: 4.00",
                        "Partidas jugadas: 48",
                        'https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080',
                        LightModeTheme().successGeneral,
                        1),
                    buildSocio(
                        "Manolo Martinez Soria",
                        "NickDos",
                        "Nivel 4.00",
                        "Partidas jugadas: 7",
                        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxmYWNlJTIwY2xvc2UlMjB8ZW58MHx8fHwxNzExNDY5NTAwfDA&ixlib=rb-4.0.3&q=80&w=1080',
                        LightModeTheme().successGeneral,
                        2),
                    buildSocio(
                        "Isabel García García",
                        "NickTres",
                        "Nivel: 4.00",
                        "Partidas jugadas: 24",
                        'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxmYWNlJTIwY2xvc2UlMjB1cHxlbnwwfHx8fDE3MTE0Njk1NzZ8MA&ixlib=rb-4.0.3&q=80&w=400',
                        LightModeTheme().successGeneral,
                        3),
                    buildSocio(
                        "NickCuatro",
                        "",
                        "",
                        "Partidas jugadas: 2",
                        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOHx8ZmFjZSUyMGNsb3NlJTIwdXB8ZW58MHx8fHwxNzExNDY5NTc2fDA&ixlib=rb-4.0.3&q=80&w=400",
                        LightModeTheme().errorGeneral,
                        4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSocio(
      String nombre,
      String nick,
      String nivel,
      String partidasJugadas,
      String urlImagen,
      Color colorBorde,
      int posicion) {
    return Builder(
        builder: (context) => Padding(
              padding: EdgeInsetsDirectional.fromSTEB(7, 10, 7, 8),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Get.dialog(const DatosSocio2Widget());
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                        color: colorBorde,
                        width: 4,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.96, -1.32),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(2, 15, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                urlImagen,
                                width: 44,
                                height: 44,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.61),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(60, 5, 12, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      nombre,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF14181B),
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Transform.scale(
                                      scaleX: 1.5,
                                      scaleY: 1.5,
                                      child: Theme(
                                        data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                Colors.black),
                                        child: Checker(),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  nick,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      nivel,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ],
                                ),
                                Text(
                                  partidasJugadas,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
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
            ));
  }
}
