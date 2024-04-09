import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/reservar_pista_c.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/server/image_server.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../routes/database.dart';
import 'dart:convert';

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
  final DatabaseController db = Get.find();
  final ReservarPistaController self = Get.find();

  /// Obtener los usuarios con reservas

  final Rx<ReservasUsuarios> reservas_usuarios =
      Rx<ReservasUsuarios>(ReservasUsuarios.fromJson(datosHardCode));
  // int max_reservas_usuarios = 4;
  final int capacidad = self.pistas.value[self.selectPista.value!]['capacidad'];
  final Rx<Usuario> usuarioYo = Rx<Usuario>(Usuario(
      idUsuario: '8',
      nick: 'mynick',
      imagen: '1710273751351',
      plazasReservadas: 1));
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Row(
        children: [
          ...List.generate(reservas_usuarios.value.usuarios.length,
              (index) => buildUsuario(reservas_usuarios.value.usuarios[index])),
          Obx(() => Row(
                children: List.generate(
                    capacidad - reservas_usuarios.value.plazasReservadasTotales,
                    (index) => buildButton(index, usuarioYo)),
              ))
        ].divide(2.0.sw),
      ),
      Obx(() => BtnIcon(
            onPressed: () {
              if (self.cancelarReserva.value) {
                self.listReservas.value =
                    self.listReservas.map((e) => e = false).toList();
                self.cancelarReserva.value = false;
              } else {
                self.listReservas.value =
                    self.listReservas.map((e) => e = true).toList();
                self.cancelarReserva.value = true;
              }
            },
            fillColor: self.cancelarReserva.value
                ? Colores().rojo
                : Colores().usuario.primary,
            borderRadius: 10,
            size: const Size(130, 30),
            icon: Text(
              self.cancelarReserva.value ? 'Cancelar' : 'Reservar todo',
              style: LightModeTheme().bodyMedium.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ))
    ]),
  );
}

Widget buildButton(int index, Rx<Usuario> usuario) {
  print(index);
  return index < usuario.value.plazasReservadas
      ? buildUsuario(usuario.value)
      : Column(
          children: [
            BtnIcon(
                onPressed: () {
                  usuario.value.plazasReservadas += 1;
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
        );
}

Widget buildUsuario(Usuario user) {
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

class ReservasUsuarios {
  int plazasReservadasTotales;
  List<Usuario> usuarios;
  String message;

  ReservasUsuarios({
    required this.plazasReservadasTotales,
    required this.usuarios,
    required this.message,
  });

  factory ReservasUsuarios.fromRawJson(String str) =>
      ReservasUsuarios.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservasUsuarios.fromJson(Map<String, dynamic> json) =>
      ReservasUsuarios(
        plazasReservadasTotales: json["plazas_reservadas_totales"],
        usuarios: List<Usuario>.from(
            json["usuarios"].map((x) => Usuario.fromJson(x))),
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        "plazas_reservadas_totales": plazasReservadasTotales,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
        "message": message,
      };
}

class Usuario {
  String idUsuario;
  String nick;
  String imagen;
  int plazasReservadas;

  Usuario({
    required this.idUsuario,
    required this.nick,
    required this.imagen,
    required this.plazasReservadas,
  });

  factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUsuario: json["id_usuario"],
        nick: json["nick"],
        imagen: json["imagen"],
        plazasReservadas: json["plazas_reservadas"],
      );

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "nick": nick,
        "imagen": imagen,
        "plazas_reservadas": plazasReservadas,
      };
}
