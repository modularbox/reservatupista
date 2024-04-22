import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/chip_data.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/widgets/checker.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/widgets/popup_datos_socios_pendiente.dart';
import '../../../../backend/schema/enums/enums.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import 'mis_socios_c.dart';
import 'Socio.dart';
import 'widgets/popup_datos_socios2.dart';

class MisSociosPage extends GetView<MisSociosController> {
  MisSociosPage({super.key});
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
        title: 'Mis Pistas',
        page: TypePage.MisReservas,
        child: Expanded(child: ListaSociosWidget()));
    //sdaas
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
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 10),
                          child: SearchAnchor(
                              isFullScreen: false,
                              viewHintText: "Buscar socio...",
                              viewSurfaceTintColor:
                                  LightModeTheme().secondaryBackground,
                              viewBackgroundColor:
                                  LightModeTheme().primaryBackground,
                              builder: (BuildContext context,
                                  SearchController controller) {
                                return SearchBar(
                                  backgroundColor: MaterialStateProperty.all(
                                      LightModeTheme().secondaryBackground),
                                  controller: controller,
                                  surfaceTintColor: MaterialStateProperty.all(
                                      LightModeTheme().secondaryBackground),
                                  overlayColor:
                                      MaterialStateColor.resolveWith((states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return LightModeTheme().primaryBackground;
                                    }
                                    return LightModeTheme().secondaryBackground;
                                  }),
                                  padding: const MaterialStatePropertyAll<
                                          EdgeInsets>(
                                      EdgeInsets.symmetric(horizontal: 16.0)),
                                  onTap: () {
                                    controller.openView();
                                  },
                                  onChanged: (_) {
                                    controller.openView();
                                  },
                                  leading: const Icon(Icons.search),
                                );
                              },
                              suggestionsBuilder: (BuildContext context,
                                  SearchController suggestcontroller) {
                                return List.generate(
                                    controller.socios.length,
                                    (i) => Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: LightModeTheme()
                                                  .primaryBackground,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Text(
                                                  controller.socios[i].nombre,
                                                  style: LightModeTheme()
                                                      .bodyLarge,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ));
                              }),
                        ),
                      ),
                    ),
                    Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ...List.generate(controller.chips.length,
                                  (i) => buildChips(controller.chips[i], i))
                            ])),
                    ...List.generate(controller.socios.length,
                        ((i) => buildSocio(controller.socios[i]))),
                    Container(
                      width: 0,
                      height: 70,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSocio(Socio socio) {
    return Builder(
        builder: (context) => Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(7, 10, 7, 8),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  controller.socioSeleccionado = socio.id;
                  socio.isSocio()
                      ? Get.dialog(const DatosSocio2Widget())
                      : Get.dialog(const DatosSocioWidgetPendiente());
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
                        color: socio.isSocio()
                            ? LightModeTheme().successGeneral
                            : LightModeTheme().errorGeneral,
                        width: 4,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-0.96, -1.32),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                2, 15, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                socio.urlImagen,
                                width: 44,
                                height: 44,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, -0.61),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                60, 5, 12, 0),
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
                                      socio.isSocio()
                                          ? socio.nombre
                                          : socio.nick,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: const Color(0xFF14181B),
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
                                        // ignore: prefer_const_constructors
                                        child: Checker(),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  socio.isSocio() ? socio.nick : "",
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
                                      "Nivel: ${socio.nivel}",
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
                                  "Partidas jugadas: ${socio.partidasJugadas}",
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

  Widget buildChips(ChipData chip, int i) {
    return ChipTheme(
        data: (const ChipThemeData(selectedColor: Colors.amber)),
        child: FilterChip(
            showCheckmark: false,
            avatar: CircleAvatar(
              backgroundColor: controller.selectChip == i
                  ? LightModeTheme().primaryBackground
                  : LightModeTheme().secondaryBackground,
              child: Icon(controller.selectChip == i
                  ? Icons.expand_more_outlined
                  : Icons.expand_less_outlined),
            ),
            padding: const EdgeInsets.all(4),
            backgroundColor: controller.selectChip == i
                ? LightModeTheme().proveedor
                : LightModeTheme().secondaryBackground,
            label: Text(chip.label),
            deleteIcon: const Icon(Icons.cancel),
            deleteIconColor: Colors.red,
            selectedColor: LightModeTheme().proveedor,
            onSelected: (value) {
              controller.selectChip = i;
              controller.cambiarChip();
            }));
  }
}
