import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import 'mis_reservas_c.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MisReservasPage extends GetView<MisReservasController> {
  MisReservasPage({super.key});
  MisReservasController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
        title: 'Mis Reservas',
        page: TypePage.MisReservas,
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Obx(() => SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: buildListDeportes())
                                .animateOnPageLoad(self.animationPistaDeporte),
                          )),
                      5.0.sh,
                      buildReserva()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  /// Lista de deportes
  List<Widget> buildListDeportes() {
    final listDeportes = [
      DatosDeporte('Padel', 'U1F3BE'),
      DatosDeporte('Tenis', 'U1F3BE'),
      DatosDeporte('Badminton', 'U1F3F8'),
      DatosDeporte('P. climatizada', 'person-swimming_1f3ca'),
      DatosDeporte('Piscina', 'person-swimming_1f3ca'),
      DatosDeporte('Baloncesto', 'U1F3C0'),
      DatosDeporte('Futbol sala', 'U26BD'),
      DatosDeporte('Futbol 7', 'U26BD'),
      DatosDeporte('Futbol 11', 'U26BD'),
      DatosDeporte('Pickleball', 'U1F94D'),
      DatosDeporte('Squash', 'U1F3F8'),
      DatosDeporte('Tenis de mesa', 'U1F3D3'),
      DatosDeporte('Fronton', 'U1F3BE'),
      DatosDeporte('Balomano', 'U26BD'),
      DatosDeporte('Rugby', 'U1F3C8'),
      DatosDeporte('Multideporte', 'U1F938'),
    ];
    return listDeportes
        .mapIndexed((e, index) => buildDeporte(e, index))
        .toList();
  }

  /// Deporte
  Widget buildDeporte(DatosDeporte e, int index) {
    return Stack(
      children: [
        Padding(
          key: self.deporteKey[index],
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50,
                child: Image.network(
                  'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/${e.image}.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                e.nombre,
                style: LightModeTheme().bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                    ),
              ),
            ],
          ),
        ),
        BtnIcon(
          onPressed: () => self.onPressDeporte(e.nombre),
          padding: const EdgeInsets.all(0.0),
          hoverColor: Colores().proveedor.primary69,
          borderRadius: 10,
          borderWidth: self.deporte == e.nombre ? 1 : null,
          borderColor:
              self.deporte == e.nombre ? Colores().proveedor.primary : null,
          icon: Container(
            height: 70,
            width: self.deportesWidth.value[index],
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }

  /// Lista Reservas
  Widget buildReservas() {
    return self.misReservas.obx(
        (state) => Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    state!.length,
                    // (i) => buildReserva(state[i]),
                    (i) => buildReserva(),
                  ).divide(10.0.sh).addToEnd(65.0.sh),
                ),
              ),
            ),
        onLoading: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: SizedBox(
                width: 100,
                child: ColorLoader(
                  radius: 12,
                  padding: const EdgeInsets.only(right: 10),
                )),
          ),
        ),
        onEmpty: Center(
          child: Text('\nNo se encontraron pistas.',
              style: LightModeTheme().bodyMedium.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
        ));
  }

  /// Reserva
  // Widget buildReserva(MiReserva reserva) {
  Widget buildReserva() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          // context.pushNamed('HorasPistas');
        },
        child: Container(
          decoration: BoxDecoration(
            color: LightModeTheme().secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: LightModeTheme().primaryText,
                offset: const Offset(
                  0,
                  2,
                ),
              )
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            border: Border.all(
              color: Colores().orange,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(0),
                          ),
                          child: Image.network(
                            'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3BE.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Pista 1 - Patrocinador',
                                  style: LightModeTheme().bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 5, 0),
                                child: Text(
                                  '#12348',
                                  style: LightModeTheme().bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '10/05/2024 - 12:30',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 5, 0),
                              child: Text(
                                '4,00€',
                                style: LightModeTheme().bodyMedium.override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      4,
                      (index) => Column(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: LightModeTheme().accent4,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: LightModeTheme().primaryText,
                              ),
                            ),
                            child: Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/120/600',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            '4.25',
                            style: LightModeTheme().bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 5, 0),
                            child: Text(
                              'Tarjeta',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(const SizedBox(width: 3)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DatosDeporte {
  final String nombre;
  final String image;
  DatosDeporte(this.nombre, this.image);
}
