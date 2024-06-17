// ignore_for_file: non_constant_identifier_names
import 'package:get/get.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/utils/auto_size_text/auto_size_text.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dialog/recargar_dialog.dart';
import 'monedero_c.dart';

class MonederoPage extends StatefulWidget {
  const MonederoPage({super.key});

  @override
  State<MonederoPage> createState() => _MonederoPageState();
}

class _MonederoPageState extends State<MonederoPage> {
  MonederoController self = Get.find();
  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }
    Widget buildBtnOption(
        String title, TypeHistorial typeHistorial, Color color) {
      bool isTypeHistorial = self.type != typeHistorial;
      return FFButtonWidget(
          text: title,
          onPressed: () {
            if (typeHistorial == TypeHistorial.reserva) {
              self.mostrarHistorialReservas();
            } else if (typeHistorial == TypeHistorial.recarga) {
              self.mostrarHistorialRecargas();
            } else if (typeHistorial == TypeHistorial.all) {
              self.mostrarHistorialTodo();
            }
            self.type = typeHistorial;
          },
          options: FFButtonOptions(
              textStyle: TextStyle(
                  color: isTypeHistorial ? Colors.blue : Colors.white),
              borderSide: isTypeHistorial
                  ? const BorderSide(color: Colors.blue, width: 2)
                  : null,
              color: isTypeHistorial ? Colors.white : color,
              borderRadius: BorderRadius.circular(30)));
    }

    return NavbarYAppbarUsuario(
      title: 'Monedero Virtual',
      page: TypePage.Monedero,
      child: Expanded(
        child: Padding(
          padding: paddingHorizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveWeb(
                child: Container(
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: LightModeTheme().secondary,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 0.0),
                        spreadRadius: 1.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: 250,
                          height: 65.0,
                          decoration: BoxDecoration(
                            color: LightModeTheme().secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 28.0,
                        decoration: BoxDecoration(
                          color: LightModeTheme().secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Obx(() => Text(
                                    self.db.dineroTotal.euro,
                                    style:
                                        LightModeTheme().headlineLarge.override(
                                              fontFamily: 'Outfit',
                                              color: const Color(0xFF14181B),
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                  )),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                self.money = 0;
                                RecargaDialog(
                                        context: context,
                                        page: 0,
                                        title: 'Recargar')
                                    .dialog();
                              },
                              text: 'Recargar', //alvaro
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF46EF98),
                                textStyle: LightModeTheme().titleSmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: LightModeTheme().primaryText,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            self.animationsMap['columnOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ).animateOnPageLoad(
                    self.animationsMap['containerOnPageLoadAnimation']!),
              ),
              Padding(
                padding: paddingVertical,
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        buildBtnOption(
                            'Reservas', TypeHistorial.reserva, Colores.rojo),
                        buildBtnOption(
                            'Recargas', TypeHistorial.recarga, Colores.verde),
                        buildBtnOption('Todo', TypeHistorial.all, Colores.azul),
                      ].divide(paddingSize.sw),
                    )),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Obx(() => ResponsiveWeb(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            (self.type == TypeHistorial.reserva)
                                ? buildReservas()
                                : const SizedBox(),
                            (self.type == TypeHistorial.recarga)
                                ? buildRecargas()
                                : const SizedBox(),
                            (self.type == TypeHistorial.all)
                                ? buildReservasRegargas()
                                : const SizedBox(),
                          ],
                        ),
                      )),
                ),
              )),
            ].addToStart(paddingSize.sh),
          ),
        ),
      ),
    );
  }

  Widget buildReservasRegargas() {
    return self.historial_todo.obx(
        (state) => SingleChildScrollView(
              child: Column(
                children: List.generate(
                  state!.length,
                  (i) => state[i]['id_reserva'] != null
                      ? buildReserva(state[i])
                      : _buildRecarga(state[i]),
                ).divide(paddingSize.sh).addToEnd((context.paddingBottom).sh),
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
          child: Text('\nNo se encontraron Reservas ni Recargas.',
              style: LightModeTheme().bodyMedium.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
        ));
  }

  Widget buildReservas() {
    return self.historial_reservas.obx(
        (state) => SingleChildScrollView(
              child: Column(
                children: List.generate(
                  state!.length,
                  (i) => buildReserva(state[i]),
                ).divide(paddingSize.sh).addToEnd(context.paddingBottom.sh),
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
          child: Text('\nNo se encontraron Reservas.',
              style: LightModeTheme().bodyMedium.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
        ));
  }

  Widget buildReserva(Map<String, dynamic> state) {
    print('STATE: $state');
    return Card(
      shadowColor: Colores.rojo,
      elevation: 1.5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: Colores.rojo,
            width: 2.0,
          )),
      margin: const EdgeInsets.all(0),
      color: LightModeTheme().secondaryBackground,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: paddingAll,
        child: _buildContentReservas(state),
      ),
    );
  }

  Widget buildRecargas() {
    return self.historial_recargas.obx(
        (state) => SingleChildScrollView(
              child: Column(
                children: List.generate(
                  state!.length,
                  (i) => _buildRecarga(state[i]),
                ).divide(paddingSize.sh).addToEnd(context.paddingBottom.sh),
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
          child: Text('\nNo se encontraron Recargas.',
              style: LightModeTheme().bodyMedium.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
        ));
  }

  Widget _buildRecarga(Map<String, dynamic> state) {
    return Card(
        shadowColor: Colores.verde,
        elevation: 1.5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: Colores.verde,
              width: 2.0,
            )),
        margin: const EdgeInsets.all(0),
        color: LightModeTheme().secondaryBackground,
        surfaceTintColor: Colors.white,
        child:
            Padding(padding: paddingAll, child: _buildContentRecarga(state)));
  }

  Widget _buildContentReservas(Map<String, dynamic> state) {
    // final int dinero_pagado = state['dinero_pagado'];
    final String fecha = state['timestamp'];
    final String tipoOperacion = state['tipo_reserva'];
    final String deporte = state['deporte'];
    final String localidad = state['localidad'];
    final String nombreClub = state['nombre'];
    final int costeTotalReserva = state['coste_inicial_reserva'];
    final String referencia = state['referencia'];
    final String? canceladaPor = state['cancelada_por'] ?? 'usuario';
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/icon_recarga.png',
          width: 30.0,
          height: 30.0,
          fit: BoxFit.cover,
        ),
        3.0.sw,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reserva',
                    style: LightModeTheme().bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 18.0,
                        ),
                  ),
                  Text(
                    '- ${costeTotalReserva.euro}',
                    textAlign: TextAlign.end,
                    style: LightModeTheme().headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: Colores.rojo,
                          fontSize: 18.0,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildTextReserva('Deporte: $deporte'),
                      _buildTextReserva('Nombre Club: $nombreClub'),
                      _buildTextReserva('Localidad: $localidad'),
                      _buildTextReserva(
                          'Fecha: ${DateTime.parse(fecha).formatReserva}'),
                      _buildTextReserva(
                        'Hora: ${fecha.formatHoraTimestamp}',
                      ),
                      _buildTextReserva('#$referencia'),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      alignment: Alignment.bottomRight,
                      constraints: const BoxConstraints(maxWidth: 100),
                      child: AutoSizeText(
                        tipoOperacion.formatTipoOperacion,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: LightModeTheme()
                            .headlineSmall
                            .copyWith(color: Colores.azul),
                        minFontSize: 12,
                        maxFontSize: 14,
                        stepGranularity: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text _buildTextReserva(String text) {
    return Text(
      text,
      style: LightModeTheme().labelMedium,
    );
  }

  Widget _buildContentRecarga(Map<String, dynamic> state) {
    final int dinero_pagado = state['cantidad'];
    final String fecha = state['fecha_reserva'];
    final String tipoOperacion = state['tipo_recarga'];
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/icon_recarga.png',
          width: 30.0,
          height: 30.0,
          fit: BoxFit.cover,
        ),
        3.0.sw,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tipoOperacion == 'recarga_por_cancelacion'
                        ? 'Abono'
                        : 'Recarga',
                    style: LightModeTheme().bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 18.0,
                        ),
                  ),
                  Text(
                    '+ ${dinero_pagado.euro}',
                    textAlign: TextAlign.end,
                    style: LightModeTheme().headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: Colores.sucessGeneral,
                          fontSize: 18.0,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Fecha: ${DateTime.parse(fecha).formatReserva}',
                        style: LightModeTheme().labelMedium,
                      ),
                      Text(
                        'Hora: ${fecha.formatHoraTimestamp}',
                        style: LightModeTheme().labelMedium,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      alignment: Alignment.bottomRight,
                      constraints: const BoxConstraints(maxWidth: 100),
                      child: AutoSizeText(
                        tipoOperacion.formatTipoOperacion,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: LightModeTheme()
                            .headlineSmall
                            .copyWith(color: Colores.azul),
                        minFontSize: 12,
                        maxFontSize: 14,
                        stepGranularity: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  // Text(
                  //   tipoOperacion.formatTipoOperacion,
                  //   style: LightModeTheme().bodyMedium.override(
                  //       fontFamily: 'Readex Pro',
                  //       color: LightModeTheme().primary,
                  //       fontSize: 10.0),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
