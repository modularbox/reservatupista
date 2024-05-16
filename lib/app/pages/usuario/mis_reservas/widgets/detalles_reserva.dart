import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/build_usuarios.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../mis_reservas_c.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class DetalleReserva extends GetView<MisReservasController> {
  const DetalleReserva(
      {super.key,
      required this.capacidad,
      required this.reservasUsuarios,
      required this.idReserva,
      required this.state});
  final int capacidad;
  final ReservasUsuarios? reservasUsuarios;
  final String idReserva;
  final MisReservasUsuarioModel state;
  MisReservasController get self => controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(30),
            color: LightModeTheme().secondaryBackground,
          ),
          margin: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Detalles Reserva',
                  textAlign: TextAlign.center,
                  style: LightModeTheme().bodyLarge.copyWith(fontSize: 30),
                ),
              ),
              BuildUsuarios(
                capacidad: capacidad,
                reservasUsuarios: reservasUsuarios,
                divide: 20.0,
              ),
              20.0.sh,
              buildCancelarReserva(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Tiempo cancelacion'),
                            Obx(buildTextHorario)
                          ],
                        ),
                        buildDetalles(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget buildCancelarReserva() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnIcon(
          onPressed: () async {
            await self.eliminarReserva(idReserva);
          },
          icon: Text(
            'Cancelar Reserva',
            style: LightModeTheme().bodyMedium.copyWith(fontSize: 18),
          ),
          fillColor: LightModeTheme().error,
          padding: const EdgeInsets.all(10.0),
          hoverColor: Colores.usuario.primary69,
          borderColor: Colores.rojo,
          borderWidth: 1,
          borderRadius: 8.0,
        ),
      ],
    );
  }

  Widget buildDetalles() {
    final List<List<String>> detalles = [
      ['Nº Reserva', '# ${state.referencia}'],
      ['Nivel', 'Libre'],
      ['Total precio', state.dineroPagado.euro],
      ['Localidad', state.localidad],
      ['Deporte', state.deporte],
      ['Nº de Pista', state.numPista.toString()],
      ['Luz', 'Si'],
      ['Iluminación', state.iluminacion],
      ['Automatizada', state.automatizada == 0 ? 'No' : 'Si'],
      ['Pista', state.pista],
      ['Comienza', state.horaInicio.formatHora],
      ['Finaliza', state.horaFin.formatHora],
      ['Duración', '${state.duracionPartida} Minutos'],
      ['Para cancelar con antelacion', '24 horas'],
    ];
    List<Widget> titles = [];
    List<Widget> descripcion = [];
    for (final element in detalles) {
      titles.add(
        Text(
          '${element[0]}:',
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
                fontWeight: FontWeight.w800,
              ),
        ),
      );
      titles.add(10.0.sh);
      descripcion.add(
        Text(
          element[1],
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
        ),
      );
      descripcion.add(10.0.sh);
    }
    // detalles
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: titles),
          ),
          Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: descripcion)
        ]);
  }

  Widget buildTextHorario() {
    final hour = self.fecha.hour.toString().padLeft(2, '0');
    final minute = self.fecha.minute.toString().padLeft(2, '0');
    final second = self.fecha.second.toString().padLeft(2, '0');
    return Text(
      '$hour:$minute:$second',
      style: LightModeTheme().displayMedium.override(
            fontFamily: 'Outfit',
            color: LightModeTheme().accent1,
            fontSize: 12,
            letterSpacing: 0,
          ),
    );
  }
}
