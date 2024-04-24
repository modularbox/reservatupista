import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'package:reservatu_pista/app/routes/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';
import 'package:reservatu_pista/utils/sizer.dart';

class SelectedUsuarios extends GetView<ReservarPistaController> {
  const SelectedUsuarios({super.key});

  ReservarPistaController get self => controller;
  // Precio de la reserva
  int get precio => self.pista_con_luces.value
      ? self.precio_con_luz_no_socio.value
      : self.precio_sin_luz_no_socio.value;
  // Capacidad de la pista
  int get capacidad => self.pistas.value[self.selectPista.value!]['capacidad'];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print("capacidad: ${capacidad}");
      // ignore: non_constant_identifier_names
      final reservas_usuarios = self.reservas_usuarios.value;
      if (reservas_usuarios is ReservasUsuarios) {
        final int plazasReservadasTotales =
            reservas_usuarios.plazasReservadasTotales;
        final tamanoBotones = self.cancelarReserva.value
            ? capacidad
            : (capacidad -
                (plazasReservadasTotales +
                    self.usuario.value.plazasReservadas));
        print("tamanoBotones : $tamanoBotones");
        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              children: [
                (self.cancelarReserva.value && !self.totalMisReservas)
                    ? const SizedBox.shrink()
                    : Row(
                        children: List.generate(
                            reservas_usuarios.usuarios.length,
                            (index) => buildUsuario(
                                  reservas_usuarios.usuarios[index],
                                  true,
                                ))),
                self.reservas_usuarios.value == null
                    ? const SizedBox.shrink()
                    : buildButton(
                        tamanoBotones,
                        self.cancelarReserva,
                      ),
              ].divide(2.0.sw),
            ),
          ),
          Obx(() => capacidad == 0
              ? const SizedBox.shrink()
              : BtnIcon(
                  onPressed: () {
                    if (self.cancelarReserva.isTrue) {
                      self.usuario.value.plazasReservadas = 1;
                      self.plazas_a_reservar.value = 1;
                      self.cancelarReserva.value = false;
                    } else {
                      self.totalMisReservas =
                          todasMisReservas(self.plazas_a_reservar.value);
                      if (self.totalMisReservas) {
                        self.cancelarReserva.value = true;
                        self.usuario.value.plazasReservadas += 1;
                        self.plazas_a_reservar.value += 1;
                      } else {
                        // ignore: non_constant_identifier_names
                        self.plazas_a_reservar.value = capacidad;
                        self.usuario.value.plazasReservadas = capacidad;
                        self.cancelarReserva.value = true;
                      }
                    }
                    self.precio_a_mostrar.value = self.precio_elegido.value *
                        self.usuario.value.plazasReservadas;
                    self.usuario.refresh();
                  },
                  fillColor: self.cancelarReserva.value
                      ? Colores().rojo
                      : Colores().usuario.primary,
                  borderRadius: 10,
                  padding: const EdgeInsets.all(0),
                  size: const Size(80, 60),
                  icon: Text(
                    self.cancelarReserva.value ? 'Cancelar' : 'Reservar\ntodo',
                    style: LightModeTheme()
                        .bodyMedium
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ))
        ]);
      }
      return const SizedBox.shrink();
    });
  }

  Widget buildButton(
    int length,
    RxBool cancelarReserva,
  ) {
    return Row(
      children: [
        buildUsuario(self.usuario.value, false),
        self.cancelarReserva.value
            ? const SizedBox.shrink()
            : Row(
                children: List.generate(
                    length >= 0 ? length : 0,
                    (index) => Column(
                          children: [
                            BtnIcon(
                                onPressed: () {
                                  self.precio_elegido.value = precio;
                                  self.usuario.value.plazasReservadas += 1;
                                  self.plazas_a_reservar.value += 1;
                                  if (self.plazas_a_reservar.value ==
                                      (capacidad)) {
                                    self.cancelarReserva.value = true;
                                  }
                                  self.totalMisReservas = todasMisReservas(
                                      self.plazas_a_reservar.value);
                                  if (self.totalMisReservas) {
                                    self.cancelarReserva.value = true;
                                  }
                                  final precio_a_mostrar = precio *
                                      self.usuario.value.plazasReservadas;
                                  self.precio_a_mostrar.value =
                                      precio_a_mostrar;
                                  self.usuario.refresh();
                                },
                                padding: const EdgeInsets.all(0),
                                borderRadius: 35.0,
                                size: const Size(50, 50),
                                borderWidth: 2,
                                hoverColor: Colores().usuario.primary69,
                                borderColor: Colores().usuario.primary,
                                fillColor: Colors.white,
                                icon: Icon(
                                  Icons.add,
                                  color: Colores().usuario.primary,
                                  size: 30,
                                  weight: 2,
                                )),
                            const Text('')
                          ],
                        )))
      ],
    );
  }

  Widget buildUsuario(ReservaUsuario user, bool isPlazaReservada) {
    return Row(
        children: List.generate(
      user.plazasReservadas,
      (index) => Column(
        children: [
          BtnIcon(
            onPressed: index == 0 || (self.cancelarReserva.isTrue)
                ? null
                : () {
                    self.usuario.value.plazasReservadas -= 1;
                    self.plazas_a_reservar.value -= 1;
                    // ignore: non_constant_identifier_names
                    final precio_a_mostrar =
                        precio * self.usuario.value.plazasReservadas;
                    self.precio_a_mostrar.value = precio_a_mostrar;
                    if (self.plazas_a_reservar <= capacidad) {
                      self.cancelarReserva.value = false;
                    }
                    self.usuario.refresh();
                  },
            padding: const EdgeInsets.all(0),
            borderRadius: 35.0,
            size: const Size(50, 50),
            borderWidth: 2,
            hoverColor: Colores().usuario.primary69,
            borderColor:
                isPlazaReservada ? Colores().orange : Colores().usuario.primary,
            fillColor: Colors.white,
            icon: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              child: ImageServer(
                height: 50,
                width: 50,
                changeImage: user.imagen,
              ),
            ),
          ),
          Text(user.nick)
        ],
      ),
    ));
  }

  /// Verificar si todas las reservas son del usuario y si tiene alguna pendiente
  bool todasMisReservas(int plazasReservadas) {
    print("TodasMisReservas");
    final idUsuario = self.usuario.value.idUsuario;
    print(idUsuario);
    print(self.reservas_usuarios.value!.usuarios);
    int total = 0;
    for (final reserva_usuario in self.reservas_usuarios.value!.usuarios) {
      print("total");
      print(
          "reserva_usuario.plazasReservada ${reserva_usuario.plazasReservadas}");
      print(reserva_usuario.plazasReservadas + plazasReservadas);
      if (reserva_usuario.idUsuario == idUsuario) {
        total += reserva_usuario.plazasReservadas;
      }
    }
    print(
        "totalssssss: ${total} : ${self.reservas_usuarios.value!.plazasReservadasTotales}");
    return total == self.reservas_usuarios.value!.plazasReservadasTotales &&
        total != 0;
  }
}
