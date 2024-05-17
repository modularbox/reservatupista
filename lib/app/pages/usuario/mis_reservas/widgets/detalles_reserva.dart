import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/build_usuarios.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/dialog/change_dialog_general.dart';
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
      required this.state,
      required this.tiempoRestante});
  final int capacidad;
  final ReservasUsuarios? reservasUsuarios;
  final String idReserva;
  final MisReservasUsuarioModel state;
  final int tiempoRestante;
  MisReservasController get self => controller;
  @override
  Widget build(BuildContext context) {
    print('statestatestate ${state.toJson()}');
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
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Column(
                      children: [
                        buildDetalles(),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCancelarReserva(),
                  20.0.sw,
                  buildWhatsappButton(),
                ],
              ),
              20.0.sh,
            ],
          )),
    );
  }

  DateTime construirDatetime(DateTime fecha, String horaInicio) {
    final hora = int.parse(horaInicio.substring(0, 2));
    final minutos = int.parse(horaInicio.substring(3, 5));
    DateTime fechaConHora = DateTime(
      fecha.year,
      fecha.month,
      fecha.day,
      hora, // Hora
      minutos, // Minuto
      0, // Segundo
    );
    print('fechaConHora $fechaConHora');
    return fechaConHora;
  }

  Widget buildCancelarReserva() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnIcon(
          onPressed: state.tipoReserva == 'tarjeta'
              ? null
              : () async {
                  if (self.tiempo_restante <= 0) {
                    Get.dialog(ChangeDialogGeneral(
                      alertTitle: richTitle("Reserva NO Cancelada"),
                      alertSubtitle: richSubtitle(
                          'La reserva no se ha podido cancelar ya que el tiempo de cancelación de reservas de esta pista es inferior al tiempo que queda para la partida.'),
                      textButton: "Cerrar",
                      alertType: TypeGeneralDialog.ERROR,
                      onPressed: () => Get.back(),
                    ));
                  } else {
                    await self.eliminarReserva(idReserva);
                  }
                },
          icon: Text(
            'Cancelar Reserva',
            style: LightModeTheme().bodyMedium.copyWith(fontSize: 18),
          ),
          fillColor: state.tipoReserva == 'tarjeta'
              ? LightModeTheme().accent1
              : LightModeTheme().error,
          padding: const EdgeInsets.all(10.0),
          hoverColor: Colores.usuario.primary69,
          borderWidth: 1,
          borderRadius: 8.0,
        ),
      ],
    );
  }

  Widget buildWhatsappButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnIcon(
          onPressed: () async {
            //await self.eliminarReserva(idReserva);
          },
          icon: Row(children: [
            Text(
              'Compartir',
              style: LightModeTheme().bodyMedium.copyWith(fontSize: 18),
            ),
            5.0.sw,
            Image.asset(
              "assets/images/icon_whatsapp.png",
              width: 20,
              height: 20,
            )
          ]),
          fillColor: LightModeTheme().successGeneral,
          padding: const EdgeInsets.all(10.0),
          hoverColor: Colores.usuario.primary69,
          borderColor: Colores.sucessGeneral,
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
    print('state.horaInicio.formatHora ${state.horaInicio.formatHora}');
    print('state.horaFin.formatHora ${state.horaFin.formatHora}');

    /// Terminar de agregar tiempo de cancelacion
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

    /// Agregar tiempo de cancelacion
    titles.add(
      Text(
        'Tiempo cancelación:',
        style: LightModeTheme().bodyMedium.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0,
              fontWeight: FontWeight.w800,
            ),
      ),
    );
    titles.add(10.0.sh);
    descripcion.add(
      Obx(buildTextHorario),
    );
    descripcion.add(10.0.sh);
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

  // String buildTextHorario() {
  //   final fecha = self.fecha;
  //   if (fecha is DateTime) {
  //     final dias = fecha.day;
  //     final hour = fecha.hour.toString().padLeft(2, '0');
  //     final minute = fecha.minute.toString().padLeft(2, '0');
  //     final second = fecha.second.toString().padLeft(2, '0');

  //     return 'Días $dias, $hour:$minute:$second';
  //   } else {
  //     return '0';
  //   }
  // }

  Widget buildTextHorario() {
    final days = ((self.tiempo_restante / 1000 / 60 / 60) / 24).floor();
    final hour = (self.tiempo_restante / 1000 / 60 / 60).floor();
    int nuevoTiempoRestante = self.tiempo_restante - (hour * 1000 * 60 * 60);
    //tiempoRestante = tiempoRestante - (hour * 1000 * 60 * 60);
    final minute = ((self.tiempo_restante / 1000 / 60) % 60).floor();
    nuevoTiempoRestante = nuevoTiempoRestante - (minute * 1000 * 60);
    final second = (nuevoTiempoRestante / 1000).floor();
    print('tiempoRestante $self.tiempo_restante');
    print('hour $hour');
    print('minute $minute');
    print('second $second');
    return Text(
      self.tiempo_restante == 0
          ? 'Ya no se puede cancelar'
          : 'Quedan $days Días, $hour horas, $minute minutos, $second segundos',
      style: LightModeTheme().displayMedium.override(
            fontFamily: 'Outfit',
            color: self.tiempo_restante == 0
                ? LightModeTheme().error
                : LightModeTheme().accent1,
            fontSize: 12,
            letterSpacing: 0,
          ),
    );
  }
}
