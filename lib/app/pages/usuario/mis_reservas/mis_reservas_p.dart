import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/datos_reservas_pista.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_pistas/mis_pistas_c.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/mis_reservas_c copy.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/mis_reservas_c.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/build_usuarios.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/detalles_reserva.dart';
import 'package:reservatu_pista/backend/schema/enums/enums.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';

class MisReservasPage extends GetView<MisReservasController> {
  MisReservasPage({Key? key}) : super(key: key);
  MisReservasController get self => controller;

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
      title: 'Mis Reservas',
      page: TypePage.MisReservas,
      child: Expanded(
        child: ResponsiveWeb(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => Row(
                      children: [
                        ...buildListDeportes(),
                        Obx(() => Text('Pista actual: ${self.currentPage}')),
                      ],
                    )),
              ),
              Obx(() => Text('Pagina actual: ${self.currentPage}')),
              Expanded(
                child: Listener(
                  onPointerSignal: (event) {
                    //Timer(Duration(milliseconds: 500), () {
                    print('self.isThrottling.value ${self.isThrottling.value}');
                    if (event is PointerScrollEvent &&
                        !self.isThrottling.value) {
                      self.isThrottling.value = true; // Activar la bandera
                      print(
                          'self.currentPageself.currentPageee ${self.currentPage}');
                      if (event.scrollDelta.dy < 0 &&
                          self.previousScrollPosition == 0 &&
                          self.currentPage > 1) {
                        print('Haciendo scroll hacia arriba');
                        /*if (self.currentPage != self.lastPageSelected) {
                                self.lastPageSelected = self.currentPage;
                                return;
                              } */
                        self.currentPage -= 1;
                        self.pageHaschanged.value = true;
                        print(
                            'entraaaaaaaaaaaaaaaaaaaaaaaa self.currentPage ${self.currentPage}');
                        self.previousScrollPosition = 0;
                        if (self.currentPage < 1) self.currentPage = 1;
                        self.loadMoreData();
                      } else if (event.scrollDelta.dy > 0) {
                        print('Haciendo scroll hacia abajo');
                      }
                      if (self.currentPage < 1) self.currentPage = 1;
                      print('event.position ${event.scrollDelta.dy}');
                      // Desactivar la bandera después de un corto tiempo
                      Future.delayed(Duration(milliseconds: 1500), () {
                        self.isThrottling.value = false;
                      });
                    }
                    //});
                  },
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      print(
                          'self.currentPageself.currentPage ${self.currentPage}');
                      print('self.isLoading.value ${self.isLoading.value}');
                      print(
                          'self.currentPage * self.itemsPerPage ${self.currentPage * self.itemsPerPage}');
                      print(
                          'self.misReservasUsuario.rx.value.length ${self.misReservasUsuario.rx.value.length}');
                      bool hacia_abajo = false;
                      if (scrollInfo.metrics.pixels >
                          self.previousScrollPosition) {
                        /*if (scrollInfo.metrics.pixels >= 20) {
                              hacia_abajo = false;
                            } else {
                              hacia_abajo = true;
                            }*/
                        hacia_abajo = true;
                        print("Scrolling Down"); // Scroll hacia abajo
                      } else if (scrollInfo.metrics.pixels <
                          self.previousScrollPosition) {
                        print(
                            "Scrolling Up ${scrollInfo.metrics.pixels}  self.previous ${self.previousScrollPosition}"); // Scroll hacia arriba
                        hacia_abajo = false;
                      }
                      self.previousScrollPosition = scrollInfo.metrics.pixels;
                      if (!self.isLoading.value &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent &&
                          hacia_abajo) {
                        if (self.currentPage * self.itemsPerPage <
                            (self.initialLength)) {
                          if (self.debounceTimer?.isActive ?? false)
                            self.debounceTimer!.cancel();
                          self.debounceTimer =
                              Timer(Duration(milliseconds: 500), () {
                            self.currentPage += 1;
                            print('entraaaaaaaaaaaa dentro');
                            print(
                                'entraaaaaaaaaaaa self.currentPage + ${self.currentPage}');
                            self.previousScrollPosition = 0;

                            self.loadMoreData();
                          });
                        }
                        return true;
                      } else if (!self.isLoading.value &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.minScrollExtent &&
                          !hacia_abajo) {
                        print('entraaaaaaaaaaaa inicio');
                        if (self.currentPage != self.lastPageSelected) {
                          self.lastPageSelected = self.currentPage;
                          return false;
                        }
                        // Al llegar al inicio del scroll
                        if (self.currentPage > 1) {
                          if (self.debounceTimer?.isActive ?? false)
                            self.debounceTimer!.cancel();
                          self.debounceTimer =
                              Timer(Duration(milliseconds: 500), () {
                            self.currentPage -= 1;
                            print(
                                'entraaaaaaaaaaaa self.currentPage ${self.currentPage}');
                            self.previousScrollPosition = 0;
                            self.loadMoreData();
                          });
                        }
                        return true;
                      }
                      return false;
                    },
                    child: buildReservas(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildListDeportes() {
    List<DatosDeporte> listDeportes = [];
    for (int i = 0; i < self.listaDeportes.length; i++) {
      String foto = self.listaDeportes[i].trim().toLowerCase();
      listDeportes.add(DatosDeporte(self.listaDeportes[i], foto));
      print('self.listaDeportes[i] ${self.listaDeportes[i]}');
    }
    print('listDeportes ${listDeportes}');
    return listDeportes.map((e) => buildDeporte(e)).toList();
  }

  Widget buildDeporte(DatosDeporte e) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.network(
                  DatosServer.online(e.image),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                e.nombre,
                style: TextStyle(
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
          hoverColor: Colores.proveedor.primary69,
          borderRadius: 10,
          borderWidth: self.deporte == e.nombre ? 1 : null,
          borderColor:
              self.deporte == e.nombre ? Colores.proveedor.primary : null,
          icon: Container(
            height: 70,
            width: 70,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }

  Widget buildReservas() {
    print('self.misReservasUsuario ${self.misReservasUsuario}');
    return self.misReservasUsuario.obx(
      (state) => ListView.builder(
        itemCount: state!.length + 1, // Aumenta el itemCount en 1
        itemBuilder: (context, index) {
          if (index == state.length) {
            // Este es el último elemento, añade un SizedBox para forzar el scroll
            return SizedBox(
                height: 100); // Ajusta la altura según sea necesario
          } else if (index == state.length - 1) {
            return Column(
              children: [
                buildReserva(state[index]),
                self.isLoading.value
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ColorLoader(),
                      )
                    : const SizedBox(),
              ],
            );
          } else {
            return buildReserva(state[index]);
          }
        },
      ),
      onLoading: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: SizedBox(
            width: 100,
            child: ColorLoader(
              radius: 12,
              padding: const EdgeInsets.only(right: 10),
            ),
          ),
        ),
      ),
      onEmpty: Center(
        child: Text(
          '\nNo se encontraron reservas.',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  /// Reserva
  Widget buildReserva(MisReservasUsuarioModel state) {
    // Verificar si la reserva esta cerrada
    print('state.() ${state.toJson()}');

    final isCerrada = state.reservasUsuarios != null &&
        state.reservasUsuarios!.plazasReservadasTotales == state.capacidad;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: isCerrada ? Colores.rojo : Colores.orange,
            width: 2,
          ),
        ),
        child: BtnIcon(
          hoverColor: Colores.usuario.primary69,
          borderRadius: 10,
          onPressed: () async {
            int tiempoRestante = 0;
            try {
              DateTime fechaInicioPartida =
                  self.construirDatetime(state.fechaReserva, state.horaInicio);
              DateTime fechaActual = DateTime.now();
              DateTime fechaTiempoCancelacion = fechaInicioPartida
                  .subtract(Duration(hours: state.tiempo_cancelacion));
              print('tiempoCancelacion ${state.tiempo_cancelacion}');
              print('fechaInicioPartida $fechaInicioPartida');
              print('fechaActual $fechaActual');
              print('fechaTiempoCancelacion $fechaTiempoCancelacion');

              print(
                  ' fechaTiempoCancelacion.millisecondsSinceEpoch - fechaActual.millisecondsSinceEpoch ${fechaTiempoCancelacion.millisecondsSinceEpoch - fechaActual.millisecondsSinceEpoch}');
              if (fechaActual < fechaTiempoCancelacion) {
                tiempoRestante = fechaTiempoCancelacion.millisecondsSinceEpoch -
                    fechaActual.millisecondsSinceEpoch;
                print('tiempoRestante $tiempoRestante');

                int horasRestantes = (tiempoRestante / 1000 / 60 / 60).floor();
                int minutosRestantes =
                    ((tiempoRestante / 1000 / 60) % 60).floor();
                int segundosRestantes = ((tiempoRestante / 1000) % 60).floor();

                print('horasRestantes $horasRestantes');
                print('minutosRestantes $minutosRestantes');
                print('segundosRestantes $segundosRestantes');
                self.empezarFechaRestante(tiempoRestante);
              }
            } catch (e, st) {
              print('eeeeeee $e');
              print('eeeeeee stack $st');
            }
            Get.dialog(ResponsiveWeb(
                child: DetalleReserva(
              idReserva: state.idReserva.toString(),
              capacidad: state.capacidad,
              state: state,
              reservasUsuarios: state.reservasUsuarios,
              tiempoRestante: tiempoRestante,
            )));
          },
          icon: Column(
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
                          child: ImageProveedor(
                            foto: state.foto,
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
                                  'Pista ${state.numPista} - ${state.nombrePatrocinador}',
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
                                  '#${state.referencia}',
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
                              '${state.fechaReserva.formatReserva} - ${state.horaInicio.formatHora}',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 5, 0),
                              child: Text(
                                state.dineroPagado.euro,
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
                    BuildUsuarios(
                        capacidad: state.capacidad,
                        reservasUsuarios: state.reservasUsuarios),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 5, 0),
                            child: Text(
                              state.tipoReserva,
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
