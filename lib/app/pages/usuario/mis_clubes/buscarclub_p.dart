import 'package:reservatu_pista/app/pages/usuario/mis_clubes/buscarclub_c.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/detalles_clubs/detalles_club_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/modelos/club.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class BuscarClubWidget extends GetView<BuscarClubController> {
  const BuscarClubWidget({super.key});

  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Añadir club',
        page: TypePage.None,
        child: Expanded(child: _BuscarClubWidgetState()));
  }
}

class _BuscarClubWidgetState extends GetView<BuscarClubController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuscarClubController get _model => controller;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BuscarClubController());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: LightModeTheme().primaryBackground,
      body: SafeArea(
        top: true,
        child: Obx(() => Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ...List.generate(controller.clubes.length,
                    (i) => buildClub(context, controller.clubes[i])),
              ],
            )),
      ),
    );
  }

  Padding buildClub(BuildContext context, Club club) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7, 15, 7, 8),
      child: GestureDetector(
        onTap: () {
          Get.to(const DetalleClubWidget());
        },
        child: Material(
          color: Colors.transparent,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            height: 180,
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
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    club.urlImagen,
                    width: MediaQuery.sizeOf(context).width,
                    height: 83,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.01, -0.75),
                  child: Text(
                    club.nombre,
                    style: LightModeTheme().displaySmall.override(
                          fontFamily: 'Outfit',
                          color: LightModeTheme().secondaryBackground,
                          fontSize: 25,
                          letterSpacing: 0,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0.56),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Text(
                            club.localidad,
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                        Text(
                          'Miembro desde hace ${club.antiguedad} años',
                          style: LightModeTheme().bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          club.esFavorito.value = !club.esFavorito.value;
                        },
                        iconSize: 50,
                        color: Colors.amber,
                        icon: club.esFavorito.value
                            ? Icon(Icons.star)
                            : Icon(Icons.star_border))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
