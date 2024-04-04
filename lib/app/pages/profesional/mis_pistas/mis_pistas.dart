import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/backend/server_node/image_server_node.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../../backend/schema/enums/enums.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import './mis_pistas_c.dart';
import '/flutter_flow/flutter_flow_util.dart';

extension IterableExtension<E> on List<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int index) f) sync* {
    var index = 0;
    for (final element in this) {
      yield f(element, index++);
    }
  }
}

class MisPistasPage extends GetView<MisPistasController> {
  MisPistasPage({super.key});
  MisPistasController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
        title: 'Mis Pistas',
        page: TypePage.MisReservas,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => SizedBox(
                          height: 50,
                          child: PageView(
                            controller: self.pageViewController ??=
                                PageController(initialPage: 1),
                            physics: const NeverScrollableScrollPhysics(),
                            children: buildListFecha(),
                          ),
                        )),
                    Obx(() => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: buildListDeportes()),
                        )),
                  ],
                ),
                5.0.sh,
                buildPistas(),
              ],
            ),
          ),
        ));
  }

  List<Widget> buildListFecha() {
    return [buildFecha(), buildFecha(), buildFecha()];
  }

  Widget buildFecha() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BtnIcon(
            onPressed: self.previousPageBool,
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 13),
            fillColor: LightModeTheme().primary,
            borderRadius: 8,
          ),
          Expanded(
              child: Text(
            self.fecha.formatFecha,
            textAlign: TextAlign.center,
            style: LightModeTheme().bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
          )),
          BtnIcon(
            onPressed: self.nextPageBool,
            icon: const Icon(
              Icons.arrow_forward,
              size: 25,
              color: Colors.white,
            ),
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 13),
            fillColor: LightModeTheme().primary,
            borderRadius: 8,
          ),
        ],
      );

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

  Widget buildPistas() {
    return self.misPistas.obx(
        (state) => Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    state!.length,
                    (i) => InkWell(
                      splashColor: const Color.fromARGB(0, 156, 137, 137),
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: LightModeTheme().secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color.fromARGB(51, 0, 0, 0),
                              offset: Offset(
                                0,
                                2,
                              ),
                            )
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border:
                              Border.all(width: 1, color: Colores().grisClaro),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Row(
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
                                        ImageServerNetwork.pista(
                                                state[i].imagenPatrocinador)
                                            .urlImage,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    state[i].deporte,
                                    style: LightModeTheme().bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                'Pista ${state[i].numPista} - ${state[i].nombrePatrocinador}',
                                                style: LightModeTheme()
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: buildListPartidas(
                                            state[i].totalLibre,
                                            state[i].totalAbierta,
                                            state[i].totalCerrada,
                                            state[i].total),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        self.animationsMap['containerOnPageLoadAnimation']!),
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

  List<Widget> buildListPartidas(
      int totalLibre, int totalAbierta, int totalCerrada, int total) {
    return [
      buildPartida(
          title: 'Libre',
          numPartidas: totalLibre.toString(),
          color: Colores().sucessGeneral),
      buildPartida(
          title: 'Abierta',
          numPartidas: totalAbierta.toString(),
          color: Colores().orange),
      buildPartida(
          title: 'Cerrada',
          numPartidas: totalCerrada.toString(),
          color: Colores().rojo),
      buildPartida(
          title: 'Total', numPartidas: '0/$total', color: Colors.black),
    ];
  }

  Widget buildPartida({
    required String title,
    required String numPartidas,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: color,
                fontSize: 14,
                letterSpacing: 0,
              ),
        ),
        Text(
          numPartidas,
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: color,
                fontSize: 14,
                letterSpacing: 0,
              ),
        ),
      ],
    );
  }
}

class DatosDeporte {
  final String nombre;
  final String image;
  DatosDeporte(this.nombre, this.image);
}
