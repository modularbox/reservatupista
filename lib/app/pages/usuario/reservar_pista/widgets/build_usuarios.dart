import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'package:reservatu_pista/app/routes/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';
import 'package:reservatu_pista/utils/sizer.dart';

Widget buildUsuarios() {
  //ReservarPistaController reservarPistaController = ReservarPistaController();
  final ReservarPistaController self = Get.find();
  // Cancelar la reserva

  /// Obtener los usuarios con reservas
  // final Rx<ReservasUsuarios> reservas_usuarios =
  //     Rx<ReservasUsuarios>(ReservasUsuarios.fromJson(datosHardCode));

  //self.obtenerPlazasLibres();

  /// Capacidad para reservar
  final int capacidad = self.pistas.value[self.selectPista.value!]['capacidad'];

  return Obx(() {
    final reservas_usuarios = self.reservas_usuarios.value;
    if (reservas_usuarios is ReservasUsuarios) {
      final int plazasReservadasTotales =
          reservas_usuarios.plazasReservadasTotales;
      //if (usuario.value.plazasReservadas == 0) usuario.value.plazasReservadas++;
      print(
          'usuario.value.plazasReservadas4 ${self.usuario.value.plazasReservadas}');
      //usuario.value.plazasReservadas = 3;
      print(
          '(capacidad - (plazasReservadasTotales + self.usuario.value.plazasReservadas)) ${(capacidad - (plazasReservadasTotales + self.usuario.value.plazasReservadas))}');
      print(
          '(capacidad - (plazasReservadasTotales + self.usuario.value.plazasReservadas2)) ${(capacidad - (plazasReservadasTotales + self.plazas_a_reservar.value))}');
      print(
          'plazasReservadasTotalesplazasReservadasTotales $plazasReservadasTotales');
      print(
          'usuario.value.plazasReservadasusuario.value.plazasReservadas ${self.usuario.value.plazasReservadas}');
      print(
          'reservas_usuarios.usuarios.length ${reservas_usuarios.usuarios.length}');
      //self.precio_a_mostrar.value =
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
                          (plazasReservadasTotales +
                              self.usuario.value.plazasReservadas)),
                      self.usuario,
                      self.cancelarReserva,
                      self),
            ].divide(2.0.sw),
          ),
        ),
        Obx(() => BtnIcon(
              onPressed: () {
                if (self.cancelarReserva.value) {
                  self.usuario.value.plazasReservadas = 1;
                  //self.plazas_a_reservar.value = 1;
                  self.cancelarReserva.value = false;
                  self.plazasLibres = capacidad - plazasReservadasTotales;
                } else {
                  int plazas_a_reservar = capacidad - plazasReservadasTotales;
                  self.plazasLibres = 0;
                  //self.plazas_a_reservar.value = plazas_a_reservar;
                  self.usuario.value.plazasReservadas = plazas_a_reservar;
                  self.cancelarReserva.value = true;
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

Widget buildButton(int length, Rx<ReservaUsuario> usuario,
    RxBool cancelarReserva, ReservarPistaController self) {
  print('lengthhh $length');
  print('usuario.value.reser $length');
  return Row(
    children: [
      buildUsuario(usuario.value),
      ...List.generate(
          length >= 0 ? length : 0,
          (index) => Column(
                children: [
                  BtnIcon(
                      onPressed: () {
                        int precio = self.pista_con_luces.value
                            ? self.precio_con_luz_no_socio.value
                            : self.precio_sin_luz_no_socio.value;
                        self.precio_elegido.value = precio;
                        /*print(
                            'usuario.value.plazasReservadas33 ${usuario.value.plazasReservadas}');
                        print(
                            'self.precio_a_mostrar.value ${self.precio_a_mostrar.value}');
                        print(
                            'usuario.value.plazasReservadas1 ${usuario.value.plazasReservadas}');*/
                        usuario.value.plazasReservadas += 1;
                        self.plazasLibres -= 1;

                        //self.plazas_a_reservar.value += 1;
                        print(
                            'usuario.value.plazasReservadas2 ${usuario.value.plazasReservadas}');

                        final precio_a_mostrar =
                            precio * usuario.value.plazasReservadas;

                        /*final precio_a_mostrar =
                            precio * self.plazas_a_reservar.value;*/
                        print(
                            'precio_a_mostrarprecio_a_mostrar ${precio_a_mostrar}');
                        //if (self.plazas_a_reservar.value < 5)
                        //  self.plazas_a_reservar.value += 1;

                        /*print(
                            'usuario.value.plazasReservadas fake ${self.plazas_a_reservar.value}');*/

                        self.precio_a_mostrar.value = precio_a_mostrar;

                        cancelarReserva.value = true;
                        usuario.refresh();
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
  print('user.plazasReservadas ${user.plazasReservadas}');

  return Row(
      children: List.generate(
    user.plazasReservadas,
    (index) => Column(
      children: [
        Stack(
          children: [
            BtnIcon(
              onPressed: () {
                print('user.plazasReservadas22 ${user.plazasReservadas}');
              },
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
