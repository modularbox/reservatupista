import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'package:reservatu_pista/app/routes/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';
import 'package:reservatu_pista/utils/sizer.dart';

Widget buildUsuarios() {
  final datosHardCode = {
    "plazas_reservadas_totales": 2,
    "usuarios": [
      {
        "id_usuario": "1",
        "nick": "djsab7",
        "imagen": "1710273751351",
        "plazas_reservadas": 1
      },
      {
        "id_usuario": "1",
        "nick": "adshj7",
        "imagen": "1710273751351",
        "plazas_reservadas": 1
      }
    ],
    "message": "Bien"
  };
  final ReservarPistaController self = Get.find();
  // Cancelar la reserva
  RxBool cancelarReserva = false.obs;

  /// Obtener los usuarios con reservas
  // final Rx<ReservasUsuarios> reservas_usuarios =
  //     Rx<ReservasUsuarios>(ReservasUsuarios.fromJson(datosHardCode));

  self.obtenerPlazasLibres();

  /// Capacidad para reservar
  final int capacidad = self.pistas.value[self.selectPista.value!]['capacidad'];

  /// Datos usuarios a reservar
  final Rx<ReservaUsuario> usuario = Rx<ReservaUsuario>(ReservaUsuario(
      idUsuario: '8',
      nick: 'mynick',
      imagen: '1710273751351',
      plazasReservadas: 0));

  return Obx(() {
    final reservas_usuarios = self.reservas_usuarios.value;
    if (reservas_usuarios is ReservasUsuarios) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            children: [
              ...List.generate(reservas_usuarios.usuarios.length,
                  (index) => buildUsuario(reservas_usuarios.usuarios[index])),
              self.reservas_usuarios.value == null
                  ? const SizedBox.shrink()
                  : buildButton(
                      (capacidad -
                          (reservas_usuarios.plazasReservadasTotales +
                              usuario.value.plazasReservadas)),
                      usuario,
                      cancelarReserva),
            ].divide(2.0.sw),
          ),
        ),
        Obx(() => BtnIcon(
              onPressed: () {
                if (cancelarReserva.value) {
                  usuario.value.plazasReservadas = 0;
                  usuario.refresh();
                  cancelarReserva.value = false;
                } else {
                  usuario.value.plazasReservadas =
                      reservas_usuarios.plazasReservadasTotales;
                  usuario.refresh();
                  cancelarReserva.value = true;
                }
              },
              fillColor: cancelarReserva.value
                  ? Colores().rojo
                  : Colores().usuario.primary,
              borderRadius: 10,
              padding: const EdgeInsets.all(0),
              size: const Size(80, 60),
              icon: Text(
                cancelarReserva.value ? 'Cancelar' : 'Reservar\ntodo',
                style:
                    LightModeTheme().bodyMedium.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ))
      ]);
    }
    return const SizedBox.shrink();
  });
}

Widget buildButton(
    int length, Rx<ReservaUsuario> usuario, RxBool cancelarReserva) {
  return Row(
    children: [
      buildUsuario(usuario.value),
      ...List.generate(
          length >= 0 ? length : 0,
          (index) => Column(
                children: [
                  BtnIcon(
                      onPressed: () {
                        usuario.value.plazasReservadas += 1;
                        usuario.refresh();
                        cancelarReserva.value = true;
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
                  Text('')
                ],
              ))
    ],
  );
}

Widget buildUsuario(ReservaUsuario user) {
  return Row(
      children: List.generate(
    user.plazasReservadas,
    (index) => Column(
      children: [
        Stack(
          children: [
            BtnIcon(
              onPressed: () {},
              padding: const EdgeInsets.all(0),
              borderRadius: 35.0,
              size: const Size(50, 50),
              borderWidth: 2,
              hoverColor: Colores().usuario.primary69,
              borderColor: Colores().usuario.primary,
              fillColor: Colors.white,
              icon: SizedBox.shrink(),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              child: ImageServer(
                height: 50,
                width: 50,
                changeImage: user.imagen,
              ),
            ),
          ],
        ),
        Text(user.nick)
      ],
    ),
  ));
}
