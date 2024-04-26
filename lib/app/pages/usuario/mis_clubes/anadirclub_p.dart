import 'package:reservatu_pista/app/pages/usuario/mis_clubes/anadirclub_c.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class BuscarClubWidget extends GetView<AnadirClubController> {
  const BuscarClubWidget({super.key});

  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Mis clubes',
        page: TypePage.MisReservas,
        child: Expanded(child: _BuscarClubWidgetState()));
  }
}

class _BuscarClubWidgetState extends GetView<AnadirClubController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  AnadirClubController get _model => controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: LightModeTheme().primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 8, 0),
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Buscar',
                            labelStyle: LightModeTheme().labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: LightModeTheme().primaryText,
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintStyle: LightModeTheme().labelMedium.override(
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
                              borderSide: const BorderSide(
                                color: Color(0xFF4B39EF),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(7, 15, 7, 8),
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
                            'https://images.unsplash.com/photo-1646649853703-7645147474ba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMnx8cGFkZWx8ZW58MHx8fHwxNzExMzk5MjQ4fDA&ixlib=rb-4.0.3&q=80&w=1080',
                            width: MediaQuery.sizeOf(context).width,
                            height: 83,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.01, -0.75),
                          child: Text(
                            'Ayto. Riolobos',
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Text(
                                    'Riolobos',
                                    style: LightModeTheme().bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ),
                                Text(
                                  'Miembro desde hace 4 años',
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
                                onPressed: () {},
                                iconSize: 50,
                                color: Colors.amber,
                                icon: Icon(Icons.star_border))),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(7, 15, 7, 8),
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
                            'https://images.unsplash.com/photo-1574379989050-bfd9e1a8a543?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8cGFkZWx8ZW58MHx8fHwxNzExMzk5MjQ4fDA&ixlib=rb-4.0.3&q=80&w=1080',
                            width: MediaQuery.sizeOf(context).width,
                            height: 83,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.01, -0.75),
                          child: Text(
                            'Cáceres Padel',
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Text(
                                    'Cáceres',
                                    style: LightModeTheme().bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ),
                                Text(
                                  'Miembro desde hace 2 meses',
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
                                onPressed: () {},
                                iconSize: 50,
                                color: Colors.amber,
                                icon: Icon(Icons.star_border))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
